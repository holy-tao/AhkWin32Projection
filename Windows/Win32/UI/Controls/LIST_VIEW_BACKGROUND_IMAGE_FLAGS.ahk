#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct LIST_VIEW_BACKGROUND_IMAGE_FLAGS {
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
    static LVBKIF_SOURCE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_SOURCE_HBITMAP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_SOURCE_URL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_SOURCE_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_STYLE_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_STYLE_TILE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_STYLE_MASK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_FLAG_TILEOFFSET => 256

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_TYPE_WATERMARK => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static LVBKIF_FLAG_ALPHABLEND => 536870912
}
