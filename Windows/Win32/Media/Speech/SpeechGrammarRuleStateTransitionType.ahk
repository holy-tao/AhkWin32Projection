#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SpeechGrammarRuleStateTransitionType {
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
    static SGRSTTEpsilon => 0

    /**
     * @type {Integer (Int32)}
     */
    static SGRSTTWord => 1

    /**
     * @type {Integer (Int32)}
     */
    static SGRSTTRule => 2

    /**
     * @type {Integer (Int32)}
     */
    static SGRSTTDictation => 3

    /**
     * @type {Integer (Int32)}
     */
    static SGRSTTWildcard => 4

    /**
     * @type {Integer (Int32)}
     */
    static SGRSTTTextBuffer => 5
}
