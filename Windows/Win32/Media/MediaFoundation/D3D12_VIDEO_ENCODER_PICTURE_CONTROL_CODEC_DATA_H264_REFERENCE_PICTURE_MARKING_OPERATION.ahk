#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes changes in the reference pictures as memory operations as a tuple of an operation identificator and associated parameters needed for the operation.
 * @remarks
 * For more information, refer to H264 specification for more details: section 8.2.5.4 "Adaptive memory control decoded reference picture marking process".
  * 
  * The variable *MaxLongTermFrameIdx* is derived as follows:
  * 
  * – If **max_long_term_frame_idx_plus1** is equal to 0, MaxLongTermFrameIdx is set equal to "no long-term frame indices".
  *  – Otherwise (**max_long_term_frame_idx_plus1** is greater than 0), *MaxLongTermFrameIdx* is set equal to max_long_term_frame_idx_plus1 − 1.
  * 
  * The operation of marking the current frame as a short-term reference is given by a flag present in the [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_FLAGS](ne-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264_flags.md) structure with its corresponding **PictureOrderCountNumber** and **FrameDecodingOrderNumber** values indicated in the associated picture control structure.
  * 
  * The variable *max_num_ref_frames* is indicated in this API by the maximum DPB capacity reported.
  * 
  * Note that for marking an IDR frame as long-term reference, the proposed explicit mechanism is to mark it as short term reference first, by setting [D3D12_VIDEO_ENCODER_PICTURE_CONTROL_FLAG_USED_AS_REFERENCE_PICTURE](ne-d3d12video-d3d12_video_encoder_picture_control_flags.md) when calling [EncodeFrame](nf-d3d12video-id3d12videoencodecommandlist2-encodeframe.md) for the IDR frame, and later promoting it to be a long-term reference frame using memory management operation '3' to mark a short-term reference picture as "used for long-term reference" and assign a long-term frame index to it.
  * 
  * Alternatively, if encoding an IDR frame and setting **adaptive_ref_pic_marking_mode_flag** = 1, the driver will assume that the client is attempting to set the H264 slice header **long_term_reference_flag** and will do so in the output bitstream for the **EncodeFrame** call.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264_reference_picture_marking_operation
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_MARKING_OPERATION extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The control operation to be applied to affect the reference picture marking state.
     * @type {Integer}
     */
    memory_management_control_operation {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Used with **memory_management_control_operation** equal to 3 or 1 to assign a long-term frame index to a short-term reference picture or to mark a short-term reference picture as "unused for reference".
     * @type {Integer}
     */
    difference_of_pic_nums_minus1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Used with **memory_management_control_operation** equal to 2 to mark a long-term reference picture as "unused for reference".
     * @type {Integer}
     */
    long_term_pic_num {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Used with **memory_management_control_operation** equal to 3 or 6 to assign a long-term frame index to a picture.
     * @type {Integer}
     */
    long_term_frame_idx {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The value minus 1 specifies the maximum value of long-term frame index allowed for long-term reference pictures (until receipt of another value of **max_long_term_frame_idx_plus1**).
     * @type {Integer}
     */
    max_long_term_frame_idx_plus1 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
