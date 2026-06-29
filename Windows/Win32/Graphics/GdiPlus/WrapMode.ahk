#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct WrapMode {
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
    static WrapModeTile => 0

    /**
     * @type {Integer (Int32)}
     */
    static WrapModeTileFlipX => 1

    /**
     * @type {Integer (Int32)}
     */
    static WrapModeTileFlipY => 2

    /**
     * @type {Integer (Int32)}
     */
    static WrapModeTileFlipXY => 3

    /**
     * @type {Integer (Int32)}
     */
    static WrapModeClamp => 4
}
