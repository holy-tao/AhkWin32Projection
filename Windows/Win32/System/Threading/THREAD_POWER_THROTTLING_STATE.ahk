#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the throttling policies and how to apply them to a target thread when that thread is subject to power management.
 * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/ns-processthreadsapi-thread_power_throttling_state
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class THREAD_POWER_THROTTLING_STATE extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The version of the <b>THREAD_POWER_THROTTLING_STATE</b> structure.
     * 
     * | Value | Meaning |
     * | ---   | ---     |
     * | THREAD_POWER_THROTTLING_CURRENT_VERSION | The current version. |
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This field enables the caller to take control of the power throttling mechanism.
     * 
     * | Value | Meaning |
     * | ---   | ---     |
     * | THREAD_POWER_THROTTLING_EXECUTION_SPEED | Manages the execution speed of the thread. |
     * @type {Integer}
     */
    ControlMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Manages the power throttling mechanism on/off state.
     * 
     * | Value | Meaning |
     * | ---   | ---     |
     * | THREAD_POWER_THROTTLING_EXECUTION_SPEED | Manages the execution speed of the thread. |
     * @type {Integer}
     */
    StateMask {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
