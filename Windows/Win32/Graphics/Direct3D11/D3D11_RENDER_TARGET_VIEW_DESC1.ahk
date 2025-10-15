#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_BUFFER_RTV.ahk
#Include .\D3D11_TEX1D_RTV.ahk
#Include .\D3D11_TEX1D_ARRAY_RTV.ahk
#Include .\D3D11_TEX2D_RTV1.ahk
#Include .\D3D11_TEX2D_ARRAY_RTV1.ahk
#Include .\D3D11_TEX2DMS_RTV.ahk
#Include .\D3D11_TEX2DMS_ARRAY_RTV.ahk
#Include .\D3D11_TEX3D_RTV.ahk

/**
 * Describes the subresources from a resource that are accessible using a render-target view.
 * @remarks
 * 
  * A render-target-view description is passed into <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createrendertargetview1">ID3D11Device3::CreateRenderTargetView1</a> to create a render target.
  * 
  * A render-target-view can't use the following formats:
  * 
  * <ul>
  * <li>Any typeless format.</li>
  * <li>DXGI_FORMAT_R32G32B32 if the view will be used to bind a buffer (vertex, index, constant, or stream-output).</li>
  * </ul>
  * If the format is set to DXGI_FORMAT_UNKNOWN, then the format of the resource that the view binds to the pipeline will be used.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_3/ns-d3d11_3-d3d11_render_target_view_desc1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_RENDER_TARGET_VIEW_DESC1 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that specifies the data format.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_rtv_dimension">D3D11_RTV_DIMENSION</a>-typed value that specifies the resource type and how the render-target resource will be accessed.
     * @type {Integer}
     */
    ViewDimension {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D11_BUFFER_RTV}
     */
    Buffer{
        get {
            if(!this.HasProp("__Buffer"))
                this.__Buffer := D3D11_BUFFER_RTV(this.ptr + 8)
            return this.__Buffer
        }
    }

    /**
     * @type {D3D11_TEX1D_RTV}
     */
    Texture1D{
        get {
            if(!this.HasProp("__Texture1D"))
                this.__Texture1D := D3D11_TEX1D_RTV(this.ptr + 8)
            return this.__Texture1D
        }
    }

    /**
     * @type {D3D11_TEX1D_ARRAY_RTV}
     */
    Texture1DArray{
        get {
            if(!this.HasProp("__Texture1DArray"))
                this.__Texture1DArray := D3D11_TEX1D_ARRAY_RTV(this.ptr + 8)
            return this.__Texture1DArray
        }
    }

    /**
     * @type {D3D11_TEX2D_RTV1}
     */
    Texture2D{
        get {
            if(!this.HasProp("__Texture2D"))
                this.__Texture2D := D3D11_TEX2D_RTV1(this.ptr + 8)
            return this.__Texture2D
        }
    }

    /**
     * @type {D3D11_TEX2D_ARRAY_RTV1}
     */
    Texture2DArray{
        get {
            if(!this.HasProp("__Texture2DArray"))
                this.__Texture2DArray := D3D11_TEX2D_ARRAY_RTV1(this.ptr + 8)
            return this.__Texture2DArray
        }
    }

    /**
     * @type {D3D11_TEX2DMS_RTV}
     */
    Texture2DMS{
        get {
            if(!this.HasProp("__Texture2DMS"))
                this.__Texture2DMS := D3D11_TEX2DMS_RTV(this.ptr + 8)
            return this.__Texture2DMS
        }
    }

    /**
     * @type {D3D11_TEX2DMS_ARRAY_RTV}
     */
    Texture2DMSArray{
        get {
            if(!this.HasProp("__Texture2DMSArray"))
                this.__Texture2DMSArray := D3D11_TEX2DMS_ARRAY_RTV(this.ptr + 8)
            return this.__Texture2DMSArray
        }
    }

    /**
     * @type {D3D11_TEX3D_RTV}
     */
    Texture3D{
        get {
            if(!this.HasProp("__Texture3D"))
                this.__Texture3D := D3D11_TEX3D_RTV(this.ptr + 8)
            return this.__Texture3D
        }
    }
}
