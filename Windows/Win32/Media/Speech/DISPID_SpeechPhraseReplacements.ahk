#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechPhraseReplacements extends Win32Enum {

    /**
     * Native name: DISPID_SPRsCount
     * @type {Integer (Int32)}
     */
    static SPRsCount => 1

    /**
     * Native name: DISPID_SPRsItem
     * @type {Integer (Int32)}
     */
    static SPRsItem => 0

    /**
     * Native name: DISPID_SPRs_NewEnum
     * @type {Integer (Int32)}
     */
    static SPRs_NewEnum => -4
}
