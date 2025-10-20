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
     * 
     * @param {Integer} LODNew 
     * @returns {Integer} 
     */
    SetLOD(LODNew) {
        result := ComCall(11, this, "uint", LODNew, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLOD() {
        result := ComCall(12, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLevelCount() {
        result := ComCall(13, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} FilterType 
     * @returns {HRESULT} 
     */
    SetAutoGenFilterType(FilterType) {
        result := ComCall(14, this, "int", FilterType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAutoGenFilterType() {
        result := ComCall(15, this, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    GenerateMipSubLevels() {
        ComCall(16, this)
        return result
    }
}
