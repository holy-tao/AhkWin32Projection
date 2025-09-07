#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a picture list modification operation for H264 video encoding.
 * @remarks
 * For more information, refer to H264 specification for more details: section 7.4.3.1 "Reference picture list modification semantics".
  * .
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_picture_control_codec_data_h264_reference_picture_list_modification_operation
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Together with abs_diff_pic_num_minus1 or long_term_pic_num specifies which of the reference pictures are re-mapped.
     * @type {Integer}
     */
    modification_of_pic_nums_idc {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Specifies the absolute difference between the picture number of the picture being moved to the current index in the list and the picture number prediction value.
     * @type {Integer}
     */
    abs_diff_pic_num_minus1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the long-term picture number of the picture being moved to the current index in the list.
     * @type {Integer}
     */
    long_term_pic_num {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
