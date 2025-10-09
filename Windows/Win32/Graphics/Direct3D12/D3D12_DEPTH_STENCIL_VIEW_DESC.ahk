#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_TEX1D_ARRAY_DSV.ahk
#Include .\D3D12_TEX2D_ARRAY_DSV.ahk
#Include .\D3D12_TEX2DMS_ARRAY_DSV.ahk

/**
 * Describes the subresources of a texture that are accessible from a depth-stencil view.
 * @remarks
 * These are valid formats for a depth-stencil view:
  *         
  * 
  * <ul>
  * <li>DXGI_FORMAT_D16_UNORM</li>
  * <li>DXGI_FORMAT_D24_UNORM_S8_UINT</li>
  * <li>DXGI_FORMAT_D32_FLOAT</li>
  * <li>DXGI_FORMAT_D32_FLOAT_S8X24_UINT</li>
  * <li>DXGI_FORMAT_UNKNOWN</li>
  * </ul>
  * A depth-stencil view can't use a typeless format.  If the format chosen is DXGI_FORMAT_UNKNOWN, the format of the parent resource is used.
  *         
  * 
  * Pass a depth-stencil-view description into <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createdepthstencilview">ID3D12Device::CreateDepthStencilView</a> to create a depth-stencil view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencil_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_DEPTH_STENCIL_VIEW_DESC extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value that specifies the viewing format.  For allowable formats, see Remarks.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_dsv_dimension">D3D12_DSV_DIMENSION</a>-typed value that specifies how the depth-stencil resource will be accessed. This member also determines which _DSV to use in the following union.
     * @type {Integer}
     */
    ViewDimension {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_dsv_flags">D3D12_DSV_FLAGS</a> enumeration constants that are combined by using a bitwise OR operation. 
     *             The resulting value specifies whether the texture is read only.  
     *             Pass 0 to specify that it isn't read only; otherwise, pass one or more of the members of the <b>D3D12_DSV_FLAGS</b> enumerated type.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Texture1D {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {D3D12_TEX1D_ARRAY_DSV}
     */
    Texture1DArray{
        get {
            if(!this.HasProp("__Texture1DArray"))
                this.__Texture1DArray := D3D12_TEX1D_ARRAY_DSV(this.ptr + 16)
            return this.__Texture1DArray
        }
    }

    /**
     * @type {Integer}
     */
    Texture2D {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {D3D12_TEX2D_ARRAY_DSV}
     */
    Texture2DArray{
        get {
            if(!this.HasProp("__Texture2DArray"))
                this.__Texture2DArray := D3D12_TEX2D_ARRAY_DSV(this.ptr + 16)
            return this.__Texture2DArray
        }
    }

    /**
     * @type {Integer}
     */
    Texture2DMS {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {D3D12_TEX2DMS_ARRAY_DSV}
     */
    Texture2DMSArray{
        get {
            if(!this.HasProp("__Texture2DMSArray"))
                this.__Texture2DMSArray := D3D12_TEX2DMS_ARRAY_DSV(this.ptr + 16)
            return this.__Texture2DMSArray
        }
    }
}
