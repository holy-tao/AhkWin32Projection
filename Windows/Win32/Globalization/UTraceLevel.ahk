#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UTraceLevel extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_OFF => -1

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_ERROR => 0

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_WARNING => 3

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_OPEN_CLOSE => 5

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_INFO => 7

    /**
     * @type {Integer (Int32)}
     */
    static UTRACE_VERBOSE => 9
}
