#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DResource9.ahk

/**
 * The IDirect3DBaseTexture9 (d3d9.h) interface applications use the methods of the IDirect3DBaseTexture9 interface to manipulate texture resources.
 * @remarks
 * The <b>IDirect3DBaseTexture9</b> interface assigned to a particular stage for a device is obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-gettexture">GetTexture</a> method.
 * 
 * The LPDIRECT3DBASETEXTURE9 and PDIRECT3DBASETEXTURE9 types are defined as pointers to the <b>IDirect3DBaseTexture9</b> interface.
 * 
 * 
 * 
 * 
 * 
 * ```
 * typedef struct IDirect3DBaseTexture9 *LPDIRECT3DBASETEXTURE9, *PDIRECT3DBASETEXTURE9;
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nn-d3d9-idirect3dbasetexture9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DBaseTexture9 extends IDirect3DResource9{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DBaseTexture9
     * @type {Guid}
     */
    static IID => Guid("{580ca87e-1d3c-4d54-991d-b7d3e3c298ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLOD", "GetLOD", "GetLevelCount", "SetAutoGenFilterType", "GetAutoGenFilterType", "GenerateMipSubLevels"]

    /**
     * The IDirect3DBaseTexture9::SetLOD sets the most detailed level-of-detail for a managed texture.
     * @remarks
     * This method applies to the following interfaces, which inherit from <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a>.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dcubetexture9">IDirect3DCubeTexture9</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dtexture9">IDirect3DTexture9</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvolumetexture9">IDirect3DVolumeTexture9</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dresource9">IDirect3DResource9</a>
     * </li>
     * </ul>
     * <b>SetLOD</b> is used for level-of-detail control of managed textures. This method returns 0 on nonmanaged textures.
     * 
     * <b>SetLOD</b> communicates to the Direct3D texture manager the most detailed mipmap in the chain that should be loaded into local video memory. For example, in a five-level mipmap chain, setting LODNew to 2 indicates that the texture manager should load only mipmap levels 2 through 4 into local video memory at any given time. 
     * 
     * More specifically, if the texture was created with the dimensions of 256x256, setting the most detailed level to 0 indicates that 256 x 256 is the largest mipmap available, setting the most detailed level to 1 indicates that 128 x 128 is the largest mipmap available, and so on, up to the most detailed mip level (the smallest texture size) for the chain.
     * @param {Integer} LODNew Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Most detailed level-of-detail value to set for the mipmap chain.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A DWORD value, clamped to the maximum level-of-detail value (one less than the total number of levels). Subsequent calls to this method will return the clamped value, not the level-of-detail value that was previously set.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dbasetexture9-setlod
     */
    SetLOD(LODNew) {
        result := ComCall(11, this, "uint", LODNew, "uint")
        return result
    }

    /**
     * The IDirect3DBaseTexture9::GetLOD method (d3d9helper.h) returns a value clamped to the maximum level-of-detail set for a managed texture.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A DWORD value, clamped to the maximum level-of-detail value (one less than the total number of levels). Calling <b>GetLOD</b> on an unmanaged texture is not supported and will result in a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3derr">D3DERR</a> error code being returned.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dbasetexture9-getlod
     */
    GetLOD() {
        result := ComCall(12, this, "uint")
        return result
    }

    /**
     * The IDirect3DBaseTexture9::GetLevelCount method (d3d9helper.h) returns the number of texture levels in a multilevel texture.
     * @remarks
     * <div class="alert"><b>Warning</b>  If you create a texture with <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE_AUTOGENMIPMAP</a> to make that texture automatically generate sublevels, <b>GetLevelCount</b> always returns 1 for the number of levels.</div>
     * <div> </div>
     * This method applies to the following interfaces, which inherit from <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a>.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dcubetexture9">IDirect3DCubeTexture9</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dtexture9">IDirect3DTexture9</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dvolumetexture9">IDirect3DVolumeTexture9</a>
     * </li>
     * </ul>
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a> value that indicates the number of texture levels in a multilevel texture.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dbasetexture9-getlevelcount
     */
    GetLevelCount() {
        result := ComCall(13, this, "uint")
        return result
    }

    /**
     * The IDirect3DBaseTexture9::SetAutoGenFilterType method (d3d9helper.h) sets the filter type that is used for automatically generated mipmap sublevels.
     * @remarks
     * Changing the filter type "dirties" the mipmap sublevels and causes them to be regenerated.
     * 
     * The (default) filter type set at texture creation time is D3DTEXF_LINEAR. If the driver does not support a linear filter, the filter type will be set to D3DTEXF_POINT. All filter types supported by the driver for regular texture filtering are supported for autogeneration except D3DTEXF_NONE. <b>SetAutoGenFilterType</b> will fail unless the driver sets the appropriate D3DPTFILTERCAPS_MINFxxx caps. These values are specified in the TextureFilterCaps and/or  CubeTextureFilterCaps members of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dcaps9">D3DCAPS9</a>. 
     *     
     * For more information about texture filter types, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturefiltertype">D3DTEXTUREFILTERTYPE</a>.
     * 
     * This method has no effect if the texture is not created with D3DUSAGE_AUTOGENMIPMAP. In this case, no failure is returned. For more information about usage constants, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a>.
     * @param {Integer} _FilterType 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dbasetexture9-setautogenfiltertype
     */
    SetAutoGenFilterType(_FilterType) {
        result := ComCall(14, this, "int", _FilterType, "HRESULT")
        return result
    }

    /**
     * The IDirect3DBaseTexture9::GetAutoGenFilterType method (d3d9helper.h) gets the filter type that is used for automatically generated mipmap sublevels.
     * @remarks
     * Changing the filter type "dirties" the mipmap sublevels and causes them to be regenerated.
     * 
     * The (default) filter type set at texture creation time is D3DTEXF_LINEAR. If the driver doesn't support a linear filter, the filter type will be set to D3DTEXF_POINT. All filter types supported by the driver for regular texture filtering are supported for autogeneration except D3DTEXF_NONE. For each resource type, drivers should support all the filter types reported in the corresponding texture, CubeTexture, and volumetexture filter caps. For more information about texture types, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturefiltertype">D3DTEXTUREFILTERTYPE</a>.
     * 
     * This method has no effect if the texture is not created with <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE_AUTOGENMIPMAP</a>.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturefiltertype">D3DTEXTUREFILTERTYPE</a></b>
     * 
     * Filter type. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturefiltertype">D3DTEXTUREFILTERTYPE</a>. A texture must be created with <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE_AUTOGENMIPMAP</a> to use this method. Any other usage value will cause this method to return D3DTEXF_NONE.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dbasetexture9-getautogenfiltertype
     */
    GetAutoGenFilterType() {
        result := ComCall(15, this, "int")
        return result
    }

    /**
     * The IDirect3DBaseTexture9::GenerateMipSubLevels method (d3d9helper.h) generates mipmap sublevels.
     * @remarks
     * An application can generate mipmap sublevels at any time by calling <b>GenerateMipSubLevels</b>. To have mipmap sublevels generated automatically at texture creation time (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/automatic-generation-of-mipmaps">Automatic Generation of Mipmaps (Direct3D 9)</a>), specify  D3DUSAGE_AUTOGENMIPMAP during <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createtexture">CreateTexture</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createcubetexture">CreateCubeTexture</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createvolumetexture">CreateVolumeTexture</a>. For more information about usage constants, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dbasetexture9-generatemipsublevels
     */
    GenerateMipSubLevels() {
        ComCall(16, this)
    }
}
