#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TREE_VIEW_ITEM_STATE_FLAGS {
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
    static TVIS_SELECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TVIS_CUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TVIS_DROPHILITED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TVIS_BOLD => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TVIS_EXPANDED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TVIS_EXPANDEDONCE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TVIS_EXPANDPARTIAL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TVIS_OVERLAYMASK => 3840

    /**
     * @type {Integer (UInt32)}
     */
    static TVIS_STATEIMAGEMASK => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static TVIS_USERMASK => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static TVIS_EX_FLAT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TVIS_EX_DISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TVIS_EX_ALL => 2
}
