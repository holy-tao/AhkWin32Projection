#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class PRIORITIZE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PRIORITIZE_FLAG_RETRYFAILEDITEMS => 1

    /**
     * @type {Integer (Int32)}
     */
    static PRIORITIZE_FLAG_IGNOREFAILURECOUNT => 2
}
