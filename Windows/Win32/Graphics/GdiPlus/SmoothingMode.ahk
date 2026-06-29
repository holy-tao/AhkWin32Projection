#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct SmoothingMode {
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
    static SmoothingModeInvalid => -1

    /**
     * @type {Integer (Int32)}
     */
    static SmoothingModeDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static SmoothingModeHighSpeed => 1

    /**
     * @type {Integer (Int32)}
     */
    static SmoothingModeHighQuality => 2

    /**
     * @type {Integer (Int32)}
     */
    static SmoothingModeNone => 3

    /**
     * @type {Integer (Int32)}
     */
    static SmoothingModeAntiAlias => 4

    /**
     * @type {Integer (Int32)}
     */
    static SmoothingModeAntiAlias8x4 => 4

    /**
     * @type {Integer (Int32)}
     */
    static SmoothingModeAntiAlias8x8 => 5
}
