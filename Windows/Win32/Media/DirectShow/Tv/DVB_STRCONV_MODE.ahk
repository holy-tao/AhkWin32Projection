#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct DVB_STRCONV_MODE {
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
    static STRCONV_MODE_DVB => 0

    /**
     * @type {Integer (Int32)}
     */
    static STRCONV_MODE_DVB_EMPHASIS => 1

    /**
     * @type {Integer (Int32)}
     */
    static STRCONV_MODE_DVB_WITHOUT_EMPHASIS => 2

    /**
     * @type {Integer (Int32)}
     */
    static STRCONV_MODE_ISDB => 3
}
