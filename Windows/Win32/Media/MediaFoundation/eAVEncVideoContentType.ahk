#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of video content.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavencvideocontenttype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncVideoContentType extends Win32Enum {

    /**
     * Unknown or normal content. (Default.)
     * Native name: eAVEncVideoContentType_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The content was captured with a fixed camera, such as a webcam.
     * Native name: eAVEncVideoContentType_FixedCameraAngle
     * @type {Integer (Int32)}
     */
    static FixedCameraAngle => 1
}
