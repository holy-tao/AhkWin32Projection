#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_H264.ahk" { D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_H264 }
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_MARKING_OPERATION.ahk" { D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_MARKING_OPERATION }
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION.ahk" { D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION }
#Import ".\D3D12_VIDEO_ENCODER_FRAME_TYPE_H264.ahk" { D3D12_VIDEO_ENCODER_FRAME_TYPE_H264 }
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_FLAGS.ahk" { D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_FLAGS }

/**
 * Represents the picture level control elements for the associated EncodeFrame command for H.264 encoding.
 * @remarks
 * Note that if the current frame is marked as a reference picture, the output must contain the reconstructed picture along with the bitstream for the host to place it in future commands in the reconstructed pictures reference list. Note that there might be limitations for some frame types to be marked as references, check feature support before setting those values.
 * 
 * 
 * The following tables list the expected SPS and PPS Values for H264 encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264 {
    #StructPack 8

    /**
     * A bitwise OR combination of values from the [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_FLAGS](ne-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264_flags.md) enumeration specifying configuration flags for the frame being encoded.
     */
    Flags : D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_FLAGS

    /**
     * A value from the [D3D12_VIDEO_ENCODER_FRAME_TYPE_H264](ne-d3d12video-d3d12_video_encoder_frame_type_h264.md) enumeration specifying the picture type. Make sure that the codec-specific flags support the specified type. This selection must be kept in sync with the GOP structure configuration set by the host. Note that the GOP is defined in display order and this pic type selection must follow the GOP, but in encode order.
     */
    FrameType : D3D12_VIDEO_ENCODER_FRAME_TYPE_H264

    /**
     * A **UINT** specifying the value to be used in the slice headers of the current frame to reference the PPS.
     */
    pic_parameter_set_id : UInt32

    /**
     * When **FrameType**** is **D3D12_VIDEO_ENCODER_FRAME_TYPE_H264_IDR_FRAME**, a **UINT** indicating the identifier of the IDR frame to be used in all the slices headers present in the frame.
     */
    idr_pic_id : UInt32

    /**
     * A **UINT** specifying the current frame display order.
     */
    PictureOrderCountNumber : UInt32

    /**
     * A **UINT** specifying the frame decode order with semantic as indicated by the slice header frame_num syntax element that increments after each reference picture.
     */
    FrameDecodingOrderNumber : UInt32

    /**
     * A **UINT** specifying the picture layer number in temporal hierarchy. Check for the maximum number of layers in [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264](ns-d3d12video-d3d12_video_encoder_codec_configuration_support_h264.md).
     */
    TemporalLayerIndex : UInt32

    /**
     * A **UINT** specifying the number of past frame references to be used for this frame. This value should be coherent with what was exposed in **D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264**.
     */
    List0ReferenceFramesCount : UInt32

    /**
     * A pointer to a **UINT** array specifying the list of past frame reference frames to be used for this frame. Each integer value in this array indices into *pReferenceFramesReconPictureDescriptors* to reference pictures kept in the DPB.
     */
    pList0ReferenceFrames : IntPtr

    /**
     * A **UINT** specifying the number of future frame references to be used for this frame. This value should be coherent with what was exposed in **D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264**.
     */
    List1ReferenceFramesCount : UInt32

    /**
     * A pointer to a **UINT** array specifying the list of future frame reference frames to be used for this frame. Each integer value in this array indices into *pReferenceFramesReconPictureDescriptors* to reference pictures kept in the DPB.
     */
    pList1ReferenceFrames : IntPtr

    /**
     * A **UINT** specifying the number of entries in *pReferenceFramesReconPictureDescriptors*.
     */
    ReferenceFramesReconPictureDescriptorsCount : UInt32

    /**
     * A pointer to a **UINT** array that describes the current state of the DPB buffer kept in [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC.ReferenceFrames](ns-d3d12video-d3d12_video_encoder_picture_control_desc.md). The *pList0ReferenceFrames* and *pList1ReferenceFrames* lists indices map from past/future references into this descriptors array.
     * 
     * This array of descriptors, in turn, maps a reference picture for this frame into a resource index in the reconstructed pictures array **D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC.ReferenceFrames**. Additionally, for each reference picture it indicates the encode and display order number and whether it is a long term reference.
     * 
     * The size of this array always matches **D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC.ReferenceFrames.NumTextures** for the associated **EncodeFrame** command.
     */
    pReferenceFramesReconPictureDescriptors : D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_H264.Ptr

    /**
     * A **UCHAR** defining a semantic mode for the frame reference handling.
     * 
     * | adaptive_ref_pic_marking_mode_flag value  | Reference picture marking mode specified |
     * |-------------------------------------------|------------------------------------------|
     * | 0     | 1 |
     * | Sliding window reference picture marking mode: A marking mode providing a first-in first-out mechanism for short-term reference pictures. | Adaptive reference picture marking mode: A reference picture marking mode providing syntax elements to specify marking of reference pictures as "unused for reference" and to assign long-term frame indices. |
     */
    adaptive_ref_pic_marking_mode_flag : Int8

    /**
     * A **UINT** specifying the number of reference pictures marking operations associated with the current frame. Requires that *adaptive_ref_pic_marking_mode_flag* is set to 1.
     */
    RefPicMarkingOperationsCommandsCount : UInt32

    /**
     * A pointer to an array of [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_MARKING_OPERATION](ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264_reference_picture_marking_operation.md) structures representing the list of reference pictures marking operations associated with the current frame. The operations described by this list need to be reflected in the DPB descriptors accordingly during the encoding session.
     */
    pRefPicMarkingOperationsCommands : D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_MARKING_OPERATION.Ptr

    /**
     * A **UINT** specifying the number of items in *pList0RefPicModifications*.
     */
    List0RefPicModificationsCount : UInt32

    /**
     * A pointer to an array of  [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION](ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264_reference_picture_list_modification_operation.md) structures representing the list of reference picture list modification operations for the *pList0ReferenceFrames* list.
     */
    pList0RefPicModifications : D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION.Ptr

    /**
     * A **UINT** specifying the number of items in *pList1RefPicModifications*.
     */
    List1RefPicModificationsCount : UInt32

    /**
     * A pointer to an array of  [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION](ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264_reference_picture_list_modification_operation.md) structures representing the list of reference picture list modification operations for the *pList1ReferenceFrames* list.
     */
    pList1RefPicModifications : D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION.Ptr

    /**
     * A **UINT** specifying the number of elements present in *pRateControlQPMap*. This should match the number of coding blocks in the frame, rounding up the frame resolution to the closest aligned values.
     */
    QPMapValuesCount : UInt32

    /**
     * A pointer to an array of **Int8** containing, in row/column scan order, the QP map values to use on each squared region for this frame. The QP map dimensions can be calculated using the current resolution and [D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS.QPMapRegionPixelsSize](ns-d3d12video-d3d12_feature_data_video_encoder_resolution_support_limits.md) conveying the squared region sizes.
     */
    pRateControlQPMap : IntPtr

}
