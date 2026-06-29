#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct OBJ_TYPE {
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
    static OBJ_PEN => 1

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_BRUSH => 2

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_DC => 3

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_METADC => 4

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_PAL => 5

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_FONT => 6

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_BITMAP => 7

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_REGION => 8

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_METAFILE => 9

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_MEMDC => 10

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_EXTPEN => 11

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_ENHMETADC => 12

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_ENHMETAFILE => 13

    /**
     * @type {Integer (Int32)}
     */
    static OBJ_COLORSPACE => 14
}
