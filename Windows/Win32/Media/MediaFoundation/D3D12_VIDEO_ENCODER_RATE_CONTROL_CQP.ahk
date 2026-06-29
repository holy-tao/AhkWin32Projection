#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a rate control structure definition for constant quantization parameter mode.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_rate_control_cqp
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_RATE_CONTROL_CQP {
    #StructPack 4

    /**
     * A UINT64 specifying the quantization parameter that should be used for each fully intra-encoded frame.
     */
    ConstantQP_FullIntracodedFrame : UInt32

    /**
     * A UINT64 specifying the quantization parameter that should be used for each encoded frame that has inter-picture references to pictures (in display order) before the current one.
     */
    ConstantQP_InterPredictedFrame_PrevRefOnly : UInt32

    /**
     * A UINT64 specifying the quantization parameter that should be used for each encoded frame that has inter-picture references to pictures (in display order) both from previous and next frames.
     */
    ConstantQP_InterPredictedFrame_BiDirectionalRef : UInt32

}
