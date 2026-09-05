#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UCharNameChoice extends Win32Enum {

    /**
     * Native name: U_UNICODE_CHAR_NAME
     * @type {Integer (Int32)}
     */
    static UNICODE_CHAR_NAME => 0

    /**
     * Native name: U_EXTENDED_CHAR_NAME
     * @type {Integer (Int32)}
     */
    static EXTENDED_CHAR_NAME => 2

    /**
     * Native name: U_CHAR_NAME_ALIAS
     * @type {Integer (Int32)}
     */
    static ALIAS => 3
}
