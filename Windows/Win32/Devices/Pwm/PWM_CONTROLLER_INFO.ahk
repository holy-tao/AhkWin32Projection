#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the static information that characterizes a Pulse Width Modulation (PWM) controller.
 * @see https://learn.microsoft.com/windows/win32/api/pwm/ns-pwm-pwm_controller_info
 * @namespace Windows.Win32.Devices.Pwm
 */
export default struct PWM_CONTROLLER_INFO {
    #StructPack 8

    /**
     * The size of the structure, which includes the <b>Size</b> member. The structure byte size is used for versioning.
     */
    Size : IntPtr

    /**
     * The number of available pins or channels of the controller, which must be greater than zero (0).
     */
    PinCount : UInt32

    /**
     * The minimum supported output signal period, in picoseconds, for the controller. This value must be greater than zero and less than or equal the <b>MaximumPeriod</b> value.
     */
    MinimumPeriod : Int64

    /**
     * The maximum supported output signal period, in picoseconds, for the controller. This value must be greater than zero and greater than or equal the <b>MinimumPeriod</b> value.
     */
    MaximumPeriod : Int64

}
