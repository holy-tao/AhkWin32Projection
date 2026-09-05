#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechPhraseElements extends Win32Enum {

    /**
     * Native name: DISPID_SPEsCount
     * @type {Integer (Int32)}
     */
    static SPEsCount => 1

    /**
     * Native name: DISPID_SPEsItem
     * @type {Integer (Int32)}
     */
    static SPEsItem => 0

    /**
     * Native name: DISPID_SPEs_NewEnum
     * @type {Integer (Int32)}
     */
    static SPEs_NewEnum => -4
}
