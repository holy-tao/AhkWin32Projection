#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_RTV_DIMENSION.ahk" { D3D11_RTV_DIMENSION }
#Import ".\D3D11_BUFFER_RTV.ahk" { D3D11_BUFFER_RTV }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D11_TEX1D_RTV.ahk" { D3D11_TEX1D_RTV }
#Import ".\D3D11_TEX3D_RTV.ahk" { D3D11_TEX3D_RTV }
#Import ".\D3D11_TEX2D_ARRAY_RTV.ahk" { D3D11_TEX2D_ARRAY_RTV }
#Import ".\D3D11_TEX1D_ARRAY_RTV.ahk" { D3D11_TEX1D_ARRAY_RTV }
#Import ".\D3D11_TEX2DMS_RTV.ahk" { D3D11_TEX2DMS_RTV }
#Import ".\D3D11_TEX2DMS_ARRAY_RTV.ahk" { D3D11_TEX2DMS_ARRAY_RTV }
#Import ".\D3D11_TEX2D_RTV.ahk" { D3D11_TEX2D_RTV }

/**
 * Specifies the subresources from a resource that are accessible using a render-target view.
 * @remarks
 * A render-target-view description is passed into <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createrendertargetview">ID3D11Device::CreateRenderTargetView</a> to create a render target.
 * 
 * A render-target-view cannot use the following formats:
 * 
 * <ul>
 * <li>Any typeless format.</li>
 * <li>DXGI_FORMAT_R32G32B32 if the view will be used to bind a buffer (vertex, index, constant, or stream-output).</li>
 * </ul>
 * If the format is set to DXGI_FORMAT_UNKNOWN, then the format of the resource that the view binds to the pipeline will be used.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_render_target_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_RENDER_TARGET_VIEW_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The data format (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>).
     */
    Format : DXGI_FORMAT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_rtv_dimension">D3D11_RTV_DIMENSION</a></b>
     * 
     * The resource type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_rtv_dimension">D3D11_RTV_DIMENSION</a>), which specifies how the render-target resource will be accessed.
     */
    ViewDimension : D3D11_RTV_DIMENSION

    Buffer : D3D11_BUFFER_RTV

    static __New() {
        DefineProp(this.Prototype, 'Texture1D', { type: D3D11_TEX1D_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture1DArray', { type: D3D11_TEX1D_ARRAY_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2D', { type: D3D11_TEX2D_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DArray', { type: D3D11_TEX2D_ARRAY_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DMS', { type: D3D11_TEX2DMS_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DMSArray', { type: D3D11_TEX2DMS_ARRAY_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture3D', { type: D3D11_TEX3D_RTV, offset: 8 })
        this.DeleteProp("__New")
    }
}
