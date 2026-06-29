#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A shader resource view (SRV) structure for storing a raytracing acceleration structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_srv
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RAYTRACING_ACCELERATION_STRUCTURE_SRV {
    #StructPack 8

    /**
     * The GPU virtual address of the SRV.
     */
    Location : Int64

}
