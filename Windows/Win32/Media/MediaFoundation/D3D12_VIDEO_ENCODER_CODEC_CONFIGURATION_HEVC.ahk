#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAGS.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAGS }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE }

/**
 * Represents codec configuration for HEVC encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_codec_configuration_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC {
    #StructPack 4

    /**
     * A bitwise OR combination of flags from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAGS](ne-d3d12video-d3d12_video_encoder_codec_configuration_hevc_flags.md) enumeration defining the set of enabled codec features.
     */
    ConfigurationFlags : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAGS

    /**
     * A value from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE](ne-d3d12video-d3d12_video_encoder_codec_configuration_hevc_cusize.md) enumeration indicating the minimum luma coding block size to be used in the encoder. This value matches what the caller will code in SPS.
     */
    MinLumaCodingUnitSize : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE

    /**
     * A value from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE](ne-d3d12video-d3d12_video_encoder_codec_configuration_hevc_cusize.md) enumeration indicating the maximum luma coding block size to be used in the encoder. This value matches what the caller will code in SPS.
     */
    MaxLumaCodingUnitSize : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE

    /**
     * A value from the  [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE](ne-d3d12video-d3d12_video_encoder_codec_configuration_hevc_tusize.md) enumeration indicating the minimum luma transform block size to be used in the encoder. This value matches the pixel size of what the user will code in SPS.log2_min_luma_transform_block_size_minus2.
     */
    MinLumaTransformUnitSize : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE

    /**
     * D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE
     * 
     * A value from the  [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE](ne-d3d12video-d3d12_video_encoder_codec_configuration_hevc_tusize.md) enumeration indicating the maximum luma transform block size to be used in the encoder. This value has to be consistent with the pixel size the user will code in SPS.log2_diff_max_min_luma_transform_block_size. The variable MaxTbLog2SizeY is set equal to log2_min_luma_transform_block_size_minus2 + 2 + log2_diff_max_min_luma_transform_block_size.
     */
    MaxLumaTransformUnitSize : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE

    /**
     * A UCHAR indicating the maximum hierarchy depth for transform units of coding units coded in inter prediction mode. The value of max_transform_hierarchy_depth_inter shall be in the range of 0 to CtbLog2SizeY − MinTbLog2SizeY, inclusive. The value indicated here must be consistent with the caller-coded SPS headers.
     */
    max_transform_hierarchy_depth_inter : Int8

    /**
     * A UCHAR indicating the maximum hierarchy depth for transform units of coding units coded in intra prediction mode. The value of max_transform_hierarchy_depth_intra shall be in the range of 0 to CtbLog2SizeY − MinTbLog2SizeY, inclusive. The value indicated here must be consistent with the caller-coded SPS headers.
     */
    max_transform_hierarchy_depth_intra : Int8

}
