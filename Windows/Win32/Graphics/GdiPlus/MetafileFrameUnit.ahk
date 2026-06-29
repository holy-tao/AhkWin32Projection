#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct MetafileFrameUnit {
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
    static MetafileFrameUnitPixel => 2

    /**
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitPoint => 3

    /**
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitInch => 4

    /**
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitDocument => 5

    /**
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitMillimeter => 6

    /**
     * @type {Integer (Int32)}
     */
    static MetafileFrameUnitGdi => 7
}
