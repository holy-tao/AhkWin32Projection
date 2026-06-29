#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PWM_POLARITY.ahk" { PWM_POLARITY }

/**
 * Contains a polarity value to return.
 * @see https://learn.microsoft.com/windows/win32/DevIO/pwm-pin-get-polarity-output
 * @namespace Windows.Win32.Devices.Pwm
 */
export default struct PWM_PIN_GET_POLARITY_OUTPUT {
    #StructPack 4

    /**
     * The polarity of the pin or channel as a [**PWM\_POLARITY**](/windows/desktop/api/Pwm/ne-pwm-pwm_polarity) value. The polarity is either Active High or Active Low.
     */
    Polarity : PWM_POLARITY

}
