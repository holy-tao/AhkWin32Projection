#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the different memory exhaustion types.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-process_memory_exhaustion_type
 * @namespace Windows.Win32.System.Threading
 */
export default struct PROCESS_MEMORY_EXHAUSTION_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
