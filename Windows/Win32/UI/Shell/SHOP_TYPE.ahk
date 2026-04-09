#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SHOP_TYPE extends Win32BitflagEnum {

    /**
     * @type {Integer (Int32)}
     */
    static SHOP_PRINTERNAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static SHOP_FILEPATH => 2

    /**
     * @type {Integer (Int32)}
     */
    static SHOP_VOLUMEGUID => 4
}
