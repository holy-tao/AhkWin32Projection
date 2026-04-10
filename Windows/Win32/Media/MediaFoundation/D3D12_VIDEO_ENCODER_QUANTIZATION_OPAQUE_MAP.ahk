#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Resource.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_QUANTIZATION_OPAQUE_MAP extends Win32Struct {
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {ID3D12Resource}
     */
    pOpaqueQuantizationMap {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
