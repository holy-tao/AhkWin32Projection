#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\D3D11_BUFFEREX_SRV.ahk" { D3D11_BUFFEREX_SRV }
#Import ".\D3D11_BUFFER_SRV.ahk" { D3D11_BUFFER_SRV }
#Import "..\Direct3D\D3D_SRV_DIMENSION.ahk" { D3D_SRV_DIMENSION }
#Import ".\D3D11_TEX2D_SRV1.ahk" { D3D11_TEX2D_SRV1 }
#Import ".\D3D11_TEX2DMS_ARRAY_SRV.ahk" { D3D11_TEX2DMS_ARRAY_SRV }
#Import ".\D3D11_TEXCUBE_ARRAY_SRV.ahk" { D3D11_TEXCUBE_ARRAY_SRV }
#Import ".\D3D11_TEX2DMS_SRV.ahk" { D3D11_TEX2DMS_SRV }
#Import ".\D3D11_TEX2D_ARRAY_SRV1.ahk" { D3D11_TEX2D_ARRAY_SRV1 }
#Import ".\D3D11_TEX3D_SRV.ahk" { D3D11_TEX3D_SRV }
#Import ".\D3D11_TEX1D_SRV.ahk" { D3D11_TEX1D_SRV }
#Import ".\D3D11_TEX1D_ARRAY_SRV.ahk" { D3D11_TEX1D_ARRAY_SRV }
#Import ".\D3D11_TEXCUBE_SRV.ahk" { D3D11_TEXCUBE_SRV }

/**
 * Describes a shader-resource view. (D3D11_SHADER_RESOURCE_VIEW_DESC1)
 * @remarks
 * A view is a format-specific way to look at the data in a resource. The view determines what data to look at, and how it is cast when read.
 * 
 * When viewing a resource, the resource-view description must specify a typed format, that is compatible with the resource format. So that means that you cannot create a resource-view description using any format with _TYPELESS in the name. You can however view a typeless resource by specifying a typed format for the view. For example, a DXGI_FORMAT_R32G32B32_TYPELESS resource can be viewed with one of these typed formats: DXGI_FORMAT_R32G32B32_FLOAT, DXGI_FORMAT_R32G32B32_UINT, and DXGI_FORMAT_R32G32B32_SINT, since these typed formats are compatible with the typeless resource.
 * 
 * Create a shader-resource-view description by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createshaderresourceview1">ID3D11Device3::CreateShaderResourceView1</a>. To view a shader-resource-view description, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11shaderresourceview1-getdesc1">ID3D11ShaderResourceView1::GetDesc1</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_shader_resource_view_desc1
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_SHADER_RESOURCE_VIEW_DESC1 {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that  specifies the viewing format. See remarks.
     */
    Format : DXGI_FORMAT

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ff476217(v=vs.85)">D3D11_SRV_DIMENSION</a>-typed value that  specifies the resource type of the view. This type is the same as the resource type of the underlying resource. This member also determines which _SRV to use in the union below.
     */
    ViewDimension : D3D_SRV_DIMENSION

    Buffer : D3D11_BUFFER_SRV

    static __New() {
        DefineProp(this.Prototype, 'Texture1D', { type: D3D11_TEX1D_SRV, offset: 8 })
        DefineProp(this.Prototype, 'Texture1DArray', { type: D3D11_TEX1D_ARRAY_SRV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2D', { type: D3D11_TEX2D_SRV1, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DArray', { type: D3D11_TEX2D_ARRAY_SRV1, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DMS', { type: D3D11_TEX2DMS_SRV, offset: 8 })
        DefineProp(this.Prototype, 'Texture2DMSArray', { type: D3D11_TEX2DMS_ARRAY_SRV, offset: 8 })
        DefineProp(this.Prototype, 'Texture3D', { type: D3D11_TEX3D_SRV, offset: 8 })
        DefineProp(this.Prototype, 'TextureCube', { type: D3D11_TEXCUBE_SRV, offset: 8 })
        DefineProp(this.Prototype, 'TextureCubeArray', { type: D3D11_TEXCUBE_ARRAY_SRV, offset: 8 })
        DefineProp(this.Prototype, 'BufferEx', { type: D3D11_BUFFEREX_SRV, offset: 8 })
        this.DeleteProp("__New")
    }
}
