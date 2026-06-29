#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SpeechVoiceSpeakFlags {
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
    static SVSFDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVSFlagsAsync => 1

    /**
     * @type {Integer (Int32)}
     */
    static SVSFPurgeBeforeSpeak => 2

    /**
     * @type {Integer (Int32)}
     */
    static SVSFIsFilename => 4

    /**
     * @type {Integer (Int32)}
     */
    static SVSFIsXML => 8

    /**
     * @type {Integer (Int32)}
     */
    static SVSFIsNotXML => 16

    /**
     * @type {Integer (Int32)}
     */
    static SVSFPersistXML => 32

    /**
     * @type {Integer (Int32)}
     */
    static SVSFNLPSpeakPunc => 64

    /**
     * @type {Integer (Int32)}
     */
    static SVSFParseSapi => 128

    /**
     * @type {Integer (Int32)}
     */
    static SVSFParseSsml => 256

    /**
     * @type {Integer (Int32)}
     */
    static SVSFParseAutodetect => 0

    /**
     * @type {Integer (Int32)}
     */
    static SVSFNLPMask => 64

    /**
     * @type {Integer (Int32)}
     */
    static SVSFParseMask => 384

    /**
     * @type {Integer (Int32)}
     */
    static SVSFVoiceMask => 511

    /**
     * @type {Integer (Int32)}
     */
    static SVSFUnusedFlags => -512
}
