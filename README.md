# stamina_bar
Stamina bar addition for ESX Status

## INSTALLATION

1) CD into your resources folder
2) Clone the repository
```
git clone https://github.com/quicm/esx_status_stamina_bar stamina_bar
```
3) Add this to your server.cfg:

```
ensure stamina_bar
```

## CONFIGURATION
`Config.Visible`            - `true` to show the status bar, `false` to hide it

`Config.StaminaTickRate`    - Millisecond delay between stamina bar updates

`Config.StatusMax`          - Maximum value of a status, read from the [esx_status Config](https://github.com/esx-framework/esx_status/blob/master/config.lua)

## DEPENDENCIES
esx_status: https://github.com/esx-framework/esx_status