[![CircleCI](https://circleci.com/gh/Zikoel/nerves_system_opzp2/tree/master.svg?style=svg)](https://circleci.com/gh/Zikoel/nerves_system_opzp2/tree/master)

# Nerves System Orange Pi Zero Plus 2 (opzp2)

This is a nerves system for the specified Orange Pi board. The project starts by a complete copy of the working and well done [Raspberry Pi 3 System](https://github.com/nerves-project/nerves_system_rpi3)

## The board



# How to compile

1. `mix deps.get`
2. `mix compile`

## Error :nerves cannot compile due module Mix.Nerves.IO is not loaded and could not be found

Simple run `mix archive.install hex nerves_bootstrap`

## Error on toolchain-external-custom Configuring

`sudo apt install rename`
`rename 's/gnu/gnueabi/' .nerves/artifacts/orange_pi_zero_plus_2-portable-0.0.1/host/opt/ext-toolchain/bin/*`
