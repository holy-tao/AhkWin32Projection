#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how 3D video frames are stored in memory.
 * @remarks
 * 
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-3d-format">MF_MT_VIDEO_3D_FORMAT</a> attribute.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ne-mfapi-mfvideo3dformat
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideo3DFormat{

    /**
     * The base view is stored in a single buffer. The other view is discarded.
     * @type {Integer (Int32)}
     */
    static MFVideo3DSampleFormat_BaseView => 0

    /**
     * Each media sample contains multiple buffers, one for each view.
     * @type {Integer (Int32)}
     */
    static MFVideo3DSampleFormat_MultiView => 1

    /**
     * Each media sample contains one buffer, with both views packed side-by-side into a single frame.
     * @type {Integer (Int32)}
     */
    static MFVideo3DSampleFormat_Packed_LeftRight => 2

    /**
     * Each media sample contains one buffer, with both views packed top-and-bottom into a single frame.
     * @type {Integer (Int32)}
     */
    static MFVideo3DSampleFormat_Packed_TopBottom => 3
}
