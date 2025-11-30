#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_rate_control_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_DELTA_QP => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_FRAME_ANALYSIS => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_QP_RANGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_INITIAL_QP => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_MAX_FRAME_SIZE => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_VBV_SIZES => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_EXTENSION1_SUPPORT => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_QUALITY_VS_SPEED => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_FLAG_ENABLE_SPATIAL_ADAPTIVE_QP => 256
}
