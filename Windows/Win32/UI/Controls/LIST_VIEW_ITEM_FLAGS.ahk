#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LIST_VIEW_ITEM_FLAGS {
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
    static LVIF_TEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_IMAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_PARAM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_STATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_INDENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_NORECOMPUTE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_GROUPID => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_COLUMNS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_COLFMT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static LVIF_DI_SETITEM => 4096
}
