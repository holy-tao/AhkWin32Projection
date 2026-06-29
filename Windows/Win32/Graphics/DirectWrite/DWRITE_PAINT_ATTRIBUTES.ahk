#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_PAINT_ATTRIBUTES {
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
    static DWRITE_PAINT_ATTRIBUTES_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_ATTRIBUTES_USES_PALETTE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_ATTRIBUTES_USES_TEXT_COLOR => 2
}
