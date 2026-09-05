#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechGrammarRuleStateTransitions extends Win32Enum {

    /**
     * Native name: DISPID_SGRSTsCount
     * @type {Integer (Int32)}
     */
    static SGRSTsCount => 1

    /**
     * Native name: DISPID_SGRSTsItem
     * @type {Integer (Int32)}
     */
    static SGRSTsItem => 0

    /**
     * Native name: DISPID_SGRSTs_NewEnum
     * @type {Integer (Int32)}
     */
    static SGRSTs_NewEnum => -4
}
