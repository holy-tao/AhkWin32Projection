#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM_NOTIFICATION_MODE.ahk
#Include .\D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Resource.ahk
#Include .\D3D12_VIDEO_ENCODER_SUBREGION_COMPRESSED_BITSTREAM.ahk
#Include .\D3D12_VIDEO_ENCODER_SUBREGION_COMPRESSED_BITSTREAM_BUFFER_MODE.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Fence.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM1 extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM_NOTIFICATION_MODE}
     */
    NotificationMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM}
     */
    FrameOutputBuffer {
        get {
            if(!this.HasProp("__FrameOutputBuffer"))
                this.__FrameOutputBuffer := D3D12_VIDEO_ENCODER_COMPRESSED_BITSTREAM(8, this)
            return this.__FrameOutputBuffer
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_SUBREGION_COMPRESSED_BITSTREAM}
     */
    SubregionOutputBuffers {
        get {
            if(!this.HasProp("__SubregionOutputBuffers"))
                this.__SubregionOutputBuffers := D3D12_VIDEO_ENCODER_SUBREGION_COMPRESSED_BITSTREAM(8, this)
            return this.__SubregionOutputBuffers
        }
    }
}
