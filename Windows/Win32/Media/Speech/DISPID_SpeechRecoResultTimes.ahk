#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct DISPID_SpeechRecoResultTimes {
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
    static DISPID_SRRTStreamTime => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRTLength => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRTTickCount => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRTOffsetFromStart => 4
}
