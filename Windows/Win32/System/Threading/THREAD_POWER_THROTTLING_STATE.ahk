#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the throttling policies and how to apply them to a target thread when that thread is subject to power management.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-thread_power_throttling_state
 * @namespace Windows.Win32.System.Threading
 */
export default struct THREAD_POWER_THROTTLING_STATE {
    #StructPack 4

    /**
     * The version of the <b>THREAD_POWER_THROTTLING_STATE</b> structure.
     * 
     * | Value | Meaning |
     * | ---   | ---     |
     * | THREAD_POWER_THROTTLING_CURRENT_VERSION | The current version. |
     */
    Version : UInt32

    /**
     * This field enables the caller to take control of the power throttling mechanism.
     * 
     * | Value | Meaning |
     * | ---   | ---     |
     * | THREAD_POWER_THROTTLING_EXECUTION_SPEED | Manages the execution speed of the thread. |
     */
    ControlMask : UInt32

    /**
     * Manages the power throttling mechanism on/off state.
     * 
     * | Value | Meaning |
     * | ---   | ---     |
     * | THREAD_POWER_THROTTLING_EXECUTION_SPEED | Manages the execution speed of the thread. |
     */
    StateMask : UInt32

}
