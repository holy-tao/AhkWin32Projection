#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LIST_VIEW_ITEM_STATE_FLAGS {
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
    static LVIS_FOCUSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVIS_SELECTED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LVIS_CUT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LVIS_DROPHILITED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LVIS_GLOW => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LVIS_ACTIVATING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static LVIS_OVERLAYMASK => 3840

    /**
     * @type {Integer (UInt32)}
     */
    static LVIS_STATEIMAGEMASK => 61440
}
