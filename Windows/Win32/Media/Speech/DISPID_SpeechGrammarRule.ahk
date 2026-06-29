#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechGrammarRule {
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
    static DISPID_SGRAttributes => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRInitialState => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRName => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRId => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRClear => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRAddResource => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRAddState => 7
}
