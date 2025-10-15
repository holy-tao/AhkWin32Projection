#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D10_BUFFER_RTV.ahk
#Include .\D3D10_TEX1D_RTV.ahk
#Include .\D3D10_TEX1D_ARRAY_RTV.ahk
#Include .\D3D10_TEX2D_RTV.ahk
#Include .\D3D10_TEX2D_ARRAY_RTV.ahk
#Include .\D3D10_TEX2DMS_RTV.ahk
#Include .\D3D10_TEX2DMS_ARRAY_RTV.ahk
#Include .\D3D10_TEX3D_RTV.ahk

/**
 * Specifies the subresource(s) from a resource that are accessible using a render-target view.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ns-d3d10-d3d10_render_target_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_RENDER_TARGET_VIEW_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a></b>
     * 
     * The data format (see <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>).
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_rtv_dimension">D3D10_RTV_DIMENSION</a></b>
     * 
     * The resource type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_rtv_dimension">D3D10_RTV_DIMENSION</a>), which specifies how the render-target resource will be accessed.
     * @type {Integer}
     */
    ViewDimension {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D10_BUFFER_RTV}
     */
    Buffer{
        get {
            if(!this.HasProp("__Buffer"))
                this.__Buffer := D3D10_BUFFER_RTV(this.ptr + 8)
            return this.__Buffer
        }
    }

    /**
     * @type {D3D10_TEX1D_RTV}
     */
    Texture1D{
        get {
            if(!this.HasProp("__Texture1D"))
                this.__Texture1D := D3D10_TEX1D_RTV(this.ptr + 8)
            return this.__Texture1D
        }
    }

    /**
     * @type {D3D10_TEX1D_ARRAY_RTV}
     */
    Texture1DArray{
        get {
            if(!this.HasProp("__Texture1DArray"))
                this.__Texture1DArray := D3D10_TEX1D_ARRAY_RTV(this.ptr + 8)
            return this.__Texture1DArray
        }
    }

    /**
     * @type {D3D10_TEX2D_RTV}
     */
    Texture2D{
        get {
            if(!this.HasProp("__Texture2D"))
                this.__Texture2D := D3D10_TEX2D_RTV(this.ptr + 8)
            return this.__Texture2D
        }
    }

    /**
     * @type {D3D10_TEX2D_ARRAY_RTV}
     */
    Texture2DArray{
        get {
            if(!this.HasProp("__Texture2DArray"))
                this.__Texture2DArray := D3D10_TEX2D_ARRAY_RTV(this.ptr + 8)
            return this.__Texture2DArray
        }
    }

    /**
     * @type {D3D10_TEX2DMS_RTV}
     */
    Texture2DMS{
        get {
            if(!this.HasProp("__Texture2DMS"))
                this.__Texture2DMS := D3D10_TEX2DMS_RTV(this.ptr + 8)
            return this.__Texture2DMS
        }
    }

    /**
     * @type {D3D10_TEX2DMS_ARRAY_RTV}
     */
    Texture2DMSArray{
        get {
            if(!this.HasProp("__Texture2DMSArray"))
                this.__Texture2DMSArray := D3D10_TEX2DMS_ARRAY_RTV(this.ptr + 8)
            return this.__Texture2DMSArray
        }
    }

    /**
     * @type {D3D10_TEX3D_RTV}
     */
    Texture3D{
        get {
            if(!this.HasProp("__Texture3D"))
                this.__Texture3D := D3D10_TEX3D_RTV(this.ptr + 8)
            return this.__Texture3D
        }
    }
}
