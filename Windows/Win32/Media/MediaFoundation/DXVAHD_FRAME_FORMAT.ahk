#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes how a video stream is interlaced. (DXVAHD_FRAME_FORMAT)
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ne-dxvahd-dxvahd_frame_format
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_FRAME_FORMAT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Frames are progressive.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FRAME_FORMAT_PROGRESSIVE => 0

    /**
     * Frames are interlaced. The top field of each frame is displayed first.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FRAME_FORMAT_INTERLACED_TOP_FIELD_FIRST => 1

    /**
     * Frame are interlaced. The bottom field of each frame is displayed first.
     * @type {Integer (Int32)}
     */
    static DXVAHD_FRAME_FORMAT_INTERLACED_BOTTOM_FIELD_FIRST => 2
}
