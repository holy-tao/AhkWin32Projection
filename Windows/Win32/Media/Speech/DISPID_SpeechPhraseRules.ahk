#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechPhraseRules extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRulesCount => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRulesItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRules_NewEnum => -4
}
