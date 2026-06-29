#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct FONT_FAMILY {
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
    static FF_DECORATIVE => 0x50

    /**
     * @type {Integer (Byte)}
     */
    static FF_DONTCARE => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static FF_MODERN => 0x30

    /**
     * @type {Integer (Byte)}
     */
    static FF_ROMAN => 0x10

    /**
     * @type {Integer (Byte)}
     */
    static FF_SCRIPT => 0x40

    /**
     * @type {Integer (Byte)}
     */
    static FF_SWISS => 0x20
}
