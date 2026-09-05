#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Search
 */
class PRIORITIZE_FLAGS extends Win32Enum {

    /**
     * Native name: PRIORITIZE_FLAG_RETRYFAILEDITEMS
     * @type {Integer (Int32)}
     */
    static FLAG_RETRYFAILEDITEMS => 1

    /**
     * Native name: PRIORITIZE_FLAG_IGNOREFAILURECOUNT
     * @type {Integer (Int32)}
     */
    static FLAG_IGNOREFAILURECOUNT => 2
}
