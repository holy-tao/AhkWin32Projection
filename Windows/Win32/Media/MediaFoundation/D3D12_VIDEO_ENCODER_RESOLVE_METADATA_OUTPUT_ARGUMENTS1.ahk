#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RESOLVE_METADATA_OUTPUT_ARGUMENTS1 extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER}
     */
    ResolvedLayoutMetadata{
        get {
            if(!this.HasProp("__ResolvedLayoutMetadata"))
                this.__ResolvedLayoutMetadata := D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER(0, this)
            return this.__ResolvedLayoutMetadata
        }
    }

    /**
     * @type {ID3D12Resource}
     */
    pOutputQPMap {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {ID3D12Resource}
     */
    pOutputSATDMap {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {ID3D12Resource}
     */
    pOutputBitAllocationMap {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER}
     */
    ResolvedFramePSNRData{
        get {
            if(!this.HasProp("__ResolvedFramePSNRData"))
                this.__ResolvedFramePSNRData := D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER(40, this)
            return this.__ResolvedFramePSNRData
        }
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER}
     */
    ResolvedSubregionsPSNRData{
        get {
            if(!this.HasProp("__ResolvedSubregionsPSNRData"))
                this.__ResolvedSubregionsPSNRData := D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER(56, this)
            return this.__ResolvedSubregionsPSNRData
        }
    }
}
