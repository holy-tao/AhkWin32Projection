#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class VARFORMAT_GROUP extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_GROUP_SYSTEMDEFAULT => -2

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_GROUP_THOUSANDS => -1

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_GROUP_NOTTHOUSANDS => 0
}
