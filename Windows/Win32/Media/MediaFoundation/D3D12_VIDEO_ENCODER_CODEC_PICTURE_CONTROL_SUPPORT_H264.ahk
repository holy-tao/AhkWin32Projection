#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents picture control support settings for H.264 video encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_codec_picture_control_support_h264
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_CODEC_PICTURE_CONTROL_SUPPORT_H264 {
    #StructPack 4

    /**
     * The maximum value allowed in the slice headers for (num_ref_idx_l0_active_minus1 +1) when encoding P frames. This is equivalent to the maximum size of an L0 for a P frame supported.
     */
    MaxL0ReferencesForP : UInt32

    /**
     * The maximum value allowed in the slice headers for (num_ref_idx_l0_active_minus1 +1) when encoding B frames. This is equivalent to the maximum size of an L0 for a B frame supported.
     */
    MaxL0ReferencesForB : UInt32

    /**
     * The maximum value allowed in the slice headers for (num_ref_idx_l1_active_minus1 +1) when encoding B frames. This is equivalent to the maximum size of an L1 for a B frame supported.
     */
    MaxL1ReferencesForB : UInt32

    /**
     * The maximum number of references used in a frame that can be marked as long term reference.
     */
    MaxLongTermReferences : UInt32

    /**
     * The maximum number of unique pictures that can be used from the DPB the caller manages (number of unique indices in L0 union L1) for a given [EncodeFrame](nf-d3d12video-id3d12videoencodecommandlist2-encodeframe.md) command on the underlying hardware.
     */
    MaxDPBCapacity : UInt32

}
