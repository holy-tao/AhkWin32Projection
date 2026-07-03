#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_DEPTH_STENCIL_VALUE.ahk" { D3D12_DEPTH_STENCIL_VALUE }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }

/**
 * Describes a value used to optimize clear operations for a particular resource.
 * @remarks
 * This structure is optionally passed into the following methods:
 *         
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcommittedresource">ID3D12Device::CreateCommittedResource</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createplacedresource">ID3D12Device::CreatePlacedResource</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createreservedresource">ID3D12Device::CreateReservedResource</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_clear_value
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_CLEAR_VALUE {
    #StructPack 4

    /**
     * Specifies one member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> enum.
     * 
     * The format of the commonly cleared color follows the same validation rules as a view/ descriptor creation. In general, the format of the clear color can be any format in the same typeless group that the resource format belongs to.
     * 
     * This <i>Format</i> must match the format of the view used during the clear operation. It indicates whether the <i>Color</i> or the <i>DepthStencil</i> member is valid and how to convert the values for usage with the resource.
     */
    Format : DXGI_FORMAT

    Color : Float32[4]

    static __New() {
        DefineProp(this.Prototype, 'DepthStencil', { type: D3D12_DEPTH_STENCIL_VALUE, offset: 4 })
        this.DeleteProp("__New")
    }
}
