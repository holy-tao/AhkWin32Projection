#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the effective output signal period for a Pulse Width Modulation (PWM) controller.
 * @see https://learn.microsoft.com/windows/win32/DevIO/pwm-controller-get-actual-period-output
 * @namespace Windows.Win32.Devices.Pwm
 */
export default struct PWM_CONTROLLER_GET_ACTUAL_PERIOD_OUTPUT {
    #StructPack 8

    /**
     * The effective output signal period as it would be measured on the output channels of the controller.
     */
    ActualPeriod : Int64

}
