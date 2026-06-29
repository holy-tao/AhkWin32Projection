#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LIST_ITEM_STATE_FLAGS {
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
    static LIS_FOCUSED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LIS_ENABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LIS_VISITED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LIS_HOTTRACK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static LIS_DEFAULTCOLORS => 16
}
