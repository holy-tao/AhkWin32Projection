#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the layout for a packed 3D video frame.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_s3d_packing_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_MEDIA_ENGINE_S3D_PACKING_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * None.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_S3D_PACKING_MODE_NONE => 0

    /**
     * The views are packed side-by-side in a single frame.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_S3D_PACKING_MODE_SIDE_BY_SIDE => 1

    /**
     * The views are packed top-to-bottom in a single frame.
     * @type {Integer (Int32)}
     */
    static MF_MEDIA_ENGINE_S3D_PACKING_MODE_TOP_BOTTOM => 2
}
