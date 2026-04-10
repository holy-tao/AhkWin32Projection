#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Resource.ahk
#Include .\D3D12_VIDEO_ENCODER_MOVEREGION_INFO.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_FRAME_MOTION_VECTORS extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE}
     */
    MapSource {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {ID3D12Resource}
     */
    pOpaqueLayoutBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<D3D12_VIDEO_ENCODER_MOVEREGION_INFO>}
     */
    pCPUBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
