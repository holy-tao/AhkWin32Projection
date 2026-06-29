#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LVCOLUMNW_FORMAT {
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
    static LVCFMT_LEFT => 0

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_RIGHT => 1

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_CENTER => 2

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_JUSTIFYMASK => 3

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_IMAGE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_BITMAP_ON_RIGHT => 4096

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_COL_HAS_IMAGES => 32768

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_FIXED_WIDTH => 256

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_NO_DPI_SCALE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_FIXED_RATIO => 524288

    /**
     * @type {Integer (Int32)}
     */
    static LVCFMT_SPLITBUTTON => 16777216
}
