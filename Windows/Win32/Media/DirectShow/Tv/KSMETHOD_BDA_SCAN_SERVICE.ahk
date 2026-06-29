#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSMETHOD_BDA_SCAN_SERVICE {
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
    static KSMETHOD_BDA_SCAN_CAPABILTIES => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_SCANNING_STATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_SCAN_FILTER => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_SCAN_START => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_SCAN_RESUME => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSMETHOD_BDA_SCAN_STOP => 5
}
