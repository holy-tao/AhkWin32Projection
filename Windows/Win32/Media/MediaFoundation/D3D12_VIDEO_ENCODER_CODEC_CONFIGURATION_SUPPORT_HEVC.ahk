#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS }

/**
 * Represents encoder codec configuration support for HEVC encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_codec_configuration_support_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC {
    #StructPack 4

    /**
     * A bitwise OR combination of flags from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS](ne-d3d12video-d3d12_video_encoder_codec_configuration_support_hevc_flags.md) specifying which optional features are supported for the codec.
     */
    SupportFlags : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS

    /**
     * The minimum luma coding block size requested. This value must match what the caller will code in the sequence parameter set (SPS).
     */
    MinLumaCodingUnitSize : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE

    /**
     * The maximum luma coding block size requested. This value matches what the user will code in SPS.
     */
    MaxLumaCodingUnitSize : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE

    /**
     * The minimum luma transform block size requested. This value matches the pixel size of what the user will code in SPS.log2_min_luma_transform_block_size_minus2.
     */
    MinLumaTransformUnitSize : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE

    /**
     * The maximum luma transform block size requested. This value must be consistent with the pixel size the user will code in SPS.log2_diff_max_min_luma_transform_block_size. The variable MaxTbLog2SizeY is set equal to log2_min_luma_transform_block_size_minus2 + 2 + log2_diff_max_min_luma_transform_block_size.
     */
    MaxLumaTransformUnitSize : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE

    /**
     * The maximum hierarchy depth for transform units of coding units coded in inter prediction mode. The value of max_transform_hierarchy_depth_inter shall be in the range of 0 to CtbLog2SizeY − MinTbLog2SizeY, inclusive.
     */
    max_transform_hierarchy_depth_inter : Int8

    /**
     * Specifies the maximum hierarchy depth for transform units of coding units coded in intra prediction mode. The value of max_transform_hierarchy_depth_intra shall be in the range of 0 to CtbLog2SizeY − MinTbLog2SizeY, inclusive.
     */
    max_transform_hierarchy_depth_intra : Int8

}
