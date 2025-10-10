#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_BUFFER_UAV.ahk
#Include .\D3D12_TEX1D_ARRAY_UAV.ahk
#Include .\D3D12_TEX2D_UAV.ahk
#Include .\D3D12_TEX2D_ARRAY_UAV.ahk
#Include .\D3D12_TEX2DMS_ARRAY_UAV.ahk
#Include .\D3D12_TEX3D_UAV.ahk

/**
 * Describes the subresources from a resource that are accessible by using an unordered-access view.
 * @remarks
 * 
  * Pass an unordered-access-view description into <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createunorderedaccessview">ID3D12Device::CreateUnorderedAccessView</a> to create a view.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_unordered_access_view_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_UNORDERED_ACCESS_VIEW_DESC extends Win32Struct
{
    static sizeof => 48

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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_uav_dimension">D3D12_UAV_DIMENSION</a>-typed value that specifies the resource type of the view. This type specifies how the resource will be accessed. This member also determines which _UAV to use in the union below.
     * @type {Integer}
     */
    ViewDimension {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {D3D12_BUFFER_UAV}
     */
    Buffer{
        get {
            if(!this.HasProp("__Buffer"))
                this.__Buffer := D3D12_BUFFER_UAV(this.ptr + 8)
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
     * @type {D3D12_TEX1D_ARRAY_UAV}
     */
    Texture1DArray{
        get {
            if(!this.HasProp("__Texture1DArray"))
                this.__Texture1DArray := D3D12_TEX1D_ARRAY_UAV(this.ptr + 8)
            return this.__Texture1DArray
        }
    }

    /**
     * @type {D3D12_TEX2D_UAV}
     */
    Texture2D{
        get {
            if(!this.HasProp("__Texture2D"))
                this.__Texture2D := D3D12_TEX2D_UAV(this.ptr + 8)
            return this.__Texture2D
        }
    }

    /**
     * @type {D3D12_TEX2D_ARRAY_UAV}
     */
    Texture2DArray{
        get {
            if(!this.HasProp("__Texture2DArray"))
                this.__Texture2DArray := D3D12_TEX2D_ARRAY_UAV(this.ptr + 8)
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
     * @type {D3D12_TEX2DMS_ARRAY_UAV}
     */
    Texture2DMSArray{
        get {
            if(!this.HasProp("__Texture2DMSArray"))
                this.__Texture2DMSArray := D3D12_TEX2DMS_ARRAY_UAV(this.ptr + 8)
            return this.__Texture2DMSArray
        }
    }

    /**
     * @type {D3D12_TEX3D_UAV}
     */
    Texture3D{
        get {
            if(!this.HasProp("__Texture3D"))
                this.__Texture3D := D3D12_TEX3D_UAV(this.ptr + 8)
            return this.__Texture3D
        }
    }
}
