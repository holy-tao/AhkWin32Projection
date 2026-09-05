#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class XLAT_SIDE extends Win32Enum {

    /**
     * Native name: XLAT_SERVER
     * @type {Integer (Int32)}
     */
    static SERVER => 1

    /**
     * Native name: XLAT_CLIENT
     * @type {Integer (Int32)}
     */
    static CLIENT => 2
}
