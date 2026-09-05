#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class VARFORMAT_NAMED_FORMAT extends Win32Enum {

    /**
     * Native name: VARFORMAT_NAMED_FORMAT_GENERALDATE
     * @type {Integer (Int32)}
     */
    static GENERALDATE => 0

    /**
     * Native name: VARFORMAT_NAMED_FORMAT_LONGDATE
     * @type {Integer (Int32)}
     */
    static LONGDATE => 1

    /**
     * Native name: VARFORMAT_NAMED_FORMAT_SHORTDATE
     * @type {Integer (Int32)}
     */
    static SHORTDATE => 2

    /**
     * Native name: VARFORMAT_NAMED_FORMAT_LONGTIME
     * @type {Integer (Int32)}
     */
    static LONGTIME => 3

    /**
     * Native name: VARFORMAT_NAMED_FORMAT_SHORTTIME
     * @type {Integer (Int32)}
     */
    static SHORTTIME => 4
}
