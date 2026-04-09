#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PWM_POLARITY.ahk

/**
 * Contains a desired value for polarity of a pin or channel.
 * @see https://learn.microsoft.com/windows/win32/api/pwm/ns-pwm-pwm_pin_set_polarity_input
 * @namespace Windows.Win32.Devices.Pwm
 */
class PWM_PIN_SET_POLARITY_INPUT extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * The desired polarity for the pin or channel as a <a href="https://docs.microsoft.com/windows/desktop/api/pwm/ne-pwm-pwm_polarity">PWM_POLARITY</a> value. The polarity is either Active High or Active Low.
     * @type {PWM_POLARITY}
     */
    Polarity {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
