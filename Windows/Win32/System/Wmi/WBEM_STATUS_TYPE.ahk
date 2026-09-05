#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the status of an asynchronous operation.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_status_type
 * @namespace Windows.Win32.System.Wmi
 */
class WBEM_STATUS_TYPE extends Win32Enum {

    /**
     * The operation has completed.
     * Native name: WBEM_STATUS_COMPLETE
     * @type {Integer (Int32)}
     */
    static COMPLETE => 0

    /**
     * Used in activating post-filtering.
     * Native name: WBEM_STATUS_REQUIREMENTS
     * @type {Integer (Int32)}
     */
    static REQUIREMENTS => 1

    /**
     * The operation is still in progress.
     * Native name: WBEM_STATUS_PROGRESS
     * @type {Integer (Int32)}
     */
    static PROGRESS => 2

    /**
     * Reserved for future use.
     * Native name: WBEM_STATUS_LOGGING_INFORMATION
     * @type {Integer (Int32)}
     */
    static LOGGING_INFORMATION => 256

    /**
     * Reserved for future use.
     * Native name: WBEM_STATUS_LOGGING_INFORMATION_PROVIDER
     * @type {Integer (Int32)}
     */
    static LOGGING_INFORMATION_PROVIDER => 512

    /**
     * Reserved for future use.
     * Native name: WBEM_STATUS_LOGGING_INFORMATION_HOST
     * @type {Integer (Int32)}
     */
    static LOGGING_INFORMATION_HOST => 1024

    /**
     * Reserved for future use.
     * Native name: WBEM_STATUS_LOGGING_INFORMATION_REPOSITORY
     * @type {Integer (Int32)}
     */
    static LOGGING_INFORMATION_REPOSITORY => 2048

    /**
     * Reserved for future use.
     * Native name: WBEM_STATUS_LOGGING_INFORMATION_ESS
     * @type {Integer (Int32)}
     */
    static LOGGING_INFORMATION_ESS => 4096
}
