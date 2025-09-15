#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC1 extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    FrameType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    slice_pic_parameter_set_id {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    PictureOrderCountNumber {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    TemporalLayerIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    List0ReferenceFramesCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    pList0ReferenceFrames {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    List1ReferenceFramesCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    pList1ReferenceFrames {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ReferenceFramesReconPictureDescriptorsCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_HEVC>}
     */
    pReferenceFramesReconPictureDescriptors {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    List0RefPicModificationsCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    pList0RefPicModifications {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    List1RefPicModificationsCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    pList1RefPicModifications {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    QPMapValuesCount {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Pointer<SByte>}
     */
    pRateControlQPMap {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    diff_cu_chroma_qp_offset_depth {
        get => NumGet(this, 112, "char")
        set => NumPut("char", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    log2_sao_offset_scale_luma {
        get => NumGet(this, 113, "char")
        set => NumPut("char", value, this, 113)
    }

    /**
     * @type {Integer}
     */
    log2_sao_offset_scale_chroma {
        get => NumGet(this, 114, "char")
        set => NumPut("char", value, this, 114)
    }

    /**
     * @type {Integer}
     */
    log2_max_transform_skip_block_size_minus2 {
        get => NumGet(this, 115, "char")
        set => NumPut("char", value, this, 115)
    }

    /**
     * @type {Integer}
     */
    chroma_qp_offset_list_len_minus1 {
        get => NumGet(this, 116, "char")
        set => NumPut("char", value, this, 116)
    }

    /**
     * @type {String}
     */
    cb_qp_offset_list {
        get => StrGet(this.ptr + 118, 5, "UTF-16")
        set => StrPut(value, this.ptr + 118, 5, "UTF-16")
    }

    /**
     * @type {String}
     */
    cr_qp_offset_list {
        get => StrGet(this.ptr + 130, 5, "UTF-16")
        set => StrPut(value, this.ptr + 130, 5, "UTF-16")
    }
}
