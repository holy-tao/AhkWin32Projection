#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SpeechEngineConfidence {
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
    static SECLowConfidence => -1

    /**
     * @type {Integer (Int32)}
     */
    static SECNormalConfidence => 0

    /**
     * @type {Integer (Int32)}
     */
    static SECHighConfidence => 1
}
