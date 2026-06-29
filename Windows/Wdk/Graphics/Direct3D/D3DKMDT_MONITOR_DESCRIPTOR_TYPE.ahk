#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_MONITOR_DESCRIPTOR_TYPE {
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
    static D3DKMDT_MDT_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MDT_VESA_EDID_V1_BASEBLOCK => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MDT_VESA_EDID_V1_BLOCKMAP => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MDT_OTHER => 255
}
