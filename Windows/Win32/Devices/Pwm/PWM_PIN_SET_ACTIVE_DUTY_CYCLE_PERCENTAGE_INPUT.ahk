#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a desired duty cycle percentage for a pin or channel in a Pulse Width Modulation (PWM) controller.
 * @see https://learn.microsoft.com/windows/win32/DevIO/pwm-pin-set-active-duty-cycle-percentage-input
 * @namespace Windows.Win32.Devices.Pwm
 */
export default struct PWM_PIN_SET_ACTIVE_DUTY_CYCLE_PERCENTAGE_INPUT {
    #StructPack 8

    /**
     * The desired PWM signal duty cycle, as a PWM\_PERCENTAGE, which is a ULONGLONG value.
     */
    Percentage : Int64

}
