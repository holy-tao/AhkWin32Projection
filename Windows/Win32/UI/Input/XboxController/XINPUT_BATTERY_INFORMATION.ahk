#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\BATTERY_TYPE.ahk
#Include .\BATTERY_LEVEL.ahk

/**
 * Contains information on battery type and charge state.
 * @see https://learn.microsoft.com/windows/win32/api/xinput/ns-xinput-xinput_battery_information
 * @namespace Windows.Win32.UI.Input.XboxController
 */
class XINPUT_BATTERY_INFORMATION extends Win32Struct {
    static sizeof => 2

    static packingSize => 1

    /**
     * @type {BATTERY_TYPE}
     */
    BatteryType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {BATTERY_LEVEL}
     */
    BatteryLevel {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }
}
