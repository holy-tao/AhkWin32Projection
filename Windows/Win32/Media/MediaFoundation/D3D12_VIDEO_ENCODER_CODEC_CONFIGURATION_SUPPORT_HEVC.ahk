#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE.ahk
#Include .\D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE.ahk

/**
 * Represents encoder codec configuration support for HEVC encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_codec_configuration_support_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * A bitwise OR combination of flags from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS](ne-d3d12video-d3d12_video_encoder_codec_configuration_support_hevc_flags.md) specifying which optional features are supported for the codec.
     * @type {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC_FLAGS}
     */
    SupportFlags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The minimum luma coding block size requested. This value must match what the caller will code in the sequence parameter set (SPS).
     * @type {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE}
     */
    MinLumaCodingUnitSize {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The maximum luma coding block size requested. This value matches what the user will code in SPS.
     * @type {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE}
     */
    MaxLumaCodingUnitSize {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The minimum luma transform block size requested. This value matches the pixel size of what the user will code in SPS.log2_min_luma_transform_block_size_minus2.
     * @type {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE}
     */
    MinLumaTransformUnitSize {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * The maximum luma transform block size requested. This value must be consistent with the pixel size the user will code in SPS.log2_diff_max_min_luma_transform_block_size. The variable MaxTbLog2SizeY is set equal to log2_min_luma_transform_block_size_minus2 + 2 + log2_diff_max_min_luma_transform_block_size.
     * @type {D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE}
     */
    MaxLumaTransformUnitSize {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The maximum hierarchy depth for transform units of coding units coded in inter prediction mode. The value of max_transform_hierarchy_depth_inter shall be in the range of 0 to CtbLog2SizeY − MinTbLog2SizeY, inclusive.
     * @type {Integer}
     */
    max_transform_hierarchy_depth_inter {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * Specifies the maximum hierarchy depth for transform units of coding units coded in intra prediction mode. The value of max_transform_hierarchy_depth_intra shall be in the range of 0 to CtbLog2SizeY − MinTbLog2SizeY, inclusive.
     * @type {Integer}
     */
    max_transform_hierarchy_depth_intra {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }
}
