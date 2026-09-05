#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 */
class VARFORMAT_LEADING_DIGIT extends Win32Enum {

    /**
     * Native name: VARFORMAT_LEADING_DIGIT_SYSTEMDEFAULT
     * @type {Integer (Int32)}
     */
    static SYSTEMDEFAULT => -2

    /**
     * Native name: VARFORMAT_LEADING_DIGIT_INCLUDED
     * @type {Integer (Int32)}
     */
    static INCLUDED => -1

    /**
     * Native name: VARFORMAT_LEADING_DIGIT_NOTINCLUDED
     * @type {Integer (Int32)}
     */
    static NOTINCLUDED => 0
}
