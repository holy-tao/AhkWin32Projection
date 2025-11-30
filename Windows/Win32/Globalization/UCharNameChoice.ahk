#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UCharNameChoice extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static U_UNICODE_CHAR_NAME => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_EXTENDED_CHAR_NAME => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_CHAR_NAME_ALIAS => 3
}
