#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D10_BUFFER_RTV.ahk" { D3D10_BUFFER_RTV }
#Import ".\D3D10_TEX2DMS_ARRAY_RTV.ahk" { D3D10_TEX2DMS_ARRAY_RTV }
#Import ".\D3D10_TEX2D_ARRAY_RTV.ahk" { D3D10_TEX2D_ARRAY_RTV }
#Import ".\D3D10_TEX1D_RTV.ahk" { D3D10_TEX1D_RTV }
#Import ".\D3D10_RTV_DIMENSION.ahk" { D3D10_RTV_DIMENSION }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D10_TEX2D_RTV.ahk" { D3D10_TEX2D_RTV }
#Import ".\D3D10_TEX3D_RTV.ahk" { D3D10_TEX3D_RTV }
#Import ".\D3D10_TEX2DMS_RTV.ahk" { D3D10_TEX2DMS_RTV }
#Import ".\D3D10_TEX1D_ARRAY_RTV.ahk" { D3D10_TEX1D_ARRAY_RTV }

/**
 * Specifies the subresource(s) from a resource that are accessible using a render-target view.
 * @remarks
 * A render-target-view description is passed into <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createrendertargetview">ID3D10Device::CreateRenderTargetView</a> to create a render target.
 * 
 * A render-target-view cannot use the following formats:
 * 
 * <ul>
 * <li>Any <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-access-views">typeless format</a>.</li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a> if the view will be used to bind a buffer (vertex, index, constant, or stream-output).</li>
 * </ul>
 * If the format is set to <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>, then the format of the resource that the view binds to the pipeline will be used.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_render_target_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_RENDER_TARGET_VIEW_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The data format (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>).
     */
    Format : DXGI_FORMAT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_rtv_dimension">D3D10_RTV_DIMENSION</a></b>
     * 
     * The resource type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_rtv_dimension">D3D10_RTV_DIMENSION</a>), which specifies how the render-target resource will be accessed.
     */
    ViewDimension : D3D10_RTV_DIMENSION

    Buffer : D3D10_BUFFER_RTV

    static __New() {
        DefineProp(this.Prototype, 'Texture1D', { type: D3D10_TEX1D_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture1DArray', { type: D3D10_TEX1D_ARRAY_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2D', { type: D3D10_TEX2D_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DArray', { type: D3D10_TEX2D_ARRAY_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DMS', { type: D3D10_TEX2DMS_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DMSArray', { type: D3D10_TEX2DMS_ARRAY_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture3D', { type: D3D10_TEX3D_RTV, offset: 8 })
        this.DeleteProp("__New")
    }
}
