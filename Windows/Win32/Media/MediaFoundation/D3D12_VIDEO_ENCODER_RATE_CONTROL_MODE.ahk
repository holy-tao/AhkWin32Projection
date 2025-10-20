#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_rate_control_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE{

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_ABSOLUTE_QP_MAP => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_CQP => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_CBR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_VBR => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_QVBR => 4
}
