#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_TEX2D_RTV.ahk" { D3D12_TEX2D_RTV }
#Import ".\D3D12_BUFFER_RTV.ahk" { D3D12_BUFFER_RTV }
#Import ".\D3D12_TEX1D_ARRAY_RTV.ahk" { D3D12_TEX1D_ARRAY_RTV }
#Import ".\D3D12_TEX2DMS_RTV.ahk" { D3D12_TEX2DMS_RTV }
#Import ".\D3D12_TEX1D_RTV.ahk" { D3D12_TEX1D_RTV }
#Import ".\D3D12_TEX2D_ARRAY_RTV.ahk" { D3D12_TEX2D_ARRAY_RTV }
#Import ".\D3D12_TEX3D_RTV.ahk" { D3D12_TEX3D_RTV }
#Import ".\D3D12_RTV_DIMENSION.ahk" { D3D12_RTV_DIMENSION }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D12_TEX2DMS_ARRAY_RTV.ahk" { D3D12_TEX2DMS_ARRAY_RTV }

/**
 * Describes the subresources from a resource that are accessible by using a render-target view.
 * @remarks
 * Pass a render-target-view description into <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createrendertargetview">ID3D12Device::CreateRenderTargetView</a> to create a render-target view.
 * 
 * A render-target view can't use the following formats:
 * 
 * <ul>
 * <li>Any typeless format.</li>
 * <li>DXGI_FORMAT_R32G32B32 if the view will be used to bind a buffer (vertex, index, constant, or stream-output).</li>
 * </ul>
 * If the format is set to DXGI_FORMAT_UNKNOWN, then the format of the resource that the view binds to the pipeline will be used.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_target_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RENDER_TARGET_VIEW_DESC {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that specifies the viewing format.
     */
    Format : DXGI_FORMAT

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_rtv_dimension">D3D12_RTV_DIMENSION</a>-typed value that specifies how the render-target resource will be accessed. This type specifies how the resource will be accessed. This member also determines which _RTV to use in the following union.
     */
    ViewDimension : D3D12_RTV_DIMENSION

    Buffer : D3D12_BUFFER_RTV

    static __New() {
        DefineProp(this.Prototype, 'Texture1D', { type: D3D12_TEX1D_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture1DArray', { type: D3D12_TEX1D_ARRAY_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2D', { type: D3D12_TEX2D_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DArray', { type: D3D12_TEX2D_ARRAY_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DMS', { type: D3D12_TEX2DMS_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DMSArray', { type: D3D12_TEX2DMS_ARRAY_RTV, offset: 8 })
        DefineProp(this.Prototype, 'Texture3D', { type: D3D12_TEX3D_RTV, offset: 8 })
        this.DeleteProp("__New")
    }
}
