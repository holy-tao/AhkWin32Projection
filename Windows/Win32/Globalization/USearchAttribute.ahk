#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class USearchAttribute extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static USEARCH_OVERLAP => 0

    /**
     * @type {Integer (Int32)}
     */
    static USEARCH_ELEMENT_COMPARISON => 2
}
