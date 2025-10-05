#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the current signal generation state of a pin.
 * @see https://learn.microsoft.com/windows/win32/DevIO/pwm-pin-is-started-output
 * @namespace Windows.Win32.Devices.Pwm
 * @version v4.0.30319
 */
class PWM_PIN_IS_STARTED_OUTPUT extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * The pin current signal generation state. A value of true means that the pin is started. A value of false means that the pin is stopped.
     * @type {Integer}
     */
    IsStarted {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
