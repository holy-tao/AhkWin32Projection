#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UCPMapRangeOption extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCPMAP_RANGE_NORMAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCPMAP_RANGE_FIXED_LEAD_SURROGATES => 1

    /**
     * @type {Integer (Int32)}
     */
    static UCPMAP_RANGE_FIXED_ALL_SURROGATES => 2
}
