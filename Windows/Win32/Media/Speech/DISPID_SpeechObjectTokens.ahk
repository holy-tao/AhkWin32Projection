#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechObjectTokens extends Win32Enum {

    /**
     * Native name: DISPID_SOTsCount
     * @type {Integer (Int32)}
     */
    static SOTsCount => 1

    /**
     * Native name: DISPID_SOTsItem
     * @type {Integer (Int32)}
     */
    static SOTsItem => 0

    /**
     * Native name: DISPID_SOTs_NewEnum
     * @type {Integer (Int32)}
     */
    static SOTs_NewEnum => -4
}
