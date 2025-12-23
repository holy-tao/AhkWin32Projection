#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class MSITRANSACTIONSTATE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MSITRANSACTIONSTATE_ROLLBACK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MSITRANSACTIONSTATE_COMMIT => 1
}
