#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class COMPARESTRING_RESULT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CSTR_LESS_THAN => 1

    /**
     * @type {Integer (Int32)}
     */
    static CSTR_EQUAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static CSTR_GREATER_THAN => 3
}
