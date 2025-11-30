#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class VARFORMAT_NAMED_FORMAT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_NAMED_FORMAT_GENERALDATE => 0

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_NAMED_FORMAT_LONGDATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_NAMED_FORMAT_SHORTDATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_NAMED_FORMAT_LONGTIME => 3

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_NAMED_FORMAT_SHORTTIME => 4
}
