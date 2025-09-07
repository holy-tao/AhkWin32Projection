#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Allows applications to configure a process to terminate if an allocation fails to commit memory. This structure is used by the PROCESS_INFORMATION_CLASS class.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_memory_exhaustion_info
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_MEMORY_EXHAUSTION_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Version should be set to <b>PME_CURRENT_VERSION</b>.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Type of failure.
     * 
     * Type should be set to <b>PMETypeFailFastOnCommitFailure</b> (this is the only type available).
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Used to turn the feature on or off.
     * 
     * <table>
     * <tr>
     * <td>Function</td>
     * <td> Setting</td>
     * </tr>
     * <tr>
     * <td>Enable</td>
     * <td>PME_FAILFAST_ON_COMMIT_FAIL_ENABLE 
     * </td>
     * </tr>
     * <tr>
     * <td>Disable</td>
     * <td>PME_FAILFAST_ON_COMMIT_FAIL_DISABLE 
     * </td>
     * </tr>
     * </table>
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
