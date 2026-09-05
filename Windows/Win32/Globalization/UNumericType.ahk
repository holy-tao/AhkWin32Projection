#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UNumericType extends Win32Enum {

    /**
     * Native name: U_NT_NONE
     * @type {Integer (Int32)}
     */
    static NT_NONE => 0

    /**
     * Native name: U_NT_DECIMAL
     * @type {Integer (Int32)}
     */
    static NT_DECIMAL => 1

    /**
     * Native name: U_NT_DIGIT
     * @type {Integer (Int32)}
     */
    static NT_DIGIT => 2

    /**
     * Native name: U_NT_NUMERIC
     * @type {Integer (Int32)}
     */
    static NT_NUMERIC => 3
}
