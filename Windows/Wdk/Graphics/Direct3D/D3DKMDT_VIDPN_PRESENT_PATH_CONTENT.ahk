#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_VIDPN_PRESENT_PATH_CONTENT {
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
    static D3DKMDT_VPPC_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPC_GRAPHICS => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPC_VIDEO => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VPPC_NOTSPECIFIED => 255
}
