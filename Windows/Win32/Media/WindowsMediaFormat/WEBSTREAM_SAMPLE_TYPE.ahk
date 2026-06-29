#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WEBSTREAM_SAMPLE_TYPE {
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
    static WEBSTREAM_SAMPLE_TYPE_FILE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WEBSTREAM_SAMPLE_TYPE_RENDER => 2
}
