#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPGRAMMARWORDTYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPWT_DISPLAY => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPWT_LEXICAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPWT_PRONUNCIATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPWT_LEXICAL_NO_SPECIAL_CHARS => 3
}
