#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the picture level control elements for the associated EncodeFrame command for HEVC encoding.
 * @remarks
 * The following tables list the expected VPS, SPS and PPS Values for HEVC encoding.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_hevc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * A bitwise OR combination of values from the [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC_FLAGS](ne-d3d12video-d3d12_video_encoder_picture_control_codec_data_hevc_flags.md) enumeration specifying configuration flags for the frame being encoded.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A value from the [D3D12_VIDEO_ENCODER_FRAME_TYPE_HEVC](ne-d3d12video-d3d12_video_encoder_frame_type_hevc.md) enumeration specifying the picture type. Make sure that the codec-specific flags support the specified type. This selection must be kept in sync with the GOP structure configuration set by the host. Note that the GOP is defined in display order and this pic type selection must follow the GOP, but in encode order.
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
    slice_pic_parameter_set_id {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A **UINT** specifying the current frame display order.
     * @type {Integer}
     */
    PictureOrderCountNumber {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A **UINT** specifying the picture layer number in temporal hierarchy. Check for the maximum number of layers in [D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC](ns-d3d12video-d3d12_video_encoder_codec_configuration_support_hevc.md).
     * @type {Integer}
     */
    TemporalLayerIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A **UINT** specifying the number of past frame references to be used for this frame. This value should be coherent with what was exposed in **D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC**.
     * @type {Integer}
     */
    List0ReferenceFramesCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * A pointer to a **UINT** array specifying the list of past frame reference frames to be used for this frame. Each integer value in this array indices into *pReferenceFramesReconPictureDescriptors* to reference pictures kept in the DPB.
     * @type {Pointer<Integer>}
     */
    pList0ReferenceFrames {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A **UINT** specifying the number of future frame references to be used for this frame. This value should be coherent with what was exposed in **D3D12_VIDEO_ENCODER_CODEC_CONFIGURATION_SUPPORT_HEVC**.
     * @type {Integer}
     */
    List1ReferenceFramesCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A pointer to a **UINT** array specifying the list of future frame reference frames to be used for this frame. Each integer value in this array indices into *pReferenceFramesReconPictureDescriptors* to reference pictures kept in the DPB.
     * @type {Pointer<Integer>}
     */
    pList1ReferenceFrames {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A **UINT** specifying the number of entries in *pReferenceFramesReconPictureDescriptors*.
     * @type {Integer}
     */
    ReferenceFramesReconPictureDescriptorsCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A pointer to a **UINT** array that describes the current state of the DPB buffer kept in [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC.ReferenceFrames](ns-d3d12video-d3d12_video_encoder_picture_control_desc.md). The *pList0ReferenceFrames* and *pList1ReferenceFrames* lists indices map from past/future references into this descriptors array.
     * 
     * This array of descriptors, in turn, maps a reference picture for this frame into a resource index in the reconstructed pictures array **D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC.ReferenceFrames**. Additionally, for each reference picture it indicates the encode and display order number and whether it is a long term reference.
     * 
     * The size of this array always matches **D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC.ReferenceFrames.NumTextures** for the associated **EncodeFrame** command.
     * @type {Pointer<D3D12_VIDEO_ENCODER_REFERENCE_PICTURE_DESCRIPTOR_HEVC>}
     */
    pReferenceFramesReconPictureDescriptors {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A **UINT** specifying the number of items in *pList0RefPicModifications*.
     * @type {Integer}
     */
    List0RefPicModificationsCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * A pointer to a **UINT** array containing modification commands for the L0 list.
     * @type {Pointer<Integer>}
     */
    pList0RefPicModifications {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * A **UINT** specifying the number of items in *pList1RefPicModifications*.
     * @type {Integer}
     */
    List1RefPicModificationsCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * A pointer to a **UINT** array containing modification commands for the L1 list.
     * @type {Pointer<Integer>}
     */
    pList1RefPicModifications {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * A **UINT** specifying the number of elements present in *pRateControlQPMap*. This should match the number of coding blocks in the frame, rounding up the frame resolution to the closest aligned values.
     * @type {Integer}
     */
    QPMapValuesCount {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * A pointer to an array of **Int8** containing, in row/column scan order, the QP map values to use on each squared region for this frame. The QP map dimensions can be calculated using the current resolution and [D3D12_FEATURE_DATA_VIDEO_ENCODER_RESOLUTION_SUPPORT_LIMITS.QPMapRegionPixelsSize](ns-d3d12video-d3d12_feature_data_video_encoder_resolution_support_limits.md) conveying the squared region sizes.
     * @type {Pointer<Integer>}
     */
    pRateControlQPMap {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}
