#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mf_transfer_video_frame_flags
 * @namespace Windows.Win32.Media.Streaming
 * @version v4.0.30319
 */
class MF_TRANSFER_VIDEO_FRAME_FLAGS extends Win32Enum{

    /**
     * Use the default transfer behavior.
     * @type {Integer (Int32)}
     */
    static MF_TRANSFER_VIDEO_FRAME_DEFAULT => 0

    /**
     * Stretch the video frame.
     * @type {Integer (Int32)}
     */
    static MF_TRANSFER_VIDEO_FRAME_STRETCH => 1

    /**
     * >>>>>>> master
     * @type {Integer (Int32)}
     */
    static MF_TRANSFER_VIDEO_FRAME_IGNORE_PAR => 2
}
