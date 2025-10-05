#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a desired duty cycle percentage for a pin or channel in a Pulse Width Modulation (PWM) controller.
 * @see https://learn.microsoft.com/windows/win32/DevIO/pwm-pin-set-active-duty-cycle-percentage-input
 * @namespace Windows.Win32.Devices.Pwm
 * @version v4.0.30319
 */
class PWM_PIN_SET_ACTIVE_DUTY_CYCLE_PERCENTAGE_INPUT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The desired PWM signal duty cycle, as a PWM\_PERCENTAGE, which is a ULONGLONG value.
     * @type {Integer}
     */
    Percentage {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
