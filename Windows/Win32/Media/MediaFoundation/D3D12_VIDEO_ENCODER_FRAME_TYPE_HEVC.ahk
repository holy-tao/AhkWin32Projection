#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of an HEVC video frame.
 * @remarks
 * The following table lists the expected HEVC header frame type for each HEVC frame type value.
 * 
 * | Syntax element | Expected default value |
 * |---------------|---------------------------|
 * | D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC_I_FRAME	| nal_unit_type = CRA_NUT |
 * | D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC_P_FRAME	| nal_unit_type = TRAIL_R |
 * | D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC_B_FRAME	| nal_unit_type = TRAIL_R |
 * | D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC_IDR_FRAME	| nal_unit_type = IDR_W_RADL |
 * 
 * 
 * If [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAG_P_FRAMES_IMPLEMENTED_AS_LOW_DELAY_B_FRAMES](ne-d3d12video-d3d12_video_encoder_codec_configuration_support_hevc_flags.md) is set, it informs the caller that when encoding frames with type **D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC_P_FRAME**, they will be written as low delay B-Frames in the compressed bitstream. If bit is not set, it informs the caller P frames will be written in the compressed bitstream. Note that When operating under this mode, is the caller's responsibility to code the correct frame type in AUD_NUT and other parts of the HEVC bitstream, taking into account that P frames will be treated as generalized B frames with only references to past frames in POC order.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ne-d3d12video-d3d12_video_encoder_frame_type_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC extends Win32Enum{

    /**
     * I-Frame. Completely intra-coded frame.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC_I_FRAME => 0

    /**
     * P-Frame. Allows references to past frames.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC_P_FRAME => 1

    /**
     * B-Frame. Allows references to both past and future (in display order) frames.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC_B_FRAME => 2

    /**
     * Instantaneous decode refresh frame. A special type of I-frame where no frame after it can reference any frame before it.
     * @type {Integer (Int32)}
     */
    static D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC_IDR_FRAME => 3
}
