#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class MSITRANSACTIONSTATE extends Win32Enum {

    /**
     * Native name: MSITRANSACTIONSTATE_ROLLBACK
     * @type {Integer (UInt32)}
     */
    static ROLLBACK => 0

    /**
     * Native name: MSITRANSACTIONSTATE_COMMIT
     * @type {Integer (UInt32)}
     */
    static COMMIT => 1
}
