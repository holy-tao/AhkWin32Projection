#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UNumericType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static U_NT_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_NT_DECIMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_NT_DIGIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_NT_NUMERIC => 3
}
