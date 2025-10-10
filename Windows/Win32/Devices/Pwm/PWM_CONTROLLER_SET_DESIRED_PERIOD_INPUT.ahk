#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an input value for a suggested signal period for the Pulse Width Modulation (PWM) controller.
 * @see https://docs.microsoft.com/windows/win32/api//pwm/ns-pwm-pwm_controller_set_desired_period_input
 * @namespace Windows.Win32.Devices.Pwm
 * @version v4.0.30319
 */
class PWM_CONTROLLER_SET_DESIRED_PERIOD_INPUT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The desired output signal period, in picoseconds, for the controller. This value must be greater than zero (0). It must be in the controller supported range of periods, which is between the <b>MinimumPeriod</b> and <b>MaximumPeriod</b> values, inclusive, which you can obtain by using <a href="https://docs.microsoft.com/windows/desktop/api/pwm/ni-pwm-ioctl_pwm_controller_get_info">IOCTL_PWM_CONTROLLER_GET_INFO</a>. If the value is not valid, the request is completed with a STATUS_INVALID_PARAMETER value.
     * @type {Integer}
     */
    DesiredPeriod {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
