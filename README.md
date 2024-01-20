# CallOfDuty Token Contract

## Overview

CallOfDuty is an ERC-20 token written in Solidity, simulating a virtual ammunition system. The contract includes features such as buying ammo and shooting enemies.

## Features

- **Name**: CallOfDuty
- **Symbol**: COD
- **Decimals**: 18

## Prerequisites

- Solidity ^0.8.0
- OpenZeppelin Contracts

## Contract Details

### Constructor

The constructor initializes the token with an initial supply of 10 ammo tokens, minted to the contract deployer (`msg.sender`).

### Functions

- **buyAmmo**: The `buyAmmo` function allows the owner to mint additional ammo tokens.

- **shootEnemies**: The `shootEnemies` function simulates shooting enemies, consuming ammo, and burning tokens. It checks for enough ammo and a positive number of enemies shot down.
