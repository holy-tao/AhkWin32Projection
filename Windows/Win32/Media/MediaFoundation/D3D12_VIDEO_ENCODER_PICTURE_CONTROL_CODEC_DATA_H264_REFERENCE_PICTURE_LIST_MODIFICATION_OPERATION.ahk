#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a picture list modification operation for H264 video encoding.
 * @remarks
 * For more information, refer to H264 specification for more details: section 7.4.3.1 "Reference picture list modification semantics".
 * .
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264_reference_picture_list_modification_operation
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION {
    #StructPack 4

    /**
     * Together with abs_diff_pic_num_minus1 or long_term_pic_num specifies which of the reference pictures are re-mapped.
     */
    modification_of_pic_nums_idc : Int8

    /**
     * Specifies the absolute difference between the picture number of the picture being moved to the current index in the list and the picture number prediction value.
     */
    abs_diff_pic_num_minus1 : UInt32

    /**
     * Specifies the long-term picture number of the picture being moved to the current index in the list.
     */
    long_term_pic_num : UInt32

}
