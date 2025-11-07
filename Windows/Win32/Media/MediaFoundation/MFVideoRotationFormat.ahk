#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the rotation of the video image in the counter-clockwise direction.
 * @remarks
 * 
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-rotation">MF_MT_VIDEO_ROTATION</a> attribute.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ne-mfapi-mfvideorotationformat
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoRotationFormat{

    /**
     * The image is not rotated.
     * @type {Integer (Int32)}
     */
    static MFVideoRotationFormat_0 => 0

    /**
     * The image is rotated 90 degrees counter-clockwise.
     * @type {Integer (Int32)}
     */
    static MFVideoRotationFormat_90 => 90

    /**
     * The image is rotated 180 degrees.
     * @type {Integer (Int32)}
     */
    static MFVideoRotationFormat_180 => 180

    /**
     * The image is rotated 270 degrees counter-clockwise.
     * @type {Integer (Int32)}
     */
    static MFVideoRotationFormat_270 => 270
}
