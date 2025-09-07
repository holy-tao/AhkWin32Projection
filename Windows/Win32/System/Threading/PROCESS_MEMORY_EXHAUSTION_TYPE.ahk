#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the different memory exhaustion types.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-process_memory_exhaustion_type
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_MEMORY_EXHAUSTION_TYPE{

    /**
     * Anytime memory management fails an allocation due to an inability to commit memory, it will cause the process to trigger a Windows Error Reporting report and then terminate immediately with <b>STATUS_COMMITMENT_LIMIT</b>. 
 * The failure cannot be caught and handled by the app.
     * @type {Integer (Int32)}
     */
    static PMETypeFailFastOnCommitFailure => 0

    /**
     * The maximum value for this enumeration. This value may change in a future version.
     * @type {Integer (Int32)}
     */
    static PMETypeMax => 1
}
