#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D10_TEX1D_DSV.ahk
#Include .\D3D10_TEX1D_ARRAY_DSV.ahk
#Include .\D3D10_TEX2D_DSV.ahk
#Include .\D3D10_TEX2D_ARRAY_DSV.ahk
#Include .\D3D10_TEX2DMS_DSV.ahk
#Include .\D3D10_TEX2DMS_ARRAY_DSV.ahk

/**
 * Specifies the subresource(s) from a texture that are accessible using a depth-stencil view.
 * @remarks
 * These are valid formats for a depth-stencil view:
 * 
 * <ul>
 * <li>DXGI_FORMAT_D16_UNORM</li>
 * <li>DXGI_FORMAT_D24_UNORM_S8_UINT</li>
 * <li>DXGI_FORMAT_D32_FLOAT</li>
 * <li>DXGI_FORMAT_D32_FLOAT_S8X24_UINT</li>
 * <li>DXGI_FORMAT_UNKNOWN</li>
 * </ul>
 * A depth-stencil view cannot use a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-access-views">typeless format</a>.  If the format chosen is DXGI_FORMAT_UNKNOWN, then the format of the parent resource is used.
 * 
 * A depth-stencil-view description is needed when calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createdepthstencilview">ID3D10Device::CreateDepthStencilView</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ns-d3d10-d3d10_depth_stencil_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_DEPTH_STENCIL_VIEW_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * Resource data  format (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>). See remarks for allowable formats.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_dsv_dimension">D3D10_DSV_DIMENSION</a></b>
     * 
     * Type of resource (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_dsv_dimension">D3D10_DSV_DIMENSION</a>). Specifies how a depth-stencil resource will be accessed; the value is stored in the union in this structure.
     * @type {Integer}
     */
    ViewDimension {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D10_TEX1D_DSV}
     */
    Texture1D{
        get {
            if(!this.HasProp("__Texture1D"))
                this.__Texture1D := D3D10_TEX1D_DSV(8, this)
            return this.__Texture1D
        }
    }

    /**
     * @type {D3D10_TEX1D_ARRAY_DSV}
     */
    Texture1DArray{
        get {
            if(!this.HasProp("__Texture1DArray"))
                this.__Texture1DArray := D3D10_TEX1D_ARRAY_DSV(8, this)
            return this.__Texture1DArray
        }
    }

    /**
     * @type {D3D10_TEX2D_DSV}
     */
    Texture2D{
        get {
            if(!this.HasProp("__Texture2D"))
                this.__Texture2D := D3D10_TEX2D_DSV(8, this)
            return this.__Texture2D
        }
    }

    /**
     * @type {D3D10_TEX2D_ARRAY_DSV}
     */
    Texture2DArray{
        get {
            if(!this.HasProp("__Texture2DArray"))
                this.__Texture2DArray := D3D10_TEX2D_ARRAY_DSV(8, this)
            return this.__Texture2DArray
        }
    }

    /**
     * @type {D3D10_TEX2DMS_DSV}
     */
    Texture2DMS{
        get {
            if(!this.HasProp("__Texture2DMS"))
                this.__Texture2DMS := D3D10_TEX2DMS_DSV(8, this)
            return this.__Texture2DMS
        }
    }

    /**
     * @type {D3D10_TEX2DMS_ARRAY_DSV}
     */
    Texture2DMSArray{
        get {
            if(!this.HasProp("__Texture2DMSArray"))
                this.__Texture2DMSArray := D3D10_TEX2DMS_ARRAY_DSV(8, this)
            return this.__Texture2DMSArray
        }
    }
}
