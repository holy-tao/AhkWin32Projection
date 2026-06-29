#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_TEXTURE_COPY_TYPE.ahk" { D3D12_TEXTURE_COPY_TYPE }
#Import ".\D3D12_SUBRESOURCE_FOOTPRINT.ahk" { D3D12_SUBRESOURCE_FOOTPRINT }
#Import "..\Dxgi\Common\DXGI_FORMAT.ahk" { DXGI_FORMAT }
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }
#Import ".\D3D12_PLACED_SUBRESOURCE_FOOTPRINT.ahk" { D3D12_PLACED_SUBRESOURCE_FOOTPRINT }

/**
 * Describes a portion of a texture for the purpose of texture copies.
 * @remarks
 * Use this structure with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-copytextureregion">CopyTextureRegion</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_texture_copy_location
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TEXTURE_COPY_LOCATION {
    #StructPack 8

    /**
     * Specifies the resource which will be used for the copy operation.<div> </div>When <b>Type</b> is D3D12_TEXTURE_COPY_TYPE_PLACED_FOOTPRINT, <b>pResource</b> must point to a buffer resource.<div> </div>When <b>Type</b> is D3D12_TEXTURE_COPY_TYPE_SUBRESOURCE_INDEX, <b>pResource</b> must point to a texture resource.
     */
    pResource : ID3D12Resource

    /**
     * Specifies which type of resource location this is: a subresource of a texture, or a description of a texture layout which can be applied to a buffer.
     *             This <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_texture_copy_type">D3D12_TEXTURE_COPY_TYPE</a> enum indicates which union member to use.
     */
    Type : D3D12_TEXTURE_COPY_TYPE

    PlacedFootprint : D3D12_PLACED_SUBRESOURCE_FOOTPRINT

    static __New() {
        DefineProp(this.Prototype, 'SubresourceIndex', { type: UInt32, offset: 16 })
        this.DeleteProp("__New")
    }
}
