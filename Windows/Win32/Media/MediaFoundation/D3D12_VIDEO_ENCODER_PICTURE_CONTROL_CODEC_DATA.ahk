#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the picture level control elements for the associated EncodeFrame command for multiple codecs.
 * @remarks
 * Slice-level picture reference lists reordering is unsupported.
 * 
 * Weighted inter-prediction is unsupported.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_encoder_picture_control_codec_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The data size of the provided picture level control structure.
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_H264>}
     */
    pH264PicData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC>}
     */
    pHEVCPicData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA_HEVC1>}
     */
    pHEVCPicData1 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_AV1_PICTURE_CONTROL_CODEC_DATA>}
     */
    pAV1PicData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
