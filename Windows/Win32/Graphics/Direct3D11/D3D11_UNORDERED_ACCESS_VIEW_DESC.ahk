#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D11_BUFFER_UAV.ahk
#Include .\D3D11_TEX1D_UAV.ahk
#Include .\D3D11_TEX1D_ARRAY_UAV.ahk
#Include .\D3D11_TEX2D_UAV.ahk
#Include .\D3D11_TEX2D_ARRAY_UAV.ahk
#Include .\D3D11_TEX3D_UAV.ahk

/**
 * Specifies the subresources from a resource that are accessible using an unordered-access view.
 * @remarks
 * An unordered-access-view description is passed into <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createunorderedaccessview">ID3D11Device::CreateUnorderedAccessView</a> to create a view.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_unordered_access_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_UNORDERED_ACCESS_VIEW_DESC extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_uav_dimension">D3D11_UAV_DIMENSION</a></b>
     * 
     * The resource type (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_uav_dimension">D3D11_UAV_DIMENSION</a>), which specifies how the resource will be accessed.
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
                this.__Buffer := D3D11_BUFFER_UAV(8, this)
            return this.__Buffer
        }
    }

    /**
     * @type {D3D11_TEX1D_UAV}
     */
    Texture1D{
        get {
            if(!this.HasProp("__Texture1D"))
                this.__Texture1D := D3D11_TEX1D_UAV(8, this)
            return this.__Texture1D
        }
    }

    /**
     * @type {D3D11_TEX1D_ARRAY_UAV}
     */
    Texture1DArray{
        get {
            if(!this.HasProp("__Texture1DArray"))
                this.__Texture1DArray := D3D11_TEX1D_ARRAY_UAV(8, this)
            return this.__Texture1DArray
        }
    }

    /**
     * @type {D3D11_TEX2D_UAV}
     */
    Texture2D{
        get {
            if(!this.HasProp("__Texture2D"))
                this.__Texture2D := D3D11_TEX2D_UAV(8, this)
            return this.__Texture2D
        }
    }

    /**
     * @type {D3D11_TEX2D_ARRAY_UAV}
     */
    Texture2DArray{
        get {
            if(!this.HasProp("__Texture2DArray"))
                this.__Texture2DArray := D3D11_TEX2D_ARRAY_UAV(8, this)
            return this.__Texture2DArray
        }
    }

    /**
     * @type {D3D11_TEX3D_UAV}
     */
    Texture3D{
        get {
            if(!this.HasProp("__Texture3D"))
                this.__Texture3D := D3D11_TEX3D_UAV(8, this)
            return this.__Texture3D
        }
    }
}
