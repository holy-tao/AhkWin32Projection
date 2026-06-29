#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BATTERY_LEVEL.ahk" { BATTERY_LEVEL }
#Import ".\BATTERY_TYPE.ahk" { BATTERY_TYPE }

/**
 * Contains information on battery type and charge state.
 * @see https://learn.microsoft.com/windows/win32/api/xinput/ns-xinput-xinput_battery_information
 * @namespace Windows.Win32.UI.Input.XboxController
 */
export default struct XINPUT_BATTERY_INFORMATION {
    #StructPack 8

    BatteryType : BATTERY_TYPE

    BatteryLevel : BATTERY_LEVEL

}
