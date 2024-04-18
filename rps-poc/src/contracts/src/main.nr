mod HandShape {
    global ROCK: Field = 0;
    global PAPER: Field = 1;
    global SCISSORS: Field = 2;
}

contract RPS {
    use dep::aztec::{
        prelude::NoteGetterOptions,
        log::emit_unencrypted_log_from_private,
        protocol_types::{abis::function_selector::FunctionSelector, address::AztecAddress, traits::Serialize},
        state_vars::{PrivateSet, PublicImmutable, SharedImmutable}
    };
    use dep::value_note::value_note::ValueNote;

    #[aztec(storage)]
    struct Storage {
        operator: SharedImmutable<AztecAddress>,
        hands: PrivateSet<ValueNote>
    }

    #[aztec(event)]
    struct WinnerSettled {
        who: AztecAddress,
    }

    #[aztec(public)]
    #[aztec(initializer)]
    fn init(operator: AztecAddress) {
        storage.operator.initialize(operator);
    }

    #[aztec(private)]
    fn play(hand: u8) { // Add struct for Hand and HandNote
        let mut note = ValueNote::new(hand as Field, context.msg_sender());
        storage.hands.insert(&mut note, true);
    }

    #[aztec(private)]
    fn match() {
        // 1) Check that msg_sender() is the operator
        let operator_address = storage.operator.read_private();
        assert(context.msg_sender() == operator_address, "Not an operator");

        // 2) Compare hands
        let options = NoteGetterOptions::new();
        let notes = storage.hands.get_notes(options);

        // Don't use unwrap
        let note1 = notes[0].unwrap_unchecked();
        let note2 = notes[1].unwrap_unchecked();

        // TODO Remove

        // 3) Emit an unencrypted event so that anyone can audit who won
        let event = WinnerSettled { who: operator_address };

        // TODO impl serialize
        // emit_unencrypted_log_from_private(&mut context, event.serialize());
    }

}
