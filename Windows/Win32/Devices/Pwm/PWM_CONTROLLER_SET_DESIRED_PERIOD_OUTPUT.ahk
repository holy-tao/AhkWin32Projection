#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the effective output signal period of the Pulse Width Modulation (PWM) controller.
 * @see https://docs.microsoft.com/windows/win32/api//pwm/ns-pwm-pwm_controller_set_desired_period_output
 * @namespace Windows.Win32.Devices.Pwm
 * @version v4.0.30319
 */
class PWM_CONTROLLER_SET_DESIRED_PERIOD_OUTPUT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The effective output signal period, in picoseconds, of the controller.
     * @type {Integer}
     */
    ActualPeriod {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
