#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how a 3D video frame is stored in a media sample.
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfsampleextension-3dvideo-sampleformat">MFSampleExtension_3DVideo_SampleFormat</a> attribute.
  * 
  * The exact layout of the views in memory is specified by the following media type attributes:<ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-3d-format">MF_MT_VIDEO_3D_FORMAT</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-3d-first-is-left">MF_MT_VIDEO_3D_FIRST_IS_LEFT</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-3d-left-is-base">MF_MT_VIDEO_3D_LEFT_IS_BASE</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-3d-num-views">MF_MT_VIDEO_3D_NUM_VIEWS</a>
  * </li>
  * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ne-mfapi-mfvideo3dsampleformat
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideo3DSampleFormat{

    /**
     * Each view is stored in a separate buffer. The sample contains one buffer per view.
     * @type {Integer (Int32)}
     */
    static MFSampleExtension_3DVideo_MultiView => 1

    /**
     * All of the views are stored in the same buffer. The sample contains a single buffer.
     * @type {Integer (Int32)}
     */
    static MFSampleExtension_3DVideo_Packed => 0
}
