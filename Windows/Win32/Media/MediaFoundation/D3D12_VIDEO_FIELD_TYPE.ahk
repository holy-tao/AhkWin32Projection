#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how a video frame is interlaced.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_field_type
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_FIELD_TYPE extends Win32Enum {

    /**
     * The frame is progressive.
     * Native name: D3D12_VIDEO_FIELD_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The frame is interlaced. The top field of each frame is displayed first.
     * Native name: D3D12_VIDEO_FIELD_TYPE_INTERLACED_TOP_FIELD_FIRST
     * @type {Integer (Int32)}
     */
    static INTERLACED_TOP_FIELD_FIRST => 1

    /**
     * The frame is interlaced. The bottom field of each frame is displayed first.
     * Native name: D3D12_VIDEO_FIELD_TYPE_INTERLACED_BOTTOM_FIELD_FIRST
     * @type {Integer (Int32)}
     */
    static INTERLACED_BOTTOM_FIELD_FIRST => 2
}
