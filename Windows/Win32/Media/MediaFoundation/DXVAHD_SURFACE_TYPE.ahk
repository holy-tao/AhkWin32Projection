#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of video surface created by a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) device.
 * @remarks
 * 
 * If the DXVA-HD device is a software plug-in and the surface type is <b>DXVAHD_SURFACE_TYPE_VIDEO_INPUT_PRIVATE</b>, the device can support format types that are not supported natively by the graphics driver. For example, if the application requests an AYUV surface, the device could allocate a surface with a surface type of <b>D3DFMT_A8R8G8B8</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ne-dxvahd-dxvahd_surface_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_SURFACE_TYPE{

    /**
     * A surface for an input stream. This surface type is equivalent to an off-screen plain surface in Microsoft Direct3D. The application can use the surface in Direct3D calls.
     * @type {Integer (Int32)}
     */
    static DXVAHD_SURFACE_TYPE_VIDEO_INPUT => 0

    /**
     * A private surface for an input stream. This surface type is equivalent to an off-screen plain surface, except that the application cannot use the surface in Direct3D calls.
     * @type {Integer (Int32)}
     */
    static DXVAHD_SURFACE_TYPE_VIDEO_INPUT_PRIVATE => 1

    /**
     * A surface for an output stream. This surface type is equivalent to an off-screen plain surface in Direct3D. The application can use the surface in Direct3D calls. 
     * 
     * This surface type is recommended for video processing applications that need to lock the surface and access the surface memory. For video playback with optimal performance, a render-target surface or swap chain is recommended instead.
     * @type {Integer (Int32)}
     */
    static DXVAHD_SURFACE_TYPE_VIDEO_OUTPUT => 2
}
