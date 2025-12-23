#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UAlphabeticIndexLabelType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static U_ALPHAINDEX_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static U_ALPHAINDEX_UNDERFLOW => 1

    /**
     * @type {Integer (Int32)}
     */
    static U_ALPHAINDEX_INFLOW => 2

    /**
     * @type {Integer (Int32)}
     */
    static U_ALPHAINDEX_OVERFLOW => 3
}
