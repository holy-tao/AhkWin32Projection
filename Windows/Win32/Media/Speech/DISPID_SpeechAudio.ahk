#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechAudio {
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
    static DISPID_SAStatus => 200

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SABufferInfo => 201

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SADefaultFormat => 202

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SAVolume => 203

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SABufferNotifySize => 204

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SAEventHandle => 205

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SASetState => 206
}
