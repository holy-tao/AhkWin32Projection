#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to output a 3D stereoscopic video stream.
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-enable-3dvideo-output">MF_ENABLE_3DVIDEO_OUTPUT</a> attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/ne-mftransform-mf3dvideooutputtype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF3DVideoOutputType extends Win32Enum {

    /**
     * Output the base view only. Discard the other view.
     * Native name: MF3DVideoOutputType_BaseView
     * @type {Integer (Int32)}
     */
    static BaseView => 0

    /**
     * Output a stereo view (two buffers).
     * Native name: MF3DVideoOutputType_Stereo
     * @type {Integer (Int32)}
     */
    static Stereo => 1
}
