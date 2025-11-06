#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10Resource.ahk

/**
 * A 1D texture interface accesses texel data, which is structured memory.
 * @remarks
 * 
  * To create an empty 1D texture, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createtexture1d">ID3D10Device::CreateTexture1D</a>. For more details on creating and loading textures, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-creating-textures">Creating Texture Resources</a>.
  * 
  * Textures cannot be bound directly to the <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-pipeline-stages">pipeline</a>; instead, a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-access-views">view</a> must be created and bound. Using a view, texture data can be interpreted at run time within certain restrictions. To use the texture as a render target or depth-stencil resource, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createrendertargetview">ID3D10Device::CreateRenderTargetView</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createdepthstencilview">ID3D10Device::CreateDepthStencilView</a>, respectively. To use the texture as an input to a shader, create a  by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createshaderresourceview">ID3D10Device::CreateShaderResourceView</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10texture1d
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10Texture1D extends ID3D10Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10Texture1D
     * @type {Guid}
     */
    static IID => Guid("{9b7e4c03-342c-4106-a19f-4f2704f689f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Map", "Unmap", "GetDesc"]

    /**
     * 
     * @param {Integer} Subresource 
     * @param {Integer} MapType 
     * @param {Integer} MapFlags 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10texture1d-map
     */
    Map(Subresource, MapType, MapFlags) {
        result := ComCall(10, this, "uint", Subresource, "int", MapType, "uint", MapFlags, "ptr*", &ppData := 0, "HRESULT")
        return ppData
    }

    /**
     * 
     * @param {Integer} Subresource 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10texture1d-unmap
     */
    Unmap(Subresource) {
        ComCall(11, this, "uint", Subresource)
    }

    /**
     * 
     * @param {Pointer<D3D10_TEXTURE1D_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10texture1d-getdesc
     */
    GetDesc(pDesc) {
        ComCall(12, this, "ptr", pDesc)
    }
}
