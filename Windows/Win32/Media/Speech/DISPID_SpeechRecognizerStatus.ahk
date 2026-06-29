#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechRecognizerStatus {
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
    static DISPID_SRSAudioStatus => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRSCurrentStreamPosition => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRSCurrentStreamNumber => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRSNumberOfActiveRules => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRSClsidEngine => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRSSupportedLanguages => 6
}
