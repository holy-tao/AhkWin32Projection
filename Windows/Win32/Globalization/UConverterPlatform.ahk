#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UConverterPlatform extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_UNKNOWN => -1

    /**
     * @type {Integer (Int32)}
     */
    static UCNV_IBM => 0
}
