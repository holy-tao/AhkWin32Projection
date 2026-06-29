#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10Resource.ahk" { ID3D10Resource }
#Import ".\D3D10_MAPPED_TEXTURE2D.ahk" { D3D10_MAPPED_TEXTURE2D }
#Import ".\D3D10_MAP.ahk" { D3D10_MAP }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D10_TEXTURE2D_DESC.ahk" { D3D10_TEXTURE2D_DESC }

/**
 * A 2D texture interface manages texel data, which is structured memory. (ID3D10Texture2D)
 * @remarks
 * To create an empty Texture2D resource, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createtexture2d">ID3D10Device::CreateTexture2D</a>. For more details on creating and loading textures, see <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-creating-textures">Creating Texture Resources</a>.
 * 
 * Textures cannot be bound directly to the <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-pipeline-stages">pipeline</a>; instead, a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-access-views">view</a> must be created and bound. Using a view, texture data can be interpreted at run time within certain restrictions. To use the texture as a render target or depth-stencil resource, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createrendertargetview">ID3D10Device::CreateRenderTargetView</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createdepthstencilview">ID3D10Device::CreateDepthStencilView</a>, respectively. To use the texture as an input to a shader, create a  by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createshaderresourceview">ID3D10Device::CreateShaderResourceView</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/nn-d3d10-id3d10texture2d
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10Texture2D extends ID3D10Resource {
    /**
     * The interface identifier for ID3D10Texture2D
     * @type {Guid}
     */
    static IID := Guid("{9b7e4c04-342c-4106-a19f-4f2704f689f0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10Texture2D interfaces
    */
    struct Vtbl extends ID3D10Resource.Vtbl {
        Map     : IntPtr
        Unmap   : IntPtr
        GetDesc : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10Texture2D.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Get a pointer to the data contained in a subresource, and deny GPU access to that subresource. (ID3D10Texture2D.Map)
     * @param {Integer} Subresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Index number of the subresource. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-d3d10calcsubresource">D3D10CalcSubresource</a> for more details.
     * @param {D3D10_MAP} MapType Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map">D3D10_MAP</a></b>
     * 
     * Integer that specifies the CPU's read and write permissions for a resource. For possible values, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map">D3D10_MAP</a>.
     * @param {Integer} MapFlags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_map_flag">Flag</a> that specifies what the CPU should do when the GPU is busy. This flag is optional.
     * @returns {D3D10_MAPPED_TEXTURE2D} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_mapped_texture2d">D3D10_MAPPED_TEXTURE2D</a>*</b>
     * 
     * Pointer to a structure (<a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_mapped_texture2d">D3D10_MAPPED_TEXTURE2D</a>) that is filled in by the function and contains a pointer to the resource data.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10texture2d-map
     */
    Map(Subresource, MapType, MapFlags) {
        pMappedTex2D := D3D10_MAPPED_TEXTURE2D()
        result := ComCall(10, this, "uint", Subresource, D3D10_MAP, MapType, "uint", MapFlags, D3D10_MAPPED_TEXTURE2D.Ptr, pMappedTex2D, "HRESULT")
        return pMappedTex2D
    }

    /**
     * Invalidate the pointer to the resource that was retrieved by ID3D10Texture2D::Map, and re-enable GPU access to the resource.
     * @remarks
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
     * @param {Integer} Subresource Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">Subresource</a> to be unmapped. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-d3d10calcsubresource">D3D10CalcSubresource</a> for more details.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10texture2d-unmap
     */
    Unmap(Subresource) {
        ComCall(11, this, "uint", Subresource)
    }

    /**
     * Get the properties of the texture resource. (ID3D10Texture2D.GetDesc)
     * @param {Pointer<D3D10_TEXTURE2D_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture2d_desc">D3D10_TEXTURE2D_DESC</a>*</b>
     * 
     * Pointer to a resource description (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture2d_desc">D3D10_TEXTURE2D_DESC</a>).
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d10/nf-d3d10-id3d10texture2d-getdesc
     */
    GetDesc(pDesc) {
        ComCall(12, this, D3D10_TEXTURE2D_DESC.Ptr, pDesc)
    }

    Query(iid) {
        if (ID3D10Texture2D.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Map := CallbackCreate(GetMethod(implObj, "Map"), flags, 5)
        this.vtbl.Unmap := CallbackCreate(GetMethod(implObj, "Unmap"), flags, 2)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Map)
        CallbackFree(this.vtbl.Unmap)
        CallbackFree(this.vtbl.GetDesc)
    }
}
