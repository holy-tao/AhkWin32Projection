#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechLexiconWords extends Win32Enum {

    /**
     * Native name: DISPID_SLWsCount
     * @type {Integer (Int32)}
     */
    static SLWsCount => 1

    /**
     * Native name: DISPID_SLWsItem
     * @type {Integer (Int32)}
     */
    static SLWsItem => 0

    /**
     * Native name: DISPID_SLWs_NewEnum
     * @type {Integer (Int32)}
     */
    static SLWs_NewEnum => -4
}
