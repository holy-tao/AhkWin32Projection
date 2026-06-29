#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechPhraseReplacement {
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
    static DISPID_SPRDisplayAttributes => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRText => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRFirstElement => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SPRNumberOfElements => 4
}
