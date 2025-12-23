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
class D3D12_VIDEO_PROCESS_FILTER_FLAGS extends Win32BitflagEnum{

    /**
     * The video processor doesn't support any filters.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_FLAG_NONE => 0

    /**
     * The video processor can adjust the brightness level.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_FLAG_BRIGHTNESS => 1

    /**
     * The video processor can adjust the contrast level.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_FLAG_CONTRAST => 2

    /**
     * The video processor can adjust hue.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_FLAG_HUE => 4

    /**
     * The video processor can adjust the saturation level.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_FLAG_SATURATION => 8

    /**
     * The video processor can perform noise reduction.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_FLAG_NOISE_REDUCTION => 16

    /**
     * The video processor can perform edge enhancement.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_FLAG_EDGE_ENHANCEMENT => 32

    /**
     * The video processor can perform anamorphic scaling. Anamorphic scaling can be used to stretch 4:3 content to a widescreen 16:9 aspect ratio.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_FLAG_ANAMORPHIC_SCALING => 64

    /**
     * For stereo 3D video, the video processor can adjust the offset between the left and right views, allowing the user to reduce potential eye strain.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_PROCESS_FILTER_FLAG_STEREO_ADJUSTMENT => 128
}
