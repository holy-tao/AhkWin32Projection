#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class VARFORMAT_LEADING_DIGIT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_LEADING_DIGIT_SYSTEMDEFAULT => -2

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_LEADING_DIGIT_INCLUDED => -1

    /**
     * @type {Integer (Int32)}
     */
    static VARFORMAT_LEADING_DIGIT_NOTINCLUDED => 0
}
