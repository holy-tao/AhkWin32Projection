#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the possible results of a download, install, uninstall, or verification operation on an update.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-operationresultcode
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct OperationResultCode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The operation is not started.
     * @type {Integer (Int32)}
     */
    static orcNotStarted => 0

    /**
     * The operation is in progress.
     * @type {Integer (Int32)}
     */
    static orcInProgress => 1

    /**
     * The operation was completed successfully.
     * @type {Integer (Int32)}
     */
    static orcSucceeded => 2

    /**
     * The operation is complete, but one or more errors occurred during the operation. The results might be incomplete.
     * @type {Integer (Int32)}
     */
    static orcSucceededWithErrors => 3

    /**
     * The operation  failed to complete.
     * @type {Integer (Int32)}
     */
    static orcFailed => 4

    /**
     * The operation is canceled.
     * @type {Integer (Int32)}
     */
    static orcAborted => 5
}
