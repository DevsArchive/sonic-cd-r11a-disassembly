# Sonic CD R11A Disassembly

NOTE: This disassembly has been merged in with the [rest of my Sonic CD disassemblies.](https://github.com/Ralakimus/sonic-cd-disassembly). This repository is completely defunct now.

This is my incomplete disassembly of R11A from Sonic CD from 2020. Files are split and about half of the code is documented. It is also buildable (bitperfect, at that) and the level can be modified in SonLVL. Someone could probably use this more than me nowadays, so here it is.

Special thanks to Flamewing and TheStoneBanana for extensive help over the years.

## Quick notes
* Stack base is left as the default Sega CD one (0xFFFD00)
* DPLCs are in Sonic 2 format
* Blocks are Nemesis compressed
* Chunks are uncompressed
* Chunks are hardcoded at 0x210000 (see wiki on how to fix that)
* Object layouts have a second subtype byte
* Otherwise, formats are the same as in Sonic 1
