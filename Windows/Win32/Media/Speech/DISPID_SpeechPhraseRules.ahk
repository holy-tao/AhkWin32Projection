#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechPhraseRules extends Win32Enum {

    /**
     * Native name: DISPID_SPRulesCount
     * @type {Integer (Int32)}
     */
    static SPRulesCount => 1

    /**
     * Native name: DISPID_SPRulesItem
     * @type {Integer (Int32)}
     */
    static SPRulesItem => 0

    /**
     * Native name: DISPID_SPRules_NewEnum
     * @type {Integer (Int32)}
     */
    static SPRules_NewEnum => -4
}
