#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the type of handle operation that has occurred.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/ne-avrfsdk-ehandle_trace_operations
 * @namespace Windows.Win32.System.ApplicationVerifier
 */
export default struct eHANDLE_TRACE_OPERATIONS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Not used at this time.
     * @type {Integer (Int32)}
     */
    static OperationDbUnused => 0

    /**
     * Specifies an open (create) handle operation.
     * @type {Integer (Int32)}
     */
    static OperationDbOPEN => 1

    /**
     * Specifies a close handle operation.
     * @type {Integer (Int32)}
     */
    static OperationDbCLOSE => 2

    /**
     * Specifies an invalid handle operation.
     * @type {Integer (Int32)}
     */
    static OperationDbBADREF => 3
}
