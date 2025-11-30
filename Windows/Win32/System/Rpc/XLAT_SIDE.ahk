#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class XLAT_SIDE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static XLAT_SERVER => 1

    /**
     * @type {Integer (Int32)}
     */
    static XLAT_CLIENT => 2
}
