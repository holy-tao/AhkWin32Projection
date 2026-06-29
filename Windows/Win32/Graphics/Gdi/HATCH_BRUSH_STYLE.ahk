#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct HATCH_BRUSH_STYLE {
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
    static HS_BDIAGONAL => 3

    /**
     * @type {Integer (Int32)}
     */
    static HS_CROSS => 4

    /**
     * @type {Integer (Int32)}
     */
    static HS_DIAGCROSS => 5

    /**
     * @type {Integer (Int32)}
     */
    static HS_FDIAGONAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static HS_HORIZONTAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static HS_VERTICAL => 1
}
