#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct PARAFORMAT_BORDERS {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_BORDERS_LEFT => 1

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_BORDERS_RIGHT => 2

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_BORDERS_TOP => 4

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_BORDERS_BOTTOM => 8

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_BORDERS_INSIDE => 16

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_BORDERS_OUTSIDE => 32

    /**
     * @type {Integer (UInt16)}
     */
    static PARAFORMAT_BORDERS_AUTOCOLOR => 64
}
