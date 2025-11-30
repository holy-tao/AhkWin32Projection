#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how to rotate a video image.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mf_video_processor_rotation
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_VIDEO_PROCESSOR_ROTATION extends Win32Enum{

    /**
     * Do not rotate the image.
     * @type {Integer (Int32)}
     */
    static ROTATION_NONE => 0

    /**
     * Rotate the image to the correct viewing orientation.
     * @type {Integer (Int32)}
     */
    static ROTATION_NORMAL => 1
}
