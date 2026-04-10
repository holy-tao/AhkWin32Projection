#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_RAYTRACING_OPACITY_MICROMAP_FORMAT.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_RAYTRACING_OPACITY_MICROMAP_HISTOGRAM_ENTRY extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SubdivisionLevel {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {D3D12_RAYTRACING_OPACITY_MICROMAP_FORMAT}
     */
    Format {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
