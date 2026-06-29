#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct FONT_OUTPUT_PRECISION {
    value : UInt8

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Byte)}
     */
    static OUT_DEFAULT_PRECIS => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static OUT_STRING_PRECIS => 0x01

    /**
     * @type {Integer (Byte)}
     */
    static OUT_CHARACTER_PRECIS => 0x02

    /**
     * @type {Integer (Byte)}
     */
    static OUT_STROKE_PRECIS => 0x03

    /**
     * @type {Integer (Byte)}
     */
    static OUT_TT_PRECIS => 0x04

    /**
     * @type {Integer (Byte)}
     */
    static OUT_DEVICE_PRECIS => 0x05

    /**
     * @type {Integer (Byte)}
     */
    static OUT_RASTER_PRECIS => 0x06

    /**
     * @type {Integer (Byte)}
     */
    static OUT_TT_ONLY_PRECIS => 0x07

    /**
     * @type {Integer (Byte)}
     */
    static OUT_OUTLINE_PRECIS => 0x08

    /**
     * @type {Integer (Byte)}
     */
    static OUT_SCREEN_OUTLINE_PRECIS => 0x09

    /**
     * @type {Integer (Byte)}
     */
    static OUT_PS_ONLY_PRECIS => 0x0A
}
