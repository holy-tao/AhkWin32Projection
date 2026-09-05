#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechLexiconProns extends Win32Enum {

    /**
     * Native name: DISPID_SLPsCount
     * @type {Integer (Int32)}
     */
    static SLPsCount => 1

    /**
     * Native name: DISPID_SLPsItem
     * @type {Integer (Int32)}
     */
    static SLPsItem => 0

    /**
     * Native name: DISPID_SLPs_NewEnum
     * @type {Integer (Int32)}
     */
    static SLPs_NewEnum => -4
}
