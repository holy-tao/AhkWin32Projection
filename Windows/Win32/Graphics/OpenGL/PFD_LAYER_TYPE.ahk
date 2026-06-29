#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.OpenGL
 */
export default struct PFD_LAYER_TYPE {
    value : Int8

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (SByte)}
     */
    static PFD_UNDERLAY_PLANE => 0xFF

    /**
     * @type {Integer (SByte)}
     */
    static PFD_MAIN_PLANE => 0x00

    /**
     * @type {Integer (SByte)}
     */
    static PFD_OVERLAY_PLANE => 0x01
}
