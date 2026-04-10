#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.TransactionServer
 */
class MTSPackageExportOptions extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static mtsExportUsers => 1
}
