#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_ENCODE_OPERATION_METADATA_BUFFER.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class D3D12_VIDEO_ENCODER_RESOLVE_METADATA_OUTPUT_ARGUMENTS extends Win32Struct
{
    static sizeof => 16

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
}
