#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PWM_POLARITY.ahk" { PWM_POLARITY }

/**
 * Contains a desired value for polarity of a pin or channel.
 * @see https://learn.microsoft.com/windows/win32/api/pwm/ns-pwm-pwm_pin_set_polarity_input
 * @namespace Windows.Win32.Devices.Pwm
 */
export default struct PWM_PIN_SET_POLARITY_INPUT {
    #StructPack 4

    /**
     * The desired polarity for the pin or channel as a <a href="https://docs.microsoft.com/windows/desktop/api/pwm/ne-pwm-pwm_polarity">PWM_POLARITY</a> value. The polarity is either Active High or Active Low.
     */
    Polarity : PWM_POLARITY

}
