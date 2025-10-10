#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the status of an asynchronous operation.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/ne-wbemcli-wbem_status_type
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_STATUS_TYPE{

    /**
     * The operation has completed.
     * @type {Integer (Int32)}
     */
    static WBEM_STATUS_COMPLETE => 0

    /**
     * Used in activating post-filtering.
     * @type {Integer (Int32)}
     */
    static WBEM_STATUS_REQUIREMENTS => 1

    /**
     * The operation is still in progress.
     * @type {Integer (Int32)}
     */
    static WBEM_STATUS_PROGRESS => 2

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static WBEM_STATUS_LOGGING_INFORMATION => 256

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static WBEM_STATUS_LOGGING_INFORMATION_PROVIDER => 512

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static WBEM_STATUS_LOGGING_INFORMATION_HOST => 1024

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static WBEM_STATUS_LOGGING_INFORMATION_REPOSITORY => 2048

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static WBEM_STATUS_LOGGING_INFORMATION_ESS => 4096
}
