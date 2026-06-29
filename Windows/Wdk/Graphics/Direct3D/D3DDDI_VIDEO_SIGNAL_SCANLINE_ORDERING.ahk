#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_VIDEO_SIGNAL_SCANLINE_ORDERING {
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
    static D3DDDI_VSSLO_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_VSSLO_PROGRESSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_VSSLO_INTERLACED_UPPERFIELDFIRST => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_VSSLO_INTERLACED_LOWERFIELDFIRST => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDI_VSSLO_OTHER => 255
}
