#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D11_BUFFER_UAV.ahk" { D3D11_BUFFER_UAV }
#Import ".\D3D11_TEX1D_ARRAY_UAV.ahk" { D3D11_TEX1D_ARRAY_UAV }
#Import ".\D3D11_TEX1D_UAV.ahk" { D3D11_TEX1D_UAV }
#Import ".\D3D11_TEX2D_ARRAY_UAV.ahk" { D3D11_TEX2D_ARRAY_UAV }
#Import ".\D3D11_UAV_DIMENSION.ahk" { D3D11_UAV_DIMENSION }
#Import ".\D3D11_TEX2D_UAV.ahk" { D3D11_TEX2D_UAV }
#Import ".\D3D11_TEX3D_UAV.ahk" { D3D11_TEX3D_UAV }

/**
 * Specifies the subresources from a resource that are accessible using an unordered-access view.
 * @remarks
 * An unordered-access-view description is passed into <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createunorderedaccessview">ID3D11Device::CreateUnorderedAccessView</a> to create a view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_unordered_access_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_UNORDERED_ACCESS_VIEW_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The data format (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>).
     */
    Format : DXGI_FORMAT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_uav_dimension">D3D11_UAV_DIMENSION</a></b>
     * 
     * The resource type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_uav_dimension">D3D11_UAV_DIMENSION</a>), which specifies how the resource will be accessed.
     */
    ViewDimension : D3D11_UAV_DIMENSION

    Buffer : D3D11_BUFFER_UAV

    static __New() {
        DefineProp(this.Prototype, 'Texture1D', { type: D3D11_TEX1D_UAV, offset: 8 })
        DefineProp(this.Prototype, 'Texture1DArray', { type: D3D11_TEX1D_ARRAY_UAV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2D', { type: D3D11_TEX2D_UAV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DArray', { type: D3D11_TEX2D_ARRAY_UAV, offset: 8 })
        DefineProp(this.Prototype, 'Texture3D', { type: D3D11_TEX3D_UAV, offset: 8 })
        this.DeleteProp("__New")
    }
}
