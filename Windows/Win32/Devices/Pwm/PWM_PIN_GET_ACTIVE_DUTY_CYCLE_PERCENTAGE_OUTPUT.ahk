#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the current duty cycle percentage for a pin or channel in a Pulse Width Modulation (PWM) controller.
 * @see https://learn.microsoft.com/windows/win32/DevIO/pwm-pin-get-active-duty-cycle-percentage-output
 * @namespace Windows.Win32.Devices.Pwm
 */
export default struct PWM_PIN_GET_ACTIVE_DUTY_CYCLE_PERCENTAGE_OUTPUT {
    #StructPack 8

    /**
     * The current PWM signal duty cycle, as a PWM\_PERCENTAGE, which is a ULONGLONG value.
     */
    Percentage : Int64

}
