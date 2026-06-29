#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct MXDC_IMAGE_TYPE_ENUMS {
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
    static MXDC_IMAGETYPE_JPEGHIGH_COMPRESSION => 1

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_IMAGETYPE_JPEGMEDIUM_COMPRESSION => 2

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_IMAGETYPE_JPEGLOW_COMPRESSION => 3

    /**
     * @type {Integer (Int32)}
     */
    static MXDC_IMAGETYPE_PNG => 4
}
