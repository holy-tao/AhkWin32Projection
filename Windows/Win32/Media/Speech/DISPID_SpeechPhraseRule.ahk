#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechPhraseRule extends Win32Enum {

    /**
     * Native name: DISPID_SPRuleName
     * @type {Integer (Int32)}
     */
    static SPRuleName => 1

    /**
     * Native name: DISPID_SPRuleId
     * @type {Integer (Int32)}
     */
    static SPRuleId => 2

    /**
     * Native name: DISPID_SPRuleFirstElement
     * @type {Integer (Int32)}
     */
    static SPRuleFirstElement => 3

    /**
     * Native name: DISPID_SPRuleNumberOfElements
     * @type {Integer (Int32)}
     */
    static SPRuleNumberOfElements => 4

    /**
     * Native name: DISPID_SPRuleParent
     * @type {Integer (Int32)}
     */
    static SPRuleParent => 5

    /**
     * Native name: DISPID_SPRuleChildren
     * @type {Integer (Int32)}
     */
    static SPRuleChildren => 6

    /**
     * Native name: DISPID_SPRuleConfidence
     * @type {Integer (Int32)}
     */
    static SPRuleConfidence => 7

    /**
     * Native name: DISPID_SPRuleEngineConfidence
     * @type {Integer (Int32)}
     */
    static SPRuleEngineConfidence => 8
}
