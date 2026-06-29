#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechAudioFormat {
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
    static DISPID_SAFType => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SAFGuid => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SAFGetWaveFormatEx => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SAFSetWaveFormatEx => 4
}
