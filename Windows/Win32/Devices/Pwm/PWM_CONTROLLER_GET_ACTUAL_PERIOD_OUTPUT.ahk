#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the effective output signal period for a Pulse Width Modulation (PWM) controller.
 * @see https://learn.microsoft.com/windows/win32/DevIO/pwm-controller-get-actual-period-output
 * @namespace Windows.Win32.Devices.Pwm
 * @version v4.0.30319
 */
class PWM_CONTROLLER_GET_ACTUAL_PERIOD_OUTPUT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The effective output signal period as it would be measured on the output channels of the controller.
     * @type {Integer}
     */
    ActualPeriod {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
