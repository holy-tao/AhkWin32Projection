#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Represents a resource in which all UAV accesses must complete before any future UAV accesses can begin.
 * @remarks
 * This struct represents a resource in which all unordered access view (UAV) accesses (reads or writes) must complete before any future UAV accesses (read or write) can begin.
 *       
 * 
 * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_resource_barrier">D3D12_RESOURCE_BARRIER</a> structure.
 *       
 * 
 * You don't need to insert a UAV barrier between 2 draw or dispatch calls that only read a UAV.
 *         Additionally, you don't need to insert a UAV barrier between 2 draw or dispatch calls that write to the same UAV if you know that it's safe to execute the UAV accesses in any order.
 *         The resource can be <b>NULL</b>, which indicates that any UAV access could require the barrier.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_uav_barrier
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RESOURCE_UAV_BARRIER {
    #StructPack 8

    /**
     * The resource used in the transition, as a pointer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a>.
     */
    pResource : ID3D12Resource

}
