#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE.ahk" { D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE }

/**
 * Describes a set of Axis-aligned bounding boxes that are used in the D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS structure to provide input data to a raytracing acceleration structure build operation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_geometry_aabbs_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_GEOMETRY_AABBS_DESC {
    #StructPack 8

    /**
     * The number of AABBs pointed to in the contiguous array at <i>AABBs</i>.
     */
    AABBCount : Int64

    /**
     * the GPU memory location where an array of AABB descriptions is to be found, including the data stride between AABBs.  The address and stride must each be aligned to 8 bytes, defined as The address must be aligned to 16 bytes, defined as <a href="https://docs.microsoft.com/windows/desktop/direct3d12/constants"> D3D12_RAYTRACING_AABB_BYTE_ALIGNMENT</a>.  The stride can be 0.
     */
    AABBs : D3D12_GPU_VIRTUAL_ADDRESS_AND_STRIDE

}
