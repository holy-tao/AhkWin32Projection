#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechPhraseInfo {
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
    static DISPID_SPILanguageId => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPIGrammarId => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPIStartTime => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPIAudioStreamPosition => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPIAudioSizeBytes => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPIRetainedSizeBytes => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPIAudioSizeTime => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPIRule => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPIProperties => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPIElements => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPIReplacements => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPIEngineId => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPIEnginePrivateData => 13

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPISaveToMemory => 14

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPIGetText => 15

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPIGetDisplayAttributes => 16
}
