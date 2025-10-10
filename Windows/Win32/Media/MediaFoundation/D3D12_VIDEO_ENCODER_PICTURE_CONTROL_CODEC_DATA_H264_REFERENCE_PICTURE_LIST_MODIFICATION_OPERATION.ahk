#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264_REFERENCE_PICTURE_LIST_MODIFICATION_OPERATION extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    modification_of_pic_nums_idc {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    abs_diff_pic_num_minus1 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    long_term_pic_num {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
