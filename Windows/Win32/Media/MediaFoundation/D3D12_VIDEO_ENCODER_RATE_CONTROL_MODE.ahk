#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies video encoder rate control modes.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_rate_control_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE extends Win32Enum {

    /**
     * No rate control budgeting. Each [EncodeFrame](nf-d3d12video-id3d12videoencodecommandlist2-encodeframe.md) call will interpret the the QP values in the **pRateControlQPMap** field of the [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264](ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264.md) or [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC](ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_hevc.md) structure as a map of absolute QP values.
     * Native name: D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_ABSOLUTE_QP_MAP
     * @type {Integer (Int32)}
     */
    static ABSOLUTE_QP_MAP => 0

    /**
     * Constant quantization parameter rate control mode.
     * Native name: D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_CQP
     * @type {Integer (Int32)}
     */
    static CQP => 1

    /**
     * Constant bit rate rate control mode.
     * Native name: D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_CBR
     * @type {Integer (Int32)}
     */
    static CBR => 2

    /**
     * Variable bit rate control mode.
     * Native name: D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_VBR
     * @type {Integer (Int32)}
     */
    static VBR => 3

    /**
     * Constant quality target rate variable rate control mode.
     * Native name: D3D12_VIDEO_ENCODER_RATE_CONTROL_MODE_QVBR
     * @type {Integer (Int32)}
     */
    static QVBR => 4
}
