#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_PAINT_FEATURE_LEVEL {
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
    static DWRITE_PAINT_FEATURE_LEVEL_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_FEATURE_LEVEL_COLR_V0 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DWRITE_PAINT_FEATURE_LEVEL_COLR_V1 => 2
}
