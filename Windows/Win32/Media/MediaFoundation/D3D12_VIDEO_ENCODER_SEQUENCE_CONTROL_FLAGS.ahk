#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_sequence_control_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_RESOLUTION_CHANGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_RATE_CONTROL_CHANGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_SUBREGION_LAYOUT_CHANGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_REQUEST_INTRA_REFRESH => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_SEQUENCE_CONTROL_FLAG_GOP_SEQUENCE_CHANGE => 16
}
