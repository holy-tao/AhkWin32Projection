#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_SUBRESOURCE_FOOTPRINT.ahk
#Include .\D3D12_PLACED_SUBRESOURCE_FOOTPRINT.ahk

/**
 * Describes a portion of a texture for the purpose of texture copies.
 * @remarks
 * 
  * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytextureregion">CopyTextureRegion</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_texture_copy_location
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_TEXTURE_COPY_LOCATION extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Specifies the resource which will be used for the copy operation.<div> </div>When <b>Type</b> is D3D12_TEXTURE_COPY_TYPE_PLACED_FOOTPRINT, <b>pResource</b> must point to a buffer resource.<div> </div>When <b>Type</b> is D3D12_TEXTURE_COPY_TYPE_SUBRESOURCE_INDEX, <b>pResource</b> must point to a texture resource.
     * @type {ID3D12Resource}
     */
    pResource {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies which type of resource location this is: a subresource of a texture, or a description of a texture layout which can be applied to a buffer.
     *             This <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_copy_type">D3D12_TEXTURE_COPY_TYPE</a> enum indicates which union member to use.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {D3D12_PLACED_SUBRESOURCE_FOOTPRINT}
     */
    PlacedFootprint{
        get {
            if(!this.HasProp("__PlacedFootprint"))
                this.__PlacedFootprint := D3D12_PLACED_SUBRESOURCE_FOOTPRINT(16, this)
            return this.__PlacedFootprint
        }
    }

    /**
     * @type {Integer}
     */
    SubresourceIndex {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
