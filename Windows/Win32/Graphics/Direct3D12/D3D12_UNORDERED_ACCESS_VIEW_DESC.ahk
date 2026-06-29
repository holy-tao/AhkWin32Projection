#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_TEX2DMS_UAV.ahk" { D3D12_TEX2DMS_UAV }
#Import ".\D3D12_TEX3D_UAV.ahk" { D3D12_TEX3D_UAV }
#Import ".\D3D12_TEX2D_UAV.ahk" { D3D12_TEX2D_UAV }
#Import ".\D3D12_TEX2DMS_ARRAY_UAV.ahk" { D3D12_TEX2DMS_ARRAY_UAV }
#Import ".\D3D12_BUFFER_UAV_FLAGS.ahk" { D3D12_BUFFER_UAV_FLAGS }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_TEX2D_ARRAY_UAV.ahk" { D3D12_TEX2D_ARRAY_UAV }
#Import ".\D3D12_TEX1D_ARRAY_UAV.ahk" { D3D12_TEX1D_ARRAY_UAV }
#Import ".\D3D12_TEX1D_UAV.ahk" { D3D12_TEX1D_UAV }
#Import ".\D3D12_BUFFER_UAV_BYTE_OFFSET.ahk" { D3D12_BUFFER_UAV_BYTE_OFFSET }
#Import ".\D3D12_BUFFER_UAV.ahk" { D3D12_BUFFER_UAV }
#Import ".\D3D12_UAV_DIMENSION.ahk" { D3D12_UAV_DIMENSION }

/**
 * Describes the subresources from a resource that are accessible by using an unordered-access view.
 * @remarks
 * Pass an unordered-access-view description into <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createunorderedaccessview">ID3D12Device::CreateUnorderedAccessView</a> to create a view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_unordered_access_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_UNORDERED_ACCESS_VIEW_DESC {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that specifies the viewing format.
     */
    Format : DXGI_FORMAT

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_uav_dimension">D3D12_UAV_DIMENSION</a>-typed value that specifies the resource type of the view. This type specifies how the resource will be accessed. This member also determines which _UAV to use in the union below.
     */
    ViewDimension : D3D12_UAV_DIMENSION

    Buffer : D3D12_BUFFER_UAV

    static __New() {
        DefineProp(this.Prototype, 'Texture1D', { type: D3D12_TEX1D_UAV, offset: 8 })
        DefineProp(this.Prototype, 'Texture1DArray', { type: D3D12_TEX1D_ARRAY_UAV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2D', { type: D3D12_TEX2D_UAV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DArray', { type: D3D12_TEX2D_ARRAY_UAV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DMS', { type: D3D12_TEX2DMS_UAV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DMSArray', { type: D3D12_TEX2DMS_ARRAY_UAV, offset: 8 })
        DefineProp(this.Prototype, 'Texture3D', { type: D3D12_TEX3D_UAV, offset: 8 })
        DefineProp(this.Prototype, 'BufferByteOffset', { type: D3D12_BUFFER_UAV_BYTE_OFFSET, offset: 8 })
        this.DeleteProp("__New")
    }
}
