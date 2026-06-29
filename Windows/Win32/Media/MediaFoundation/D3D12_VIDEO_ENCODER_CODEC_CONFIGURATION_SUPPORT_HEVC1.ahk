#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS1.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS1 }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE }
#Import ".\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS.ahk" { D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC1 {
    #StructPack 4

    SupportFlags : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS

    MinLumaCodingUnitSize : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE

    MaxLumaCodingUnitSize : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE

    MinLumaTransformUnitSize : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE

    MaxLumaTransformUnitSize : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE

    max_transform_hierarchy_depth_inter : Int8

    max_transform_hierarchy_depth_intra : Int8

    allowed_diff_cu_chroma_qp_offset_depth_values : UInt32

    allowed_log2_sao_offset_scale_luma_values : UInt32

    allowed_log2_sao_offset_scale_chroma_values : UInt32

    allowed_log2_max_transform_skip_block_size_minus2_values : UInt32

    allowed_chroma_qp_offset_list_len_minus1_values : UInt32

    allowed_cb_qp_offset_list_values : UInt32[6]

    allowed_cr_qp_offset_list_values : UInt32[6]

    SupportFlags1 : D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS1

}
