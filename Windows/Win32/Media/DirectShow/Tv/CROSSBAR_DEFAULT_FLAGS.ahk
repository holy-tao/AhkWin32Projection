#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct CROSSBAR_DEFAULT_FLAGS {
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
    static DEF_MODE_PROFILE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DEF_MODE_STREAMS => 2
}
