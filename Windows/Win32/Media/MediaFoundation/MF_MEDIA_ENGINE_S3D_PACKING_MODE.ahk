#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the layout for a packed 3D video frame.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_s3d_packing_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_MEDIA_ENGINE_S3D_PACKING_MODE{

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
