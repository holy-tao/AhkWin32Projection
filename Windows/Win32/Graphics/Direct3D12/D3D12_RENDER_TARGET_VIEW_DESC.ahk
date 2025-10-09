#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_BUFFER_RTV.ahk
#Include .\D3D12_TEX1D_ARRAY_RTV.ahk
#Include .\D3D12_TEX2D_RTV.ahk
#Include .\D3D12_TEX2D_ARRAY_RTV.ahk
#Include .\D3D12_TEX2DMS_ARRAY_RTV.ahk
#Include .\D3D12_TEX3D_RTV.ahk

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
 * @version v4.0.30319
 */
class D3D12_RENDER_TARGET_VIEW_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that specifies the viewing format.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_rtv_dimension">D3D12_RTV_DIMENSION</a>-typed value that specifies how the render-target resource will be accessed. This type specifies how the resource will be accessed. This member also determines which _RTV to use in the following union.
     * @type {Integer}
     */
    ViewDimension {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D12_BUFFER_RTV}
     */
    Buffer{
        get {
            if(!this.HasProp("__Buffer"))
                this.__Buffer := D3D12_BUFFER_RTV(this.ptr + 8)
            return this.__Buffer
        }
    }

    /**
     * @type {Integer}
     */
    Texture1D {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {D3D12_TEX1D_ARRAY_RTV}
     */
    Texture1DArray{
        get {
            if(!this.HasProp("__Texture1DArray"))
                this.__Texture1DArray := D3D12_TEX1D_ARRAY_RTV(this.ptr + 8)
            return this.__Texture1DArray
        }
    }

    /**
     * @type {D3D12_TEX2D_RTV}
     */
    Texture2D{
        get {
            if(!this.HasProp("__Texture2D"))
                this.__Texture2D := D3D12_TEX2D_RTV(this.ptr + 8)
            return this.__Texture2D
        }
    }

    /**
     * @type {D3D12_TEX2D_ARRAY_RTV}
     */
    Texture2DArray{
        get {
            if(!this.HasProp("__Texture2DArray"))
                this.__Texture2DArray := D3D12_TEX2D_ARRAY_RTV(this.ptr + 8)
            return this.__Texture2DArray
        }
    }

    /**
     * @type {Integer}
     */
    Texture2DMS {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {D3D12_TEX2DMS_ARRAY_RTV}
     */
    Texture2DMSArray{
        get {
            if(!this.HasProp("__Texture2DMSArray"))
                this.__Texture2DMSArray := D3D12_TEX2DMS_ARRAY_RTV(this.ptr + 8)
            return this.__Texture2DMSArray
        }
    }

    /**
     * @type {D3D12_TEX3D_RTV}
     */
    Texture3D{
        get {
            if(!this.HasProp("__Texture3D"))
                this.__Texture3D := D3D12_TEX3D_RTV(this.ptr + 8)
            return this.__Texture3D
        }
    }
}
