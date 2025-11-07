#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how to output a 3D stereoscopic video stream.
 * @remarks
 * 
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-enable-3dvideo-output">MF_ENABLE_3DVIDEO_OUTPUT</a> attribute.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mftransform/ne-mftransform-mf3dvideooutputtype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF3DVideoOutputType{

    /**
     * Output the base view only. Discard the other view.
     * @type {Integer (Int32)}
     */
    static MF3DVideoOutputType_BaseView => 0

    /**
     * Output a stereo view (two buffers).
     * @type {Integer (Int32)}
     */
    static MF3DVideoOutputType_Stereo => 1
}
