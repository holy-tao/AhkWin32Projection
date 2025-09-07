#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how a video frame is interlaced.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_field_type
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_FIELD_TYPE{

    /**
     * The frame is progressive.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_FIELD_TYPE_NONE => 0

    /**
     * The frame is interlaced. The top field of each frame is displayed first.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_FIELD_TYPE_INTERLACED_TOP_FIELD_FIRST => 1

    /**
     * The frame is interlaced. The bottom field of each frame is displayed first.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_FIELD_TYPE_INTERLACED_BOTTOM_FIELD_FIRST => 2
}
