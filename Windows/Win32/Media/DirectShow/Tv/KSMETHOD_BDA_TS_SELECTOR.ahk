#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSMETHOD_BDA_TS_SELECTOR {
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
    static KSMETHOD_BDA_TS_SELECTOR_SETTSID => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_TS_SELECTOR_GETTSINFORMATION => 1
}
