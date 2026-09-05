#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechPhraseProperties extends Win32Enum {

    /**
     * Native name: DISPID_SPPsCount
     * @type {Integer (Int32)}
     */
    static SPPsCount => 1

    /**
     * Native name: DISPID_SPPsItem
     * @type {Integer (Int32)}
     */
    static SPPsItem => 0

    /**
     * Native name: DISPID_SPPs_NewEnum
     * @type {Integer (Int32)}
     */
    static SPPs_NewEnum => -4
}
