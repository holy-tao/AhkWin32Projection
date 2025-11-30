#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags for indicating a subset of components used with video decode histogram.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/ne-d3d12video-d3d12_video_decode_histogram_component_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAGS extends Win32BitflagEnum{

    /**
     * No associated component.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_NONE => 0

    /**
     * If the format is a YUV format, indicates the Y component.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_Y => 1

    /**
     * If the format is a YUV format, indicates the U component.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_U => 2

    /**
     * If the format is a YUV format, indicates the V component.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_V => 4

    /**
     * If the format is an RGB/BGR format, indicates the R component.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_R => 1

    /**
     * If the format is an RGB/BGR format, indicates the G component.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_G => 2

    /**
     * If the format is an RGB/BGR format, indicates the B component.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_B => 4

    /**
     * If the format is an RGB/BGR format, indicates the A component.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_DECODE_HISTOGRAM_COMPONENT_FLAG_A => 8
}
