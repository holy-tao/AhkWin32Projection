#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_TEX2D_ARRAY_RTV1.ahk" { D3D11_TEX2D_ARRAY_RTV1 }
#Import ".\D3D11_RTV_DIMENSION.ahk" { D3D11_RTV_DIMENSION }
#Import ".\D3D11_BUFFER_RTV.ahk" { D3D11_BUFFER_RTV }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D11_TEX1D_RTV.ahk" { D3D11_TEX1D_RTV }
#Import ".\D3D11_TEX3D_RTV.ahk" { D3D11_TEX3D_RTV }
#Import ".\D3D11_TEX2D_RTV1.ahk" { D3D11_TEX2D_RTV1 }
#Import ".\D3D11_TEX1D_ARRAY_RTV.ahk" { D3D11_TEX1D_ARRAY_RTV }
#Import ".\D3D11_TEX2DMS_RTV.ahk" { D3D11_TEX2DMS_RTV }
#Import ".\D3D11_TEX2DMS_ARRAY_RTV.ahk" { D3D11_TEX2DMS_ARRAY_RTV }

/**
 * Describes the subresources from a resource that are accessible using a render-target view. (D3D11_RENDER_TARGET_VIEW_DESC1)
 * @remarks
 * A render-target-view description is passed into <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createrendertargetview1">ID3D11Device3::CreateRenderTargetView1</a> to create a render target.
 * 
 * A render-target-view can't use the following formats:
 * 
 * <ul>
 * <li>Any typeless format.</li>
 * <li>DXGI_FORMAT_R32G32B32 if the view will be used to bind a buffer (vertex, index, constant, or stream-output).</li>
 * </ul>
 * If the format is set to DXGI_FORMAT_UNKNOWN, then the format of the resource that the view binds to the pipeline will be used.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_render_target_view_desc1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_RENDER_TARGET_VIEW_DESC1 {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that specifies the data format.
     */
    Format : DXGI_FORMAT

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_rtv_dimension">D3D11_RTV_DIMENSION</a>-typed value that specifies the resource type and how the render-target resource will be accessed.
     */
    ViewDimension : D3D11_RTV_DIMENSION

    Buffer : D3D11_BUFFER_RTV

    static __New() {
        DefineProp(this.Prototype, 'Texture1D', { type: D3D11_TEX1D_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture1DArray', { type: D3D11_TEX1D_ARRAY_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2D', { type: D3D11_TEX2D_RTV1, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DArray', { type: D3D11_TEX2D_ARRAY_RTV1, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DMS', { type: D3D11_TEX2DMS_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DMSArray', { type: D3D11_TEX2DMS_ARRAY_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture3D', { type: D3D11_TEX3D_RTV, offset: 8 })
        this.DeleteProp("__New")
    }
}
