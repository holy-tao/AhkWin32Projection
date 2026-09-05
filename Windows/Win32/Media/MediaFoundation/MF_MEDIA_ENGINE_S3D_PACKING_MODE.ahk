#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the layout for a packed 3D video frame.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_s3d_packing_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_MEDIA_ENGINE_S3D_PACKING_MODE extends Win32Enum {

    /**
     * None.
     * Native name: MF_MEDIA_ENGINE_S3D_PACKING_MODE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The views are packed side-by-side in a single frame.
     * Native name: MF_MEDIA_ENGINE_S3D_PACKING_MODE_SIDE_BY_SIDE
     * @type {Integer (Int32)}
     */
    static SIDE_BY_SIDE => 1

    /**
     * The views are packed top-to-bottom in a single frame.
     * Native name: MF_MEDIA_ENGINE_S3D_PACKING_MODE_TOP_BOTTOM
     * @type {Integer (Int32)}
     */
    static TOP_BOTTOM => 2
}
