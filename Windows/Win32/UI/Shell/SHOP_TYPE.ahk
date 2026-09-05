#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SHOP_TYPE extends Win32BitflagEnum {

    /**
     * Native name: SHOP_PRINTERNAME
     * @type {Integer (Int32)}
     */
    static PRINTERNAME => 1

    /**
     * Native name: SHOP_FILEPATH
     * @type {Integer (Int32)}
     */
    static FILEPATH => 2

    /**
     * Native name: SHOP_VOLUMEGUID
     * @type {Integer (Int32)}
     */
    static VOLUMEGUID => 4
}
