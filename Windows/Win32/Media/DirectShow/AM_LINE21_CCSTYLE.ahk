#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_LINE21_CCSTYLE {
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
    static AM_L21_CCSTYLE_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static AM_L21_CCSTYLE_PopOn => 1

    /**
     * @type {Integer (Int32)}
     */
    static AM_L21_CCSTYLE_PaintOn => 2

    /**
     * @type {Integer (Int32)}
     */
    static AM_L21_CCSTYLE_RollUp => 3
}
