#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import "..\Direct3D\D3D_SRV_DIMENSION.ahk" { D3D_SRV_DIMENSION }
#Import ".\D3D10_TEX3D_SRV.ahk" { D3D10_TEX3D_SRV }
#Import ".\D3D10_TEX1D_SRV.ahk" { D3D10_TEX1D_SRV }
#Import ".\D3D10_TEX2D_SRV.ahk" { D3D10_TEX2D_SRV }
#Import ".\D3D10_TEX2DMS_ARRAY_SRV.ahk" { D3D10_TEX2DMS_ARRAY_SRV }
#Import ".\D3D10_TEX2DMS_SRV.ahk" { D3D10_TEX2DMS_SRV }
#Import ".\D3D10_TEXCUBE_SRV.ahk" { D3D10_TEXCUBE_SRV }
#Import ".\D3D10_TEX1D_ARRAY_SRV.ahk" { D3D10_TEX1D_ARRAY_SRV }
#Import ".\D3D10_TEX2D_ARRAY_SRV.ahk" { D3D10_TEX2D_ARRAY_SRV }
#Import ".\D3D10_BUFFER_SRV.ahk" { D3D10_BUFFER_SRV }

/**
 * Describes a shader-resource view. (D3D10_SHADER_RESOURCE_VIEW_DESC)
 * @remarks
 * A view is a format-specific way to look at the data in a resource. The view determines what data to look at, and how it is cast when read. For more information about how views work, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-access-views">Views</a>
 * 
 * 
 * When viewing a resource, the resource-view description must specify a typed format, that is compatible with the resource format. So that means that you cannot create a resource-view description using any format with _TYPELESS in the name. You can however view a typeless resource by specifying a typed format for the view. For example, a DXGI_FORMAT_R32G32B32_TYPELESS resource can be viewed with one of these typed formats: DXGI_FORMAT_R32G32B32_FLOAT, DXGI_FORMAT_R32G32B32_UINT, and DXGI_FORMAT_R32G32B32_SINT, since these typed formats are compatible with the typeless resource.
 * 
 * Create a shader-resource-view description by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createshaderresourceview">ID3D10Device::CreateShaderResourceView</a>. To view a shader-resource-view description, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10shaderresourceview-getdesc">ID3D10ShaderResourceView::GetDesc</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_shader_resource_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct D3D10_SHADER_RESOURCE_VIEW_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The viewing <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">format</a>. See remarks.
     */
    Format : DXGI_FORMAT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_buffer_srv">D3D10_SRV_DIMENSION</a></b>
     * 
     * The resource type of the view. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_buffer_srv">D3D10_SRV_DIMENSION</a>. This should be the same as the resource type of the underlying resource. This parameter also determines which _SRV to use in the union below.
     */
    ViewDimension : D3D_SRV_DIMENSION

    Buffer : D3D10_BUFFER_SRV

    static __New() {
        DefineProp(this.Prototype, 'Texture1D', { type: D3D10_TEX1D_SRV, offset: 8 })
        DefineProp(this.Prototype, 'Texture1DArray', { type: D3D10_TEX1D_ARRAY_SRV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2D', { type: D3D10_TEX2D_SRV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DArray', { type: D3D10_TEX2D_ARRAY_SRV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DMS', { type: D3D10_TEX2DMS_SRV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DMSArray', { type: D3D10_TEX2DMS_ARRAY_SRV, offset: 8 })
        DefineProp(this.Prototype, 'Texture3D', { type: D3D10_TEX3D_SRV, offset: 8 })
        DefineProp(this.Prototype, 'TextureCube', { type: D3D10_TEXCUBE_SRV, offset: 8 })
        this.DeleteProp("__New")
    }
}
