#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class D3D12_VIDEO_ENCODER_QPMAP_CONFIGURATION extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    Enabled {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {D3D12_VIDEO_ENCODER_INPUT_MAP_SOURCE}
     */
    MapSource {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
