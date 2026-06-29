#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NM_TREEVIEW_ACTION {
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
    static TVE_COLLAPSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TVE_EXPAND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TVE_TOGGLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TVE_EXPANDPARTIAL => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static TVE_COLLAPSERESET => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static TVC_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TVC_BYMOUSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TVC_BYKEYBOARD => 2
}
