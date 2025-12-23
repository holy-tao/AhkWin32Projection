#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UConverterCallbackReason extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_UNASSIGNED => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_ILLEGAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_IRREGULAR => 2

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_RESET => 3

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_CLOSE => 4

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_CLONE => 5
}
