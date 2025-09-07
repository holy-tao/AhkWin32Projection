#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies video encoder rate control modes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_rate_control_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE{

    /**
     * No rate control budgeting. Each [EncodeFrame](nf-d3d12video-id3d12videoencodecommandlist2-encodeframe.md) call will interpret the the QP values in the **pRateControlQPMap** field of the [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264](ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264.md) or [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC](ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_hevc.md) structure as a map of absolute QP values.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_ABSOLUTE_QP_MAP => 0

    /**
     * Constant quantization parameter rate control mode.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_CQP => 1

    /**
     * Constant bit rate rate control mode.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_CBR => 2

    /**
     * Variable bit rate control mode.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_VBR => 3

    /**
     * Constant quality target rate variable rate control mode.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_QVBR => 4
}
