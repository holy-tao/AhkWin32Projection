#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LVCOLUMNW_MASK {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static LVCF_FMT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVCF_WIDTH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LVCF_TEXT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LVCF_SUBITEM => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LVCF_IMAGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LVCF_ORDER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LVCF_MINWIDTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LVCF_DEFAULTWIDTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static LVCF_IDEALWIDTH => 256
}
