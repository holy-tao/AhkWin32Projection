#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D10_BUFFER_SRV.ahk
#Include .\D3D10_TEX1D_SRV.ahk
#Include .\D3D10_TEX1D_ARRAY_SRV.ahk
#Include .\D3D10_TEX2D_SRV.ahk
#Include .\D3D10_TEX2D_ARRAY_SRV.ahk
#Include .\D3D10_TEX2DMS_SRV.ahk
#Include .\D3D10_TEX2DMS_ARRAY_SRV.ahk
#Include .\D3D10_TEX3D_SRV.ahk
#Include .\D3D10_TEXCUBE_SRV.ahk

/**
 * Describes a shader-resource view.
 * @remarks
 * 
 * A view is a format-specific way to look at the data in a resource. The view determines what data to look at, and how it is cast when read. For more information about how views work, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-access-views">Views</a>
 * 
 * 
 * When viewing a resource, the resource-view description must specify a typed format, that is compatible with the resource format. So that means that you cannot create a resource-view description using any format with _TYPELESS in the name. You can however view a typeless resource by specifying a typed format for the view. For example, a DXGI_FORMAT_R32G32B32_TYPELESS resource can be viewed with one of these typed formats: DXGI_FORMAT_R32G32B32_FLOAT, DXGI_FORMAT_R32G32B32_UINT, and DXGI_FORMAT_R32G32B32_SINT, since these typed formats are compatible with the typeless resource.
 * 
 * Create a shader-resource-view description by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createshaderresourceview">ID3D10Device::CreateShaderResourceView</a>. To view a shader-resource-view description, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10shaderresourceview-getdesc">ID3D10ShaderResourceView::GetDesc</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ns-d3d10-d3d10_shader_resource_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_SHADER_RESOURCE_VIEW_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The viewing <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">format</a>. See remarks.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_buffer_srv">D3D10_SRV_DIMENSION</a></b>
     * 
     * The resource type of the view. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_buffer_srv">D3D10_SRV_DIMENSION</a>. This should be the same as the resource type of the underlying resource. This parameter also determines which _SRV to use in the union below.
     * @type {Integer}
     */
    ViewDimension {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D10_BUFFER_SRV}
     */
    Buffer{
        get {
            if(!this.HasProp("__Buffer"))
                this.__Buffer := D3D10_BUFFER_SRV(8, this)
            return this.__Buffer
        }
    }

    /**
     * @type {D3D10_TEX1D_SRV}
     */
    Texture1D{
        get {
            if(!this.HasProp("__Texture1D"))
                this.__Texture1D := D3D10_TEX1D_SRV(8, this)
            return this.__Texture1D
        }
    }

    /**
     * @type {D3D10_TEX1D_ARRAY_SRV}
     */
    Texture1DArray{
        get {
            if(!this.HasProp("__Texture1DArray"))
                this.__Texture1DArray := D3D10_TEX1D_ARRAY_SRV(8, this)
            return this.__Texture1DArray
        }
    }

    /**
     * @type {D3D10_TEX2D_SRV}
     */
    Texture2D{
        get {
            if(!this.HasProp("__Texture2D"))
                this.__Texture2D := D3D10_TEX2D_SRV(8, this)
            return this.__Texture2D
        }
    }

    /**
     * @type {D3D10_TEX2D_ARRAY_SRV}
     */
    Texture2DArray{
        get {
            if(!this.HasProp("__Texture2DArray"))
                this.__Texture2DArray := D3D10_TEX2D_ARRAY_SRV(8, this)
            return this.__Texture2DArray
        }
    }

    /**
     * @type {D3D10_TEX2DMS_SRV}
     */
    Texture2DMS{
        get {
            if(!this.HasProp("__Texture2DMS"))
                this.__Texture2DMS := D3D10_TEX2DMS_SRV(8, this)
            return this.__Texture2DMS
        }
    }

    /**
     * @type {D3D10_TEX2DMS_ARRAY_SRV}
     */
    Texture2DMSArray{
        get {
            if(!this.HasProp("__Texture2DMSArray"))
                this.__Texture2DMSArray := D3D10_TEX2DMS_ARRAY_SRV(8, this)
            return this.__Texture2DMSArray
        }
    }

    /**
     * @type {D3D10_TEX3D_SRV}
     */
    Texture3D{
        get {
            if(!this.HasProp("__Texture3D"))
                this.__Texture3D := D3D10_TEX3D_SRV(8, this)
            return this.__Texture3D
        }
    }

    /**
     * @type {D3D10_TEXCUBE_SRV}
     */
    TextureCube{
        get {
            if(!this.HasProp("__TextureCube"))
                this.__TextureCube := D3D10_TEXCUBE_SRV(8, this)
            return this.__TextureCube
        }
    }
}
