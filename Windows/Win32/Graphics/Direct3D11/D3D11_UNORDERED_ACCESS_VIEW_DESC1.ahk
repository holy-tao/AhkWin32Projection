#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_TEX2D_UAV1.ahk" { D3D11_TEX2D_UAV1 }
#Import ".\D3D11_UAV_DIMENSION.ahk" { D3D11_UAV_DIMENSION }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D11_TEX3D_UAV.ahk" { D3D11_TEX3D_UAV }
#Import ".\D3D11_TEX2D_ARRAY_UAV1.ahk" { D3D11_TEX2D_ARRAY_UAV1 }
#Import ".\D3D11_TEX1D_ARRAY_UAV.ahk" { D3D11_TEX1D_ARRAY_UAV }
#Import ".\D3D11_TEX1D_UAV.ahk" { D3D11_TEX1D_UAV }
#Import ".\D3D11_BUFFER_UAV.ahk" { D3D11_BUFFER_UAV }

/**
 * Describes the subresources from a resource that are accessible using an unordered-access view. (D3D11_UNORDERED_ACCESS_VIEW_DESC1)
 * @remarks
 * An unordered-access-view description is passed into <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createunorderedaccessview1">ID3D11Device3::CreateUnorderedAccessView1</a> to create a view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_unordered_access_view_desc1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_UNORDERED_ACCESS_VIEW_DESC1 {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that specifies the data format.
     */
    Format : DXGI_FORMAT

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_uav_dimension">D3D11_UAV_DIMENSION</a>-typed value that  specifies the resource type of the view. This type is the same as the resource type of the underlying resource. This member also determines which _UAV to use in the union below.
     */
    ViewDimension : D3D11_UAV_DIMENSION

    Buffer : D3D11_BUFFER_UAV

    static __New() {
        DefineProp(this.Prototype, 'Texture1D', { type: D3D11_TEX1D_UAV, offset: 8 })
        DefineProp(this.Prototype, 'Texture1DArray', { type: D3D11_TEX1D_ARRAY_UAV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2D', { type: D3D11_TEX2D_UAV1, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DArray', { type: D3D11_TEX2D_ARRAY_UAV1, offset: 8 })
        DefineProp(this.Prototype, 'Texture3D', { type: D3D11_TEX3D_UAV, offset: 8 })
        this.DeleteProp("__New")
    }
}
