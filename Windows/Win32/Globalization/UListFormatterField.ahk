#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UListFormatterField extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ULISTFMT_LITERAL_FIELD => 0

    /**
     * @type {Integer (Int32)}
     */
    static ULISTFMT_ELEMENT_FIELD => 1
}
