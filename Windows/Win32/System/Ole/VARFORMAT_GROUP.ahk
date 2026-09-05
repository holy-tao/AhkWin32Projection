#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class VARFORMAT_GROUP extends Win32Enum {

    /**
     * Native name: VARFORMAT_GROUP_SYSTEMDEFAULT
     * @type {Integer (Int32)}
     */
    static SYSTEMDEFAULT => -2

    /**
     * Native name: VARFORMAT_GROUP_THOUSANDS
     * @type {Integer (Int32)}
     */
    static THOUSANDS => -1

    /**
     * Native name: VARFORMAT_GROUP_NOTTHOUSANDS
     * @type {Integer (Int32)}
     */
    static NOTTHOUSANDS => 0
}
