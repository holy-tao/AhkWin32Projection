#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechGrammarRuleStateTransition {
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
    static DISPID_SGRSTType => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRSTText => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRSTRule => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRSTWeight => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRSTPropertyName => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRSTPropertyId => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRSTPropertyValue => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRSTNextState => 8
}
