#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MULTIPLANE_OVERLAY_BLEND {
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
    static D3DKMT_MULTIPLANE_OVERLAY_BLEND_OPAQUE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MULTIPLANE_OVERLAY_BLEND_ALPHABLEND => 1
}
