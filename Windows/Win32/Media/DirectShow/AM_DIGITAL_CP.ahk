#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_DIGITAL_CP {
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
    static AM_DIGITAL_CP_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static AM_DIGITAL_CP_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static AM_DIGITAL_CP_DVD_COMPLIANT => 2
}
