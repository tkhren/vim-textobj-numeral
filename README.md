## vim-textobj-numeral

Text objects for numbers

## Installation

This plugin depends on [kana/vim-textobj-user](https://github.com/kana/vim-textobj-user).

### NeoBundle

```
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'tkhren/vim-textobj-numeral'
```

### Bundle

```
Bundle 'kana/vim-textobj-user'
Bundle 'tkhren/vim-textobj-numeral'
```

## Usage

### Text objects

| Textobj | General RegExp                   | Description                                    |
|:--------|:---------------------------------|:-----------------------------------------------|
| `an`    | [-+]?\d+(\\.\d+)?([Ee][-+]?\d+)? | Select the decimal number in various notation |
| `in`    | \d+                              | Select the decimal digits (integer)            |
| `ad`    | [-+]?\d+                         | Select the decimal digits with sign            |
| `id`    | \d+                              | Select the decimal digits (integer)            |
| `af`    | [-+]?\d+(\\.\d+)?                | Select the floating number with sign           |
| `if`    | \d+(\\.\d+)?                     | Select the floating number                     |
| `ax`    | (0x\|#)?\x+                      | Select the hex number with prefix              |
| `ix`    | \x+                              | Select the hex number                          |

### Motions

| Motion                     | Description                                |
|:---------------------------|:-------------------------------------------|
| `gnn`, `gNn`, `gpn`, `gPn` | Move to the nearest 'numeral' text object  |
| `gnd`, `gNd`, `gpd`, `gPd` | Move to the nearest 'digit' text object    |
| `gnf`, `gNf`, `gpf`, `gPf` | Move to the nearest 'float' text object    |
| `gnx`, `gNx`, `gpx`, `gPx` | Move to the nearest 'hex' text object      |


## Customize

The pattern for the each text objects is defined by some variables.
You can modify the regular expressions to suit your specific needs.
See `:help textobj-numeral`

### Example

Change `id` behavior

```
let g:textobj_numeral_digit_i_pattern = '[1-9]\d\+'
```

## Similar works

- [haya14busa/vim-textobj-number](https://github.com/haya14busa/vim-textobj-number)

