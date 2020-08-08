--Stamina is a value between 0 and 100, however esx_status has a default StatusMax of 1,000,000
--This means we'll need to adjust the player's stamina value to be comparable to StatusMax
local scaleValue = Config.StatusMax / 100


AddEventHandler('esx_status:loaded', function(status)
    TriggerEvent('esx_status:registerStatus',
        'stamina',          --status name
        Config.StatusMax,   --default value, using esx_status config StatusMax value
        '#d703fc',          --display colour
        function(status)    --visible
            return Config.Visible
         end,
        function(status)    --tick callback
            --We do nothing here because we're not using esx_status's configured tickrate to update the stamina bar
        end
    )
end)


AddEventHandler('esx_basicneeds:resetStatus', function()
    TriggerEvent('esx_status:set', 'stamina', Config.StatusMax)
    ResetPlayerStamina(PlayerId())
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.StaminaTickRate)
        local sprintStamRem = GetPlayerSprintStaminaRemaining(PlayerId())

        TriggerEvent('esx_status:set', 'stamina', (100.0 - sprintStamRem) * scaleValue)
    end
end)