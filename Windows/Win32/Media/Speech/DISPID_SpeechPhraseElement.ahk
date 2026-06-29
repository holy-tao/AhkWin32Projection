#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechPhraseElement {
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
    static DISPID_SPEAudioTimeOffset => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEAudioSizeTime => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEAudioStreamOffset => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEAudioSizeBytes => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPERetainedStreamOffset => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPERetainedSizeBytes => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEDisplayText => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPELexicalForm => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEPronunciation => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEDisplayAttributes => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPERequiredConfidence => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEActualConfidence => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPEEngineConfidence => 13
}
