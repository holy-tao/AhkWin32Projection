#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies heap options for video encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_heap_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_HEAP_FLAGS extends Win32BitflagEnum {

    /**
     * No flags.
     * Native name: D3D12_VIDEO_ENCODER_HEAP_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_VIDEO_ENCODER_HEAP_FLAG_ALLOW_SUBREGION_NOTIFICATION_ARRAY_OF_BUFFERS
     * @type {Integer (Int32)}
     */
    static FLAG_ALLOW_SUBREGION_NOTIFICATION_ARRAY_OF_BUFFERS => 1

    /**
     * Native name: D3D12_VIDEO_ENCODER_HEAP_FLAG_ALLOW_SUBREGION_NOTIFICATION_SINGLE_BUFFER
     * @type {Integer (Int32)}
     */
    static FLAG_ALLOW_SUBREGION_NOTIFICATION_SINGLE_BUFFER => 2

    /**
     * Native name: D3D12_VIDEO_ENCODER_HEAP_FLAG_ALLOW_DIRTY_REGIONS
     * @type {Integer (Int32)}
     */
    static FLAG_ALLOW_DIRTY_REGIONS => 4

    /**
     * Native name: D3D12_VIDEO_ENCODER_HEAP_FLAG_ALLOW_RATE_CONTROL_FRAME_ANALYSIS
     * @type {Integer (Int32)}
     */
    static FLAG_ALLOW_RATE_CONTROL_FRAME_ANALYSIS => 8
}
