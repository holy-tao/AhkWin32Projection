#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_RAYTRACING_GEOMETRY_AABBS_DESC.ahk" { D3D12_RAYTRACING_GEOMETRY_AABBS_DESC }
#Import ".\D3D12_RAYTRACING_GEOMETRY_TRIANGLES_DESC.ahk" { D3D12_RAYTRACING_GEOMETRY_TRIANGLES_DESC }
#Import ".\D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE.ahk" { D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_RAYTRACING_GEOMETRY_OMM_LINKAGE_DESC.ahk" { D3D12_RAYTRACING_GEOMETRY_OMM_LINKAGE_DESC }
#Import ".\D3D12_RAYTRACING_GEOMETRY_FLAGS.ahk" { D3D12_RAYTRACING_GEOMETRY_FLAGS }
#Import ".\D3D12_RAYTRACING_GEOMETRY_OMM_TRIANGLES_DESC.ahk" { D3D12_RAYTRACING_GEOMETRY_OMM_TRIANGLES_DESC }
#Import ".\D3D12_RAYTRACING_GEOMETRY_TYPE.ahk" { D3D12_RAYTRACING_GEOMETRY_TYPE }

/**
 * Describes a set of geometry that is used in the D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS structure to provide input data to a raytracing acceleration structure build operation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_geometry_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_GEOMETRY_DESC {
    #StructPack 8

    /**
     * The type of geometry.
     */
    Type : D3D12_RAYTRACING_GEOMETRY_TYPE

    /**
     * The geometry flags
     */
    Flags : D3D12_RAYTRACING_GEOMETRY_FLAGS

    Triangles : D3D12_RAYTRACING_GEOMETRY_TRIANGLES_DESC

    static __New() {
        DefineProp(this.Prototype, 'AABBs', { type: D3D12_RAYTRACING_GEOMETRY_AABBS_DESC, offset: 8 })
        DefineProp(this.Prototype, 'OmmTriangles', { type: D3D12_RAYTRACING_GEOMETRY_OMM_TRIANGLES_DESC, offset: 8 })
        this.DeleteProp("__New")
    }
}
