#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UNumberDecimalSeparatorDisplay extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_DECIMAL_SEPARATOR_AUTO => 0

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_DECIMAL_SEPARATOR_ALWAYS => 1

    /**
     * @type {Integer (Int32)}
     */
    static UNUM_DECIMAL_SEPARATOR_COUNT => 2
}
