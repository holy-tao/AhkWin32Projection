#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * . (MF_TRANSFER_VIDEO_FRAME_FLAGS)
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_transfer_video_frame_flags
 * @namespace Windows.Win32.Media.Streaming
 */
class MF_TRANSFER_VIDEO_FRAME_FLAGS extends Win32Enum {

    /**
     * Use the default transfer behavior.
     * Native name: MF_TRANSFER_VIDEO_FRAME_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 0

    /**
     * Stretch the video frame.
     * Native name: MF_TRANSFER_VIDEO_FRAME_STRETCH
     * @type {Integer (Int32)}
     */
    static STRETCH => 1

    /**
     * >>>>>>> master
     * Native name: MF_TRANSFER_VIDEO_FRAME_IGNORE_PAR
     * @type {Integer (Int32)}
     */
    static IGNORE_PAR => 2
}
