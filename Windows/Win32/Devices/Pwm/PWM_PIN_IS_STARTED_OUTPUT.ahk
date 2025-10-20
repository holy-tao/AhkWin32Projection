#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/DevIO/pwm-pin-is-started-output
 * @namespace Windows.Win32.Devices.Pwm
 * @version v4.0.30319
 */
class PWM_PIN_IS_STARTED_OUTPUT extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    IsStarted {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
