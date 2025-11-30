#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechGrammarRuleState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRSRule => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRSTransitions => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRSAddWordTransition => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRSAddRuleTransition => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRSAddSpecialTransition => 5
}
