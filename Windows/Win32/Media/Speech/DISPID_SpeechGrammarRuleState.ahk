#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechGrammarRuleState extends Win32Enum {

    /**
     * Native name: DISPID_SGRSRule
     * @type {Integer (Int32)}
     */
    static SGRSRule => 1

    /**
     * Native name: DISPID_SGRSTransitions
     * @type {Integer (Int32)}
     */
    static SGRSTransitions => 2

    /**
     * Native name: DISPID_SGRSAddWordTransition
     * @type {Integer (Int32)}
     */
    static SGRSAddWordTransition => 3

    /**
     * Native name: DISPID_SGRSAddRuleTransition
     * @type {Integer (Int32)}
     */
    static SGRSAddRuleTransition => 4

    /**
     * Native name: DISPID_SGRSAddSpecialTransition
     * @type {Integer (Int32)}
     */
    static SGRSAddSpecialTransition => 5
}
