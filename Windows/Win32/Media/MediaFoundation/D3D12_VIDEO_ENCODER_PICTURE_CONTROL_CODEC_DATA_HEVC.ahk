#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC.ahk" { D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC }
#Import ".\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAGS.ahk" { D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAGS }
#Import ".\D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_HEVC.ahk" { D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_HEVC }

/**
 * Represents the picture level control elements for the associated EncodeFrame command for HEVC encoding.
 * @remarks
 * The following tables list the expected VPS, SPS and PPS Values for HEVC encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC {
    #StructPack 8

    /**
     * A bitwise OR combination of values from the [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAGS](ne-d3d12video-d3d12_video_encoder_picture_control_codec_data_hevc_flags.md) enumeration specifying configuration flags for the frame being encoded.
     */
    Flags : D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAGS

    /**
     * A value from the [D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC](ne-d3d12video-d3d12_video_encoder_frame_type_hevc.md) enumeration specifying the picture type. Make sure that the codec-specific flags support the specified type. This selection must be kept in sync with the GOP structure configuration set by the host. Note that the GOP is defined in display order and this pic type selection must follow the GOP, but in encode order.
     */
    FrameType : D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC

    /**
     * A **UINT** specifying the value to be used in the slice headers of the current frame to reference the PPS.
     */
    slice_pic_parameter_set_id : UInt32

    /**
     * A **UINT** specifying the current frame display order.
     */
    PictureOrderCountNumber : UInt32

    /**
     * A **UINT** specifying the picture layer number in temporal hierarchy. Check for the maximum number of layers in [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC](ns-d3d12video-d3d12_video_encoder_codec_configuration_support_hevc.md).
     */
    TemporalLayerIndex : UInt32

    /**
     * A **UINT** specifying the number of past frame references to be used for this frame. This value should be coherent with what was exposed in **D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC**.
     */
    List0ReferenceFramesCount : UInt32

    /**
     * A pointer to a **UINT** array specifying the list of past frame reference frames to be used for this frame. Each integer value in this array indices into *pReferenceFramesReconPictureDescriptors* to reference pictures kept in the DPB.
     */
    pList0ReferenceFrames : IntPtr

    /**
     * A **UINT** specifying the number of future frame references to be used for this frame. This value should be coherent with what was exposed in **D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC**.
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
    pReferenceFramesReconPictureDescriptors : D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_HEVC.Ptr

    /**
     * A **UINT** specifying the number of items in *pList0RefPicModifications*.
     */
    List0RefPicModificationsCount : UInt32

    /**
     * A pointer to a **UINT** array containing modification commands for the L0 list.
     */
    pList0RefPicModifications : IntPtr

    /**
     * A **UINT** specifying the number of items in *pList1RefPicModifications*.
     */
    List1RefPicModificationsCount : UInt32

    /**
     * A pointer to a **UINT** array containing modification commands for the L1 list.
     */
    pList1RefPicModifications : IntPtr

    /**
     * A **UINT** specifying the number of elements present in *pRateControlQPMap*. This should match the number of coding blocks in the frame, rounding up the frame resolution to the closest aligned values.
     */
    QPMapValuesCount : UInt32

    /**
     * A pointer to an array of **Int8** containing, in row/column scan order, the QP map values to use on each squared region for this frame. The QP map dimensions can be calculated using the current resolution and [D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS.QPMapRegionPixelsSize](ns-d3d12video-d3d12_feature_data_video_encoder_resolution_support_limits.md) conveying the squared region sizes.
     */
    pRateControlQPMap : IntPtr

}
