#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM.ahk
#Include .\D3D12_VIDEO_ENCODER_SUBREGION_COMPRESSED_BITSTREAM.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM1 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NotificationMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM}
     */
    FrameOutputBuffer{
        get {
            if(!this.HasProp("__FrameOutputBuffer"))
                this.__FrameOutputBuffer := D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM(this.ptr + 8)
            return this.__FrameOutputBuffer
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_SUBREGION_COMPRESSED_BITSTREAM}
     */
    SubregionOutputBuffers{
        get {
            if(!this.HasProp("__SubregionOutputBuffers"))
                this.__SubregionOutputBuffers := D3D12_VIDEO_ENCODER_SUBREGION_COMPRESSED_BITSTREAM(this.ptr + 8)
            return this.__SubregionOutputBuffers
        }
    }
}
