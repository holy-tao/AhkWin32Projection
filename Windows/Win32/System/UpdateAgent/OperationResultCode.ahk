#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible results of a download, install, uninstall, or verification operation on an update.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-operationresultcode
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class OperationResultCode extends Win32Enum{

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
