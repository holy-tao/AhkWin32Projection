#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSEVENT_VIDCAPTOSTI {
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
    static KSEVENT_VIDCAPTOSTI_EXT_TRIGGER => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_VIDCAP_AUTO_UPDATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_VIDCAP_SEARCH => 2
}
