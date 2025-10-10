#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A shader resource view (SRV) structure for storing a raytracing acceleration structure.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_srv
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_ACCELERATION_STRUCTURE_SRV extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The GPU virtual address of the SRV.
     * @type {Integer}
     */
    Location {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
