#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechRecoResult {
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
    static DISPID_SRRRecoContext => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRTimes => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRAudioFormat => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRPhraseInfo => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRAlternates => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRAudio => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRSpeakAudio => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRSaveToMemory => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRDiscardResultInfo => 9
}
