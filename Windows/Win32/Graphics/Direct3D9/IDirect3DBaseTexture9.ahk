#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DResource9.ahk

/**
 * Applications use the methods of the IDirect3DBaseTexture9 interface to manipulate texture resources including cube and volume textures.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dbasetexture9
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
     * Sets the most detailed level-of-detail for a managed texture.
     * @param {Integer} LODNew Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Most detailed level-of-detail value to set for the mipmap chain.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A DWORD value, clamped to the maximum level-of-detail value (one less than the total number of levels). Subsequent calls to this method will return the clamped value, not the level-of-detail value that was previously set.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dbasetexture9-setlod
     */
    SetLOD(LODNew) {
        result := ComCall(11, this, "uint", LODNew, "uint")
        return result
    }

    /**
     * Returns a value clamped to the maximum level-of-detail set for a managed texture (this method is not supported for an unmanaged texture).
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A DWORD value, clamped to the maximum level-of-detail value (one less than the total number of levels). Calling <b>GetLOD</b> on an unmanaged texture is not supported and will result in a <a href="/windows/desktop/direct3d9/d3derr">D3DERR</a> error code being returned.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dbasetexture9-getlod
     */
    GetLOD() {
        result := ComCall(12, this, "uint")
        return result
    }

    /**
     * Returns the number of texture levels in a multilevel texture.
     * @returns {Integer} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A <a href="/windows/desktop/WinProg/windows-data-types">DWORD</a> value that indicates the number of texture levels in a multilevel texture.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dbasetexture9-getlevelcount
     */
    GetLevelCount() {
        result := ComCall(13, this, "uint")
        return result
    }

    /**
     * Set the filter type that is used for automatically generated mipmap sublevels.
     * @param {Integer} FilterType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturefiltertype">D3DTEXTUREFILTERTYPE</a></b>
     * 
     * Filter type. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturefiltertype">D3DTEXTUREFILTERTYPE</a>. This method will fail if the filter type is invalid or not supported.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dbasetexture9-setautogenfiltertype
     */
    SetAutoGenFilterType(FilterType) {
        result := ComCall(14, this, "int", FilterType, "HRESULT")
        return result
    }

    /**
     * Get the filter type that is used for automatically generated mipmap sublevels.
     * @returns {Integer} Type: <b><a href="/windows/desktop/direct3d9/d3dtexturefiltertype">D3DTEXTUREFILTERTYPE</a></b>
     * 
     * Filter type. See <a href="/windows/desktop/direct3d9/d3dtexturefiltertype">D3DTEXTUREFILTERTYPE</a>. A texture must be created with <a href="/windows/desktop/direct3d9/d3dusage">D3DUSAGE_AUTOGENMIPMAP</a> to use this method. Any other usage value will cause this method to return D3DTEXF_NONE.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dbasetexture9-getautogenfiltertype
     */
    GetAutoGenFilterType() {
        result := ComCall(15, this, "int")
        return result
    }

    /**
     * Generate mipmap sublevels.
     * @remarks
     * 
     * An application can generate mipmap sublevels at any time by calling <b>GenerateMipSubLevels</b>. To have mipmap sublevels generated automatically at texture creation time (see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/automatic-generation-of-mipmaps">Automatic Generation of Mipmaps (Direct3D 9)</a>), specify  D3DUSAGE_AUTOGENMIPMAP during <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createtexture">CreateTexture</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createcubetexture">CreateCubeTexture</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createvolumetexture">CreateVolumeTexture</a>. For more information about usage constants, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE</a>.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dbasetexture9-generatemipsublevels
     */
    GenerateMipSubLevels() {
        ComCall(16, this)
    }
}
