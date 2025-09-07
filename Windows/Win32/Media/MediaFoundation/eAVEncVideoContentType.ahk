#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of video content.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideocontenttype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVEncVideoContentType{

    /**
     * Unknown or normal content. (Default.)
     * @type {Integer (Int32)}
     */
    static eAVEncVideoContentType_Unknown => 0

    /**
     * The content was captured with a fixed camera, such as a webcam.
     * @type {Integer (Int32)}
     */
    static eAVEncVideoContentType_FixedCameraAngle => 1
}
