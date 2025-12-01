#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents codec configuration for HEVC encoding.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_codec_configuration_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * A bitwise OR combination of flags from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_FLAGS](ne-d3d12video-d3d12_video_encoder_codec_configuration_hevc_flags.md) enumeration defining the set of enabled codec features.
     * @type {Integer}
     */
    ConfigurationFlags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A value from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE](ne-d3d12video-d3d12_video_encoder_codec_configuration_hevc_cusize.md) enumeration indicating the minimum luma coding block size to be used in the encoder. This value matches what the caller will code in SPS.
     * @type {Integer}
     */
    MinLumaCodingUnitSize {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A value from the [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_CUSIZE](ne-d3d12video-d3d12_video_encoder_codec_configuration_hevc_cusize.md) enumeration indicating the maximum luma coding block size to be used in the encoder. This value matches what the caller will code in SPS.
     * @type {Integer}
     */
    MaxLumaCodingUnitSize {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A value from the  [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE](ne-d3d12video-d3d12_video_encoder_codec_configuration_hevc_tusize.md) enumeration indicating the minimum luma transform block size to be used in the encoder. This value matches the pixel size of what the user will code in SPS.log2_min_luma_transform_block_size_minus2.
     * @type {Integer}
     */
    MinLumaTransformUnitSize {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE
     * 
     * A value from the  [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_HEVC_TUSIZE](ne-d3d12video-d3d12_video_encoder_codec_configuration_hevc_tusize.md) enumeration indicating the maximum luma transform block size to be used in the encoder. This value has to be consistent with the pixel size the user will code in SPS.log2_diff_max_min_luma_transform_block_size. The variable MaxTbLog2SizeY is set equal to log2_min_luma_transform_block_size_minus2 + 2 + log2_diff_max_min_luma_transform_block_size.
     * @type {Integer}
     */
    MaxLumaTransformUnitSize {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * A UCHAR indicating the maximum hierarchy depth for transform units of coding units coded in inter prediction mode. The value of max_transform_hierarchy_depth_inter shall be in the range of 0 to CtbLog2SizeY − MinTbLog2SizeY, inclusive. The value indicated here must be consistent with the caller-coded SPS headers.
     * @type {Integer}
     */
    max_transform_hierarchy_depth_inter {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * A UCHAR indicating the maximum hierarchy depth for transform units of coding units coded in intra prediction mode. The value of max_transform_hierarchy_depth_intra shall be in the range of 0 to CtbLog2SizeY − MinTbLog2SizeY, inclusive. The value indicated here must be consistent with the caller-coded SPS headers.
     * @type {Integer}
     */
    max_transform_hierarchy_depth_intra {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }
}
