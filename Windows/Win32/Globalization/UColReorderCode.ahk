#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UColReorderCode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_DEFAULT => -1

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_NONE => 103

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_OTHERS => 103

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_SPACE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_FIRST => 4096

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_PUNCTUATION => 4097

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_SYMBOL => 4098

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_CURRENCY => 4099

    /**
     * @type {Integer (Int32)}
     */
    static UCOL_REORDER_CODE_DIGIT => 4100
}
