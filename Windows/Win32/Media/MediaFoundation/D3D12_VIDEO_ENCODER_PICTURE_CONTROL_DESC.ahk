#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA.ahk
#Include .\D3D12_VIDEO_ENCODE_REFERENCE_FRAMES.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_PICTURE_CONTROL_DESC extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    IntraRefreshFrameIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA}
     */
    PictureControlCodecData{
        get {
            if(!this.HasProp("__PictureControlCodecData"))
                this.__PictureControlCodecData := D3D12_VIDEO_ENCODER_PICTURE_CONTROL_CODEC_DATA(8, this)
            return this.__PictureControlCodecData
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODE_REFERENCE_FRAMES}
     */
    ReferenceFrames{
        get {
            if(!this.HasProp("__ReferenceFrames"))
                this.__ReferenceFrames := D3D12_VIDEO_ENCODE_REFERENCE_FRAMES(24, this)
            return this.__ReferenceFrames
        }
    }
}
