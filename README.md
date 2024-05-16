# Aztec Network: a DevEx experiment

## “Rock Paper Scissors” on-chain bets

### Motivation
BootNode's R&D unit constantly identifies promising projects with technology that aligns with its strategy. We believe that privacy is essential for enabling impactful use cases, and we think that Aztec can achieve this without compromising scalability, security, and decentralization.
We have been developing dApps for over 7 years, and most could have benefited from a privacy feature. This is why we are committed to being at the forefront, working closely with the leading teams driving the sector. 

### Goals
The goal is to gain a clear and more precise understanding of the challenges developers face when navigating the entire process of building and deploying a protocol on the Aztec Network.
We understand there's no better way to learn a new technology than performing a hands-on analysis and developing a “good first application”. In our case, Rock Paper Scissors game.


### Scope of work
- Work through a proof of concept for a rock, paper, scissors game.
- Each player runs their PXE instance. For development purposes, we’ll run two instances on different ports with the same Aztec node/sequencer.
- A rough UI to call PXE instances and their methods
- Use accounts generated by aztec-cli, hardcoded as env variables.
- Research for ways to monetize the amount of play hands for each user. If no fee/ native token is available, use some kind of ERC20.
