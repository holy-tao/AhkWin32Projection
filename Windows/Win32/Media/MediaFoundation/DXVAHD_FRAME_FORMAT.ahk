#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes how a video stream is interlaced.
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ne-dxvahd-dxvahd_frame_format
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_FRAME_FORMAT{

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
