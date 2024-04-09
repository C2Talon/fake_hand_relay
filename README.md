# fake hand relay

A kolmafia script written in ASH to compress the display of fake hands on the following pages: `charsheet.php`, `showplayer.php`, and `inventory.php`.

## Example

![fake_hand_relay.png](https://github.com/C2Talon/fake_hand_relay/blob/master/fake_hand_relay.png "example")

## Installation

To install, run the following on the gCLI:

`git checkout https://github.com/C2Talon/fake_hand_relay.git master`

## Dependency

To use this as a dependency for another relay script that also wants to override any of the `charsheet.php`, `showplayer.php`, or `inventory.php` pages, the `dep` branch can be used instead to avoid file conflicts. This will not do anything on its own, since it will only include the `fake_hand_relay.ash` script. But then `fake_hand_relay.ash` can be `import`ed and used by another relay script without worry of future file conflicts.

To include this as a dependency for another script, the following can be added to the `dependencies.txt` file for that project:

`https://github.com/C2Talon/fake_hand_relay.git dep`

