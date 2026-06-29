#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSEVENT_TUNER {
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
    static KSEVENT_TUNER_CHANGED => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_TUNER_INITIATE_SCAN => 1
}
