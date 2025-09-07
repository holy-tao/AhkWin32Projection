#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechVoiceSpeakFlags{

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
