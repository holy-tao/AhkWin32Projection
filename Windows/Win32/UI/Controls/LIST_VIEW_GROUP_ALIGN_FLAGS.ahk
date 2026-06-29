#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LIST_VIEW_GROUP_ALIGN_FLAGS {
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
    static LVGA_HEADER_LEFT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVGA_HEADER_CENTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LVGA_HEADER_RIGHT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LVGA_FOOTER_LEFT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LVGA_FOOTER_CENTER => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LVGA_FOOTER_RIGHT => 32
}
