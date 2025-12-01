#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE.ahk
#Include .\D3D12_RAYTRACING_GEOMETRY_TRIANGLES_DESC.ahk
#Include .\D3D12_RAYTRACING_GEOMETRY_AABBS_DESC.ahk
#Include .\D3D12_RAYTRACING_GEOMETRY_OMM_TRIANGLES_DESC.ahk

/**
 * Describes a set of geometry that is used in the D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS structure to provide input data to a raytracing acceleration structure build operation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_geometry_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_RAYTRACING_GEOMETRY_DESC extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The type of geometry.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The geometry flags
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D12_RAYTRACING_GEOMETRY_TRIANGLES_DESC}
     */
    Triangles{
        get {
            if(!this.HasProp("__Triangles"))
                this.__Triangles := D3D12_RAYTRACING_GEOMETRY_TRIANGLES_DESC(8, this)
            return this.__Triangles
        }
    }

    /**
     * @type {D3D12_RAYTRACING_GEOMETRY_AABBS_DESC}
     */
    AABBs{
        get {
            if(!this.HasProp("__AABBs"))
                this.__AABBs := D3D12_RAYTRACING_GEOMETRY_AABBS_DESC(8, this)
            return this.__AABBs
        }
    }

    /**
     * @type {D3D12_RAYTRACING_GEOMETRY_OMM_TRIANGLES_DESC}
     */
    OmmTriangles{
        get {
            if(!this.HasProp("__OmmTriangles"))
                this.__OmmTriangles := D3D12_RAYTRACING_GEOMETRY_OMM_TRIANGLES_DESC(8, this)
            return this.__OmmTriangles
        }
    }
}
