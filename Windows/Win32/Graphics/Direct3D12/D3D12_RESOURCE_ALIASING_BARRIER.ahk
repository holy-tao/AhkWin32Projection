#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * Describes the transition between usages of two different resources that have mappings into the same heap.
 * @remarks
 * This structure is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_resource_barrier">D3D12_RESOURCE_BARRIER</a> structure.
 *       
 * 
 * Both the before and the after resources can be specified or one or both resources can be <b>NULL</b>, which indicates that any placed or reserved resource could cause aliasing.
 *       
 * 
 * Refer to the usage models described in <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createplacedresource">CreatePlacedResource</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_aliasing_barrier
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RESOURCE_ALIASING_BARRIER {
    #StructPack 8

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> object that represents the before resource used in the transition.
     */
    pResourceBefore : ID3D12Resource

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nn-d3d12-id3d12resource">ID3D12Resource</a> object that represents the after resource used in the transition.
     */
    pResourceAfter : ID3D12Resource

}
