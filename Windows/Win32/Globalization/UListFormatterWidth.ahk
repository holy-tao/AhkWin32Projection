#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UListFormatterWidth extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ULISTFMT_WIDTH_WIDE => 0

    /**
     * @type {Integer (Int32)}
     */
    static ULISTFMT_WIDTH_SHORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static ULISTFMT_WIDTH_NARROW => 2
}
