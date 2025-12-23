#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechPhraseRule extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRuleName => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRuleId => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRuleFirstElement => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRuleNumberOfElements => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRuleParent => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRuleChildren => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRuleConfidence => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRuleEngineConfidence => 8
}
