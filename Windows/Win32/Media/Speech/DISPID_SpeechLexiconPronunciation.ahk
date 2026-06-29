#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechLexiconPronunciation {
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
    static DISPID_SLPType => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLPLangId => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLPPartOfSpeech => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLPPhoneIds => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLPSymbolic => 5
}
