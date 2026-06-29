#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechPhraseRule {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
