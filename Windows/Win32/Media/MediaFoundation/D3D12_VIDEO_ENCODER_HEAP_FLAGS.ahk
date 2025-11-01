#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_heap_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_HEAP_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_HEAP_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_HEAP_FLAG_ALLOW_SUBREGION_NOTIFICATION_ARRAY_OF_BUFFERS => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_HEAP_FLAG_ALLOW_SUBREGION_NOTIFICATION_SINGLE_BUFFER => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_HEAP_FLAG_ALLOW_DIRTY_REGIONS => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_HEAP_FLAG_ALLOW_RATE_CONTROL_FRAME_ANALYSIS => 8
}
