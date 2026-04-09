#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class ULocDataLocaleType extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_ACTUAL_LOCALE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ULOC_VALID_LOCALE => 1
}
