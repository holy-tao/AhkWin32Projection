#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC1 extends Win32Struct
{
    static sizeof => 96

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SupportFlags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    MinLumaCodingUnitSize {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    MaxLumaCodingUnitSize {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    MinLumaTransformUnitSize {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    MaxLumaTransformUnitSize {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    max_transform_hierarchy_depth_inter {
        get => NumGet(this, 20, "char")
        set => NumPut("char", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    max_transform_hierarchy_depth_intra {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * @type {Integer}
     */
    allowed_diff_cu_chroma_qp_offset_depth_values {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    allowed_log2_sao_offset_scale_luma_values {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    allowed_log2_sao_offset_scale_chroma_values {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    allowed_log2_max_transform_skip_block_size_minus2_values {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    allowed_chroma_qp_offset_list_len_minus1_values {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Array<UInt32>}
     */
    allowed_cb_qp_offset_list_values{
        get {
            if(!this.HasProp("__allowed_cb_qp_offset_list_valuesProxyArray"))
                this.__allowed_cb_qp_offset_list_valuesProxyArray := Win32FixedArray(this.ptr + 44, 6, Primitive, "uint")
            return this.__allowed_cb_qp_offset_list_valuesProxyArray
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    allowed_cr_qp_offset_list_values{
        get {
            if(!this.HasProp("__allowed_cr_qp_offset_list_valuesProxyArray"))
                this.__allowed_cr_qp_offset_list_valuesProxyArray := Win32FixedArray(this.ptr + 68, 6, Primitive, "uint")
            return this.__allowed_cr_qp_offset_list_valuesProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    SupportFlags1 {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }
}
