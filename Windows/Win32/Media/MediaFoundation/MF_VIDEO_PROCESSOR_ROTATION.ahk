#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to rotate a video image.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_video_processor_rotation
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_VIDEO_PROCESSOR_ROTATION extends Win32Enum {

    /**
     * Do not rotate the image.
     * Native name: ROTATION_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Rotate the image to the correct viewing orientation.
     * Native name: ROTATION_NORMAL
     * @type {Integer (Int32)}
     */
    static NORMAL => 1
}
