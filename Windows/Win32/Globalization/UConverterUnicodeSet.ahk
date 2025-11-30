#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UConverterUnicodeSet extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_ROUNDTRIP_SET => 0

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_ROUNDTRIP_AND_FALLBACK_SET => 1
}
