#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D10_MAPPED_TEXTURE2D.ahk
#Include .\ID3D10Resource.ahk

/**
 * A 2D texture interface manages texel data, which is structured memory.
 * @remarks
 * 
 * To create an empty Texture2D resource, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createtexture2d">ID3D10Device::CreateTexture2D</a>. For more details on creating and loading textures, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-creating-textures">Creating Texture Resources</a>.
 * 
 * Textures cannot be bound directly to the <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-pipeline-stages">pipeline</a>; instead, a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-access-views">view</a> must be created and bound. Using a view, texture data can be interpreted at run time within certain restrictions. To use the texture as a render target or depth-stencil resource, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createrendertargetview">ID3D10Device::CreateRenderTargetView</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createdepthstencilview">ID3D10Device::CreateDepthStencilView</a>, respectively. To use the texture as an input to a shader, create a  by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createshaderresourceview">ID3D10Device::CreateShaderResourceView</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10texture2d
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10Texture2D extends ID3D10Resource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10Texture2D
     * @type {Guid}
     */
    static IID => Guid("{9b7e4c04-342c-4106-a19f-4f2704f689f0}")

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
     * Get a pointer to the data contained in a subresource, and deny GPU access to that subresource.
     * @param {Integer} Subresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index number of the subresource. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-d3d10calcsubresource">D3D10CalcSubresource</a> for more details.
     * @param {Integer} MapType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map">D3D10_MAP</a></b>
     * 
     * Integer that specifies the CPU's read and write permissions for a resource. For possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map">D3D10_MAP</a>.
     * @param {Integer} MapFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map_flag">Flag</a> that specifies what the CPU should do when the GPU is busy. This flag is optional.
     * @returns {D3D10_MAPPED_TEXTURE2D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_mapped_texture2d">D3D10_MAPPED_TEXTURE2D</a>*</b>
     * 
     * Pointer to a structure (<a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_mapped_texture2d">D3D10_MAPPED_TEXTURE2D</a>) that is filled in by the function and contains a pointer to the resource data.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10texture2d-map
     */
    Map(Subresource, MapType, MapFlags) {
        pMappedTex2D := D3D10_MAPPED_TEXTURE2D()
        result := ComCall(10, this, "uint", Subresource, "int", MapType, "uint", MapFlags, "ptr", pMappedTex2D, "HRESULT")
        return pMappedTex2D
    }

    /**
     * Invalidate the pointer to the resource that was retrieved by ID3D10Texture2D::Map, and re-enable GPU access to the resource.
     * @remarks
     * 
     * A subresource must be mapped before Unmap is called.
     * 
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 9 and Direct3D 10:
     * 
     * Unmap in Direct3D 10 is analogous to resource Unlock in Direct3D 9.
     * 
     * </td>
     * </tr>
     * </table>
     * 
     * 
     * @param {Integer} Subresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">Subresource</a> to be unmapped. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-d3d10calcsubresource">D3D10CalcSubresource</a> for more details.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10texture2d-unmap
     */
    Unmap(Subresource) {
        ComCall(11, this, "uint", Subresource)
    }

    /**
     * Get the properties of the texture resource.
     * @param {Pointer<D3D10_TEXTURE2D_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture2d_desc">D3D10_TEXTURE2D_DESC</a>*</b>
     * 
     * Pointer to a resource description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture2d_desc">D3D10_TEXTURE2D_DESC</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d10/nf-d3d10-id3d10texture2d-getdesc
     */
    GetDesc(pDesc) {
        ComCall(12, this, "ptr", pDesc)
    }
}
