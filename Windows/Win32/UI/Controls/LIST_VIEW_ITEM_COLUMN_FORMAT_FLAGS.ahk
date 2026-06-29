#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LIST_VIEW_ITEM_COLUMN_FORMAT_FLAGS {
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
    static LVCFMT_LINE_BREAK => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_FILL => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_WRAP => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_NO_TITLE => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_TILE_PLACEMENTMASK => 3145728
}
