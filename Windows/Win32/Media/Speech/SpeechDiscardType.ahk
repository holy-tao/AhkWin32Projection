#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SpeechDiscardType {
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
    static SDTProperty => 1

    /**
     * @type {Integer (Int32)}
     */
    static SDTReplacement => 2

    /**
     * @type {Integer (Int32)}
     */
    static SDTRule => 4

    /**
     * @type {Integer (Int32)}
     */
    static SDTDisplayText => 8

    /**
     * @type {Integer (Int32)}
     */
    static SDTLexicalForm => 16

    /**
     * @type {Integer (Int32)}
     */
    static SDTPronunciation => 32

    /**
     * @type {Integer (Int32)}
     */
    static SDTAudio => 64

    /**
     * @type {Integer (Int32)}
     */
    static SDTAlternates => 128

    /**
     * @type {Integer (Int32)}
     */
    static SDTAll => 255
}
