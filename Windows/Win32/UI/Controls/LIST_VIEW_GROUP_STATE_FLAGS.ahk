#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LIST_VIEW_GROUP_STATE_FLAGS {
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
    static LVGS_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_COLLAPSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_HIDDEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_NOHEADER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_COLLAPSIBLE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_FOCUSED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_SELECTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_SUBSETED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static LVGS_SUBSETLINKFOCUSED => 128
}
