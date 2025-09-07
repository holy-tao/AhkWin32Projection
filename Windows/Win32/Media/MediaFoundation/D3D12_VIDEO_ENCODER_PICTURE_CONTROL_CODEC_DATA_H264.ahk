#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the picture level control elements for the associated EncodeFrame command for H.264 encoding.
 * @remarks
 * Note that if the current frame is marked as a reference picture, the output must contain the reconstructed picture along with the bitstream for the host to place it in future commands in the reconstructed pictures reference list. Note that there might be limitations for some frame types to be marked as references, check feature support before setting those values.
  * 
  * 
  * The following tables list the expected SPS and PPS Values for H264 encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264 extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * A bitwise OR combination of values from the [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_FLAGS](ne-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264_flags.md) enumeration specifying configuration flags for the frame being encoded.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A value from the [D3D12_VIDEO_ENCODER_FRAME_TYPE_H264](ne-d3d12video-d3d12_video_encoder_frame_type_h264.md) enumeration specifying the picture type. Make sure that the codec-specific flags support the specified type. This selection must be kept in sync with the GOP structure configuration set by the host. Note that the GOP is defined in display order and this pic type selection must follow the GOP, but in encode order.
     * @type {Integer}
     */
    FrameType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A **UINT** specifying the value to be used in the slice headers of the current frame to reference the PPS.
     * @type {Integer}
     */
    pic_parameter_set_id {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * When **FrameType**** is **D3D12_VIDEO_ENCODER_FRAME_TYPE_H264_IDR_FRAME**, a **UINT** indicating the identifier of the IDR frame to be used in all the slices headers present in the frame.
     * @type {Integer}
     */
    idr_pic_id {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A **UINT** specifying the current frame display order.
     * @type {Integer}
     */
    PictureOrderCountNumber {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A **UINT** specifying the frame decode order with semantic as indicated by the slice header frame_num syntax element that increments after each reference picture.
     * @type {Integer}
     */
    FrameDecodingOrderNumber {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A **UINT** specifying the picture layer number in temporal hierarchy. Check for the maximum number of layers in [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264](ns-d3d12video-d3d12_video_encoder_codec_configuration_support_h264.md).
     * @type {Integer}
     */
    TemporalLayerIndex {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * A **UINT** specifying the number of past frame references to be used for this frame. This value should be coherent with what was exposed in **D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264**.
     * @type {Integer}
     */
    List0ReferenceFramesCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * A pointer to a **UINT** array specifying the list of past frame reference frames to be used for this frame. Each integer value in this array indices into *pReferenceFramesReconPictureDescriptors* to reference pictures kept in the DPB.
     * @type {Pointer<UInt32>}
     */
    pList0ReferenceFrames {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A **UINT** specifying the number of future frame references to be used for this frame. This value should be coherent with what was exposed in **D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_H264**.
     * @type {Integer}
     */
    List1ReferenceFramesCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * A pointer to a **UINT** array specifying the list of future frame reference frames to be used for this frame. Each integer value in this array indices into *pReferenceFramesReconPictureDescriptors* to reference pictures kept in the DPB.
     * @type {Pointer<UInt32>}
     */
    pList1ReferenceFrames {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A **UINT** specifying the number of entries in *pReferenceFramesReconPictureDescriptors*.
     * @type {Integer}
     */
    ReferenceFramesReconPictureDescriptorsCount {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * A pointer to a **UINT** array that describes the current state of the DPB buffer kept in [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC.ReferenceFrames](ns-d3d12video-d3d12_video_encoder_picture_control_desc.md). The *pList0ReferenceFrames* and *pList1ReferenceFrames* lists indices map from past/future references into this descriptors array.
     * 
     * This array of descriptors, in turn, maps a reference picture for this frame into a resource index in the reconstructed pictures array **D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC.ReferenceFrames**. Additionally, for each reference picture it indicates the encode and display order number and whether it is a long term reference.
     * 
     * The size of this array always matches **D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC.ReferenceFrames.NumTextures** for the associated **EncodeFrame** command.
     * @type {Pointer<D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_H264>}
     */
    pReferenceFramesReconPictureDescriptors {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A **UCHAR** defining a semantic mode for the frame reference handling.
     * 
     * | adaptive_ref_pic_marking_mode_flag value  | Reference picture marking mode specified |
     * |-------------------------------------------|------------------------------------------|
     * | 0     | 1 |
     * | Sliding window reference picture marking mode: A marking mode providing a first-in first-out mechanism for short-term reference pictures. | Adaptive reference picture marking mode: A reference picture marking mode providing syntax elements to specify marking of reference pictures as "unused for reference" and to assign long-term frame indices. |
     * @type {Integer}
     */
    adaptive_ref_pic_marking_mode_flag {
        get => NumGet(this, 72, "char")
        set => NumPut("char", value, this, 72)
    }

    /**
     * A **UINT** specifying the number of reference pictures marking operations associated with the current frame. Requires that *adaptive_ref_pic_marking_mode_flag* is set to 1.
     * @type {Integer}
     */
    RefPicMarkingOperationsCommandsCount {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * A pointer to an array of [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_MARKING_OPERATION](ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264_reference_picture_marking_operation.md) structures representing the list of reference pictures marking operations associated with the current frame. The operations described by this list need to be reflected in the DPB descriptors accordingly during the encoding session.
     * @type {Pointer<D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_MARKING_OPERATION>}
     */
    pRefPicMarkingOperationsCommands {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * A **UINT** specifying the number of items in *pList0RefPicModifications*.
     * @type {Integer}
     */
    List0RefPicModificationsCount {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * A pointer to an array of  [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION](ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264_reference_picture_list_modification_operation.md) structures representing the list of reference picture list modification operations for the *pList0ReferenceFrames* list.
     * @type {Pointer<D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION>}
     */
    pList0RefPicModifications {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * A **UINT** specifying the number of items in *pList1RefPicModifications*.
     * @type {Integer}
     */
    List1RefPicModificationsCount {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * A pointer to an array of  [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION](ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264_reference_picture_list_modification_operation.md) structures representing the list of reference picture list modification operations for the *pList1ReferenceFrames* list.
     * @type {Pointer<D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION>}
     */
    pList1RefPicModifications {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * A **UINT** specifying the number of elements present in *pRateControlQPMap*. This should match the number of coding blocks in the frame, rounding up the frame resolution to the closest aligned values.
     * @type {Integer}
     */
    QPMapValuesCount {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * A pointer to an array of **Int8** containing, in row/column scan order, the QP map values to use on each squared region for this frame. The QP map dimensions can be calculated using the current resolution and [D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS.QPMapRegionPixelsSize](ns-d3d12video-d3d12_feature_data_video_encoder_resolution_support_limits.md) conveying the squared region sizes.
     * @type {Pointer<SByte>}
     */
    pRateControlQPMap {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
