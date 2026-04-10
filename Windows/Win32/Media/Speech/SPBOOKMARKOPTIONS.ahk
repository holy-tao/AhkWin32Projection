#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class SPBOOKMARKOPTIONS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static SPBO_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPBO_PAUSE => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPBO_AHEAD => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPBO_TIME_UNITS => 4
}
