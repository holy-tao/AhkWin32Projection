#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechRecoContext {
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
    static DISPID_SRCRecognizer => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCAudioInInterferenceStatus => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCRequestedUIType => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCVoice => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRAllowVoiceFormatMatchingOnNextSet => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCVoicePurgeEvent => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCEventInterests => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCCmdMaxAlternates => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCState => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCRetainedAudio => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCRetainedAudioFormat => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCPause => 12

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCResume => 13

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCCreateGrammar => 14

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCCreateResultFromMemory => 15

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCBookmark => 16

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRCSetAdaptationData => 17
}
