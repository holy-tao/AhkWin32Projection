#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UAlphabeticIndexLabelType extends Win32Enum {

    /**
     * Native name: U_ALPHAINDEX_NORMAL
     * @type {Integer (Int32)}
     */
    static ALPHAINDEX_NORMAL => 0

    /**
     * Native name: U_ALPHAINDEX_UNDERFLOW
     * @type {Integer (Int32)}
     */
    static ALPHAINDEX_UNDERFLOW => 1

    /**
     * Native name: U_ALPHAINDEX_INFLOW
     * @type {Integer (Int32)}
     */
    static ALPHAINDEX_INFLOW => 2

    /**
     * Native name: U_ALPHAINDEX_OVERFLOW
     * @type {Integer (Int32)}
     */
    static ALPHAINDEX_OVERFLOW => 3
}
