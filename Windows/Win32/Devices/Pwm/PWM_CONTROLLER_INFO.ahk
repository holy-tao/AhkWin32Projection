#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the static information that characterizes a Pulse Width Modulation (PWM) controller.
 * @see https://docs.microsoft.com/windows/win32/api//pwm/ns-pwm-pwm_controller_info
 * @namespace Windows.Win32.Devices.Pwm
 * @version v4.0.30319
 */
class PWM_CONTROLLER_INFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The size of the structure, which includes the <b>Size</b> member. The structure byte size is used for versioning.
     * @type {Pointer}
     */
    Size {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of available pins or channels of the controller, which must be greater than zero (0).
     * @type {Integer}
     */
    PinCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The minimum supported output signal period, in picoseconds, for the controller. This value must be greater than zero and less than or equal the <b>MaximumPeriod</b> value.
     * @type {Integer}
     */
    MinimumPeriod {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The maximum supported output signal period, in picoseconds, for the controller. This value must be greater than zero and greater than or equal the <b>MinimumPeriod</b> value.
     * @type {Integer}
     */
    MaximumPeriod {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
