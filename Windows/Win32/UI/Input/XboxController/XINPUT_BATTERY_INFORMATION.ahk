#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains information on battery type and charge state.
 * @see https://learn.microsoft.com/windows/win32/api/xinput/ns-xinput-xinput_battery_information
 * @namespace Windows.Win32.UI.Input.XboxController
 * @version v4.0.30319
 */
class XINPUT_BATTERY_INFORMATION extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * 
     * @type {Integer}
     */
    BatteryType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    BatteryLevel {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }
}
