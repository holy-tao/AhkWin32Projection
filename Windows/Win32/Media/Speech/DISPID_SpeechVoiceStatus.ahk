#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechVoiceStatus {
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
    static DISPID_SVSCurrentStreamNumber => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSLastStreamNumberQueued => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSLastResult => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSRunningState => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSInputWordPosition => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSInputWordLength => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSInputSentencePosition => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSInputSentenceLength => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSLastBookmark => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSLastBookmarkId => 10

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSPhonemeId => 11

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVSVisemeId => 12
}
