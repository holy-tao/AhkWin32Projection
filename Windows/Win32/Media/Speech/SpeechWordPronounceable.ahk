#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct SpeechWordPronounceable {
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
    static SWPUnknownWordUnpronounceable => 0

    /**
     * @type {Integer (Int32)}
     */
    static SWPUnknownWordPronounceable => 1

    /**
     * @type {Integer (Int32)}
     */
    static SWPKnownWordPronounceable => 2
}
