#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechLexicon {
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
    static DISPID_SLGenerationId => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLGetWords => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLAddPronunciation => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLAddPronunciationByPhoneIds => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLRemovePronunciation => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLRemovePronunciationByPhoneIds => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLGetPronunciations => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SLGetGenerationChange => 8
}
