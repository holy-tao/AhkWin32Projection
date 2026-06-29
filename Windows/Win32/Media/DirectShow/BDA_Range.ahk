#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDA_Range {
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
    static BDA_RANGE_NOT_SET => -1

    /**
     * @type {Integer (Int32)}
     */
    static BDA_RANGE_NOT_DEFINED => 0
}
