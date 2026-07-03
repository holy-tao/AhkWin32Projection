#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC.ahk" { D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAGS.ahk" { D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAGS }
#Import ".\D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_HEVC.ahk" { D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_HEVC }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC2 {
    #StructPack 8

    Flags : D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAGS

    FrameType : D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC

    slice_pic_parameter_set_id : UInt32

    PictureOrderCountNumber : UInt32

    TemporalLayerIndex : UInt32

    List0ReferenceFramesCount : UInt32

    pList0ReferenceFrames : IntPtr

    List1ReferenceFramesCount : UInt32

    pList1ReferenceFrames : IntPtr

    ReferenceFramesReconPictureDescriptorsCount : UInt32

    pReferenceFramesReconPictureDescriptors : D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_HEVC.Ptr

    List0RefPicModificationsCount : UInt32

    pList0RefPicModifications : IntPtr

    List1RefPicModificationsCount : UInt32

    pList1RefPicModifications : IntPtr

    QPMapValuesCount : UInt32

    pRateControlQPMap : IntPtr

    diff_cu_chroma_qp_offset_depth : Int8

    log2_sao_offset_scale_luma : Int8

    log2_sao_offset_scale_chroma : Int8

    log2_max_transform_skip_block_size_minus2 : Int8

    chroma_qp_offset_list_len_minus1 : Int8

    cb_qp_offset_list : CHAR[6]

    cr_qp_offset_list : CHAR[6]

    num_ref_idx_l0_active_minus1 : UInt32

    num_ref_idx_l1_active_minus1 : UInt32

}
