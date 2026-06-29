#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * . (MF_TRANSFER_VIDEO_FRAME_FLAGS)
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_transfer_video_frame_flags
 * @namespace Windows.Win32.Media.Streaming
 */
export default struct MF_TRANSFER_VIDEO_FRAME_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
