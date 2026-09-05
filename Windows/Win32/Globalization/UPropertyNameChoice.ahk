#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UPropertyNameChoice extends Win32Enum {

    /**
     * Native name: U_SHORT_PROPERTY_NAME
     * @type {Integer (Int32)}
     */
    static SHORT_PROPERTY_NAME => 0

    /**
     * Native name: U_LONG_PROPERTY_NAME
     * @type {Integer (Int32)}
     */
    static LONG_PROPERTY_NAME => 1
}
