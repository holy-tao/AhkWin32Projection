#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VS_FIXEDFILEINFO_FILE_SUBTYPE {
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
    static VFT2_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static VFT2_DRV_PRINTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static VFT2_DRV_KEYBOARD => 2

    /**
     * @type {Integer (Int32)}
     */
    static VFT2_DRV_LANGUAGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static VFT2_DRV_DISPLAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static VFT2_DRV_MOUSE => 5

    /**
     * @type {Integer (Int32)}
     */
    static VFT2_DRV_NETWORK => 6

    /**
     * @type {Integer (Int32)}
     */
    static VFT2_DRV_SYSTEM => 7

    /**
     * @type {Integer (Int32)}
     */
    static VFT2_DRV_INSTALLABLE => 8

    /**
     * @type {Integer (Int32)}
     */
    static VFT2_DRV_SOUND => 9

    /**
     * @type {Integer (Int32)}
     */
    static VFT2_DRV_COMM => 10

    /**
     * @type {Integer (Int32)}
     */
    static VFT2_DRV_INPUTMETHOD => 11

    /**
     * @type {Integer (Int32)}
     */
    static VFT2_DRV_VERSIONED_PRINTER => 12

    /**
     * @type {Integer (Int32)}
     */
    static VFT2_FONT_RASTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static VFT2_FONT_VECTOR => 2

    /**
     * @type {Integer (Int32)}
     */
    static VFT2_FONT_TRUETYPE => 3
}
