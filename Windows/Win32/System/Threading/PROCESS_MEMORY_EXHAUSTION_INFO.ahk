#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROCESS_MEMORY_EXHAUSTION_TYPE.ahk" { PROCESS_MEMORY_EXHAUSTION_TYPE }

/**
 * Allows applications to configure a process to terminate if an allocation fails to commit memory. This structure is used by the PROCESS_INFORMATION_CLASS class.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_memory_exhaustion_info
 * @namespace Windows.Win32.System.Threading
 */
export default struct PROCESS_MEMORY_EXHAUSTION_INFO {
    #StructPack 8

    /**
     * Version should be set to <b>PME_CURRENT_VERSION</b>.
     */
    Version : UInt16

    /**
     * Reserved.
     */
    Reserved : UInt16

    /**
     * Type of failure.
     * 
     * Type should be set to <b>PMETypeFailFastOnCommitFailure</b> (this is the only type available).
     */
    Type : PROCESS_MEMORY_EXHAUSTION_TYPE

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
     */
    Value : IntPtr

}
