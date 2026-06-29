#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_SUBRESOURCE_FOOTPRINT.ahk" { D3D12_SUBRESOURCE_FOOTPRINT }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }

/**
 * Describes the footprint of a placed subresource, including the offset and the D3D12_SUBRESOURCE_FOOTPRINT.
 * @remarks
 * This structure is used in the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_texture_copy_location">D3D12_TEXTURE_COPY_LOCATION</a> structure,
 *           and by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-getcopyablefootprints">ID3D12Device::GetCopyableFootprints</a>.
 *         
 * 
 * All the data referenced by the footprint structure must fit within the bounds of the parent resource. If you use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-getcopyablefootprints">GetCopyableFootprints</a> to fill out the structure, the <i>pTotalBytes</i> output field indicates the required size of the resource.
 * 
 * This structure is also used a number of helper functions (refer to <a href="https://docs.microsoft.com/windows/desktop/direct3d12/helper-structures-and-functions-for-d3d12">Helper Structures and Functions for D3D12</a>).
 * 
 * When copying textures, use this structure along with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_texture_copy_location">D3D12_TEXTURE_COPY_LOCATION</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_placed_subresource_footprint
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_PLACED_SUBRESOURCE_FOOTPRINT {
    #StructPack 8

    /**
     * The offset of the subresource within the parent resource, in bytes.
     *             The offset between the start of the parent resource and this subresource.
     */
    Offset : Int64

    /**
     * The format, width, height, depth, and row-pitch of the subresource,
     *             as a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_subresource_footprint">D3D12_SUBRESOURCE_FOOTPRINT</a> structure.
     */
    Footprint : D3D12_SUBRESOURCE_FOOTPRINT

}
