#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechVoiceEvent {
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
    static DISPID_SVEStreamStart => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEStreamEnd => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEVoiceChange => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEBookmark => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEWord => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEPhoneme => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVESentenceBoundary => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEViseme => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEAudioLevel => 9

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SVEEnginePrivate => 10
}
