#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the effective output signal period of the Pulse Width Modulation (PWM) controller.
 * @see https://learn.microsoft.com/windows/win32/api/pwm/ns-pwm-pwm_controller_set_desired_period_output
 * @namespace Windows.Win32.Devices.Pwm
 */
export default struct PWM_CONTROLLER_SET_DESIRED_PERIOD_OUTPUT {
    #StructPack 8

    /**
     * The effective output signal period, in picoseconds, of the controller.
     */
    ActualPeriod : Int64

}
