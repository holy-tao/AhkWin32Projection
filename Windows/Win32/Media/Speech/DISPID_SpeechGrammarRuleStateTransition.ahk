#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechGrammarRuleStateTransition extends Win32Enum {

    /**
     * Native name: DISPID_SGRSTType
     * @type {Integer (Int32)}
     */
    static SGRSTType => 1

    /**
     * Native name: DISPID_SGRSTText
     * @type {Integer (Int32)}
     */
    static SGRSTText => 2

    /**
     * Native name: DISPID_SGRSTRule
     * @type {Integer (Int32)}
     */
    static SGRSTRule => 3

    /**
     * Native name: DISPID_SGRSTWeight
     * @type {Integer (Int32)}
     */
    static SGRSTWeight => 4

    /**
     * Native name: DISPID_SGRSTPropertyName
     * @type {Integer (Int32)}
     */
    static SGRSTPropertyName => 5

    /**
     * Native name: DISPID_SGRSTPropertyId
     * @type {Integer (Int32)}
     */
    static SGRSTPropertyId => 6

    /**
     * Native name: DISPID_SGRSTPropertyValue
     * @type {Integer (Int32)}
     */
    static SGRSTPropertyValue => 7

    /**
     * Native name: DISPID_SGRSTNextState
     * @type {Integer (Int32)}
     */
    static SGRSTNextState => 8
}
