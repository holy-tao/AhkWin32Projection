#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechGrammarRules {
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
    static DISPID_SGRsCount => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRsDynamic => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRsAdd => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRsCommit => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRsCommitAndSave => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRsFindRule => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRsItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SGRs_NewEnum => -4
}
