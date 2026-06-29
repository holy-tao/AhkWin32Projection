#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct GdiplusStartupParams {
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
    static GdiplusStartupDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupNoSetRound => 1

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupSetPSValue => 2

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupReserved0 => 4

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupReserved1 => 8

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupReserved2 => 16

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusStartupTransparencyMask => -16777216
}
