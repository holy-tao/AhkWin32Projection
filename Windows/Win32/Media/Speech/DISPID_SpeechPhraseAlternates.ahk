#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechPhraseAlternates extends Win32Enum {

    /**
     * Native name: DISPID_SPAsCount
     * @type {Integer (Int32)}
     */
    static SPAsCount => 1

    /**
     * Native name: DISPID_SPAsItem
     * @type {Integer (Int32)}
     */
    static SPAsItem => 0

    /**
     * Native name: DISPID_SPAs_NewEnum
     * @type {Integer (Int32)}
     */
    static SPAs_NewEnum => -4
}
