#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the rotation of the video image in the counter-clockwise direction.
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-rotation">MF_MT_VIDEO_ROTATION</a> attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ne-mfapi-mfvideorotationformat
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFVideoRotationFormat extends Win32Enum {

    /**
     * The image is not rotated.
     * Native name: MFVideoRotationFormat_0
     * @type {Integer (Int32)}
     */
    static 0 => 0

    /**
     * The image is rotated 90 degrees counter-clockwise.
     * Native name: MFVideoRotationFormat_90
     * @type {Integer (Int32)}
     */
    static 90 => 90

    /**
     * The image is rotated 180 degrees.
     * Native name: MFVideoRotationFormat_180
     * @type {Integer (Int32)}
     */
    static 180 => 180

    /**
     * The image is rotated 270 degrees counter-clockwise.
     * Native name: MFVideoRotationFormat_270
     * @type {Integer (Int32)}
     */
    static 270 => 270
}
