#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct PFD_PIXEL_TYPE {
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
    static PFD_TYPE_RGBA => 0x00

    /**
     * @type {Integer (Byte)}
     */
    static PFD_TYPE_COLORINDEX => 0x01
}
