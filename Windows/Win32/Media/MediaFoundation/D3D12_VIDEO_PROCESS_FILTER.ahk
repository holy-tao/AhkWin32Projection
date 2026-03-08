#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies support for the image filters defined by the D3D12_VIDEO_PROCESS_FILTER enumeration.
 * @remarks
 * See [D3D12\_VIDEO\_PROCESS\_INPUT\_STREAM\_DESC](ns-d3d12video-d3d12_video_process_input_stream_desc.md) for information on applying a particular filter.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_process_filter_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_PROCESS_FILTER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_BRIGHTNESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_CONTRAST => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_HUE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_SATURATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_NOISE_REDUCTION => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_EDGE_ENHANCEMENT => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_ANAMORPHIC_SCALING => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_STEREO_ADJUSTMENT => 7
}
