#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT {
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
    static DXGKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_MONO => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_HORIZONTAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_VERTICAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_SEPARATE => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_MONO_OFFSET => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_ROW_INTERLEAVED => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_COLUMN_INTERLEAVED => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXGKMT_MULTIPLANE_OVERLAY_STEREO_FORMAT_CHECKERBOARD => 7
}
