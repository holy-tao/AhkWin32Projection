#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_BUFFER_UAV.ahk
#Include .\D3D11_TEX1D_ARRAY_UAV.ahk
#Include .\D3D11_TEX2D_UAV1.ahk
#Include .\D3D11_TEX2D_ARRAY_UAV1.ahk
#Include .\D3D11_TEX3D_UAV.ahk

/**
 * Describes the subresources from a resource that are accessible using an unordered-access view. (D3D11_UNORDERED_ACCESS_VIEW_DESC1)
 * @remarks
 * An unordered-access-view description is passed into <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_3/nf-d3d11_3-id3d11device3-createunorderedaccessview1">ID3D11Device3::CreateUnorderedAccessView1</a> to create a view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_unordered_access_view_desc1
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_UNORDERED_ACCESS_VIEW_DESC1 extends Win32Struct
{
    static sizeof => 16

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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_uav_dimension">D3D11_UAV_DIMENSION</a>-typed value that  specifies the resource type of the view. This type is the same as the resource type of the underlying resource. This member also determines which _UAV to use in the union below.
     * @type {Integer}
     */
    ViewDimension {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D11_BUFFER_UAV}
     */
    Buffer{
        get {
            if(!this.HasProp("__Buffer"))
                this.__Buffer := D3D11_BUFFER_UAV(this.ptr + 8)
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
     * @type {D3D11_TEX1D_ARRAY_UAV}
     */
    Texture1DArray{
        get {
            if(!this.HasProp("__Texture1DArray"))
                this.__Texture1DArray := D3D11_TEX1D_ARRAY_UAV(this.ptr + 8)
            return this.__Texture1DArray
        }
    }

    /**
     * @type {D3D11_TEX2D_UAV1}
     */
    Texture2D{
        get {
            if(!this.HasProp("__Texture2D"))
                this.__Texture2D := D3D11_TEX2D_UAV1(this.ptr + 8)
            return this.__Texture2D
        }
    }

    /**
     * @type {D3D11_TEX2D_ARRAY_UAV1}
     */
    Texture2DArray{
        get {
            if(!this.HasProp("__Texture2DArray"))
                this.__Texture2DArray := D3D11_TEX2D_ARRAY_UAV1(this.ptr + 8)
            return this.__Texture2DArray
        }
    }

    /**
     * @type {D3D11_TEX3D_UAV}
     */
    Texture3D{
        get {
            if(!this.HasProp("__Texture3D"))
                this.__Texture3D := D3D11_TEX3D_UAV(this.ptr + 8)
            return this.__Texture3D
        }
    }
}
