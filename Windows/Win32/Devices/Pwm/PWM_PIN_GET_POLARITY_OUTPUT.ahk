#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a polarity value to return.
 * @see https://learn.microsoft.com/windows/win32/DevIO/pwm-pin-get-polarity-output
 * @namespace Windows.Win32.Devices.Pwm
 * @version v4.0.30319
 */
class PWM_PIN_GET_POLARITY_OUTPUT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The polarity of the pin or channel as a [**PWM\_POLARITY**](/windows/desktop/api/Pwm/ne-pwm-pwm_polarity) value. The polarity is either Active High or Active Low.
     * @type {Integer}
     */
    Polarity {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
