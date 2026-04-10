#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UColBoundMode extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_BOUND_LOWER => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_BOUND_UPPER => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_BOUND_UPPER_LONG => 2
}
