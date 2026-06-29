#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechAudioStatus {
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
    static DISPID_SASFreeBufferSpace => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SASNonBlockingIO => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SASState => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SASCurrentSeekPosition => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SASCurrentDevicePosition => 5
}
