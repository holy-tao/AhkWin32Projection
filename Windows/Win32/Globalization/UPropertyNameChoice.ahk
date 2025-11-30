#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UPropertyNameChoice extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static U_SHORT_PROPERTY_NAME => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_LONG_PROPERTY_NAME => 1
}
