#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MULTIPLANE_OVERLAY_FLAGS {
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
    static D3DKMT_MULTIPLANE_OVERLAY_FLAG_VERTICAL_FLIP => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MULTIPLANE_OVERLAY_FLAG_HORIZONTAL_FLIP => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MULTIPLANE_OVERLAY_FLAG_STATIC_CHECK => 4
}
