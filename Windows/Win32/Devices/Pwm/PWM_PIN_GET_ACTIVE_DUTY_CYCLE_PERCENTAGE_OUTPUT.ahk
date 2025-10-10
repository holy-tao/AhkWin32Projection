#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Pwm
 * @version v4.0.30319
 */
class PWM_PIN_GET_ACTIVE_DUTY_CYCLE_PERCENTAGE_OUTPUT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Percentage {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
