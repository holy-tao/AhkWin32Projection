#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UListFormatterType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ULISTFMT_TYPE_AND => 0

    /**
     * @type {Integer (Int32)}
     */
    static ULISTFMT_TYPE_OR => 1

    /**
     * @type {Integer (Int32)}
     */
    static ULISTFMT_TYPE_UNITS => 2
}
