#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents encoding statistics about a ID3D12VideoEncodeCommandList2::EncodeFrame operation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_output_metadata_statistics
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_OUTPUT_METADATA_STATISTICS {
    #StructPack 8

    /**
     * Output field that receives the average QP value used for encoding this frame.
     */
    AverageQP : Int64

    /**
     * Output field that receives the number of intra-coded coding units used in this frame.
     */
    IntraCodingUnitsCount : Int64

    /**
     * Output field that receives the number of inter-coded coding units used in this frame.
     */
    InterCodingUnitsCount : Int64

    /**
     * Output field that receives the number of skip coding units used in this frame.
     */
    SkipCodingUnitsCount : Int64

    /**
     * Output field that receives the average motion vector shift in X direction.
     */
    AverageMotionEstimationXDirection : Int64

    /**
     * Output field that receives the average motion vector shift in Y direction.
     */
    AverageMotionEstimationYDirection : Int64

}
