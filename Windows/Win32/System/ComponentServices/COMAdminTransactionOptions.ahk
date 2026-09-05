#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminTransactionOptions extends Win32Enum {

    /**
     * Native name: COMAdminTransactionIgnored
     * @type {Integer (Int32)}
     */
    static Ignored => 0

    /**
     * Native name: COMAdminTransactionNone
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Native name: COMAdminTransactionSupported
     * @type {Integer (Int32)}
     */
    static Supported => 2

    /**
     * Native name: COMAdminTransactionRequired
     * @type {Integer (Int32)}
     */
    static Required => 3

    /**
     * Native name: COMAdminTransactionRequiresNew
     * @type {Integer (Int32)}
     */
    static RequiresNew => 4
}
