#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DBaseTexture9.ahk

/**
 * Applications use the methods of the IDirect3DTexture9 interface to manipulate a texture resource.
 * @remarks
 * 
  * The <b>IDirect3DTexture9</b> interface can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createtexture">IDirect3DDevice9::CreateTexture</a> method or one of the D3DXCreateTexture<i>xxx</i> functions.
  * 
  * This interface inherits additional functionality from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a> interface.
  * 
  * This interface, like all COM interfaces, inherits from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
  * 
  * The LPDIRECT3DTEXTURE9 and PDIRECT3DTEXTURE9 types are defined as pointers to the <b>IDirect3DTexture9</b> interface.
  *     
  * 
  *     
  * 
  * 
  * ```
  * 
  * typedef struct IDirect3DTexture9 *LPDIRECT3DTEXTURE9, *PDIRECT3DTEXTURE9;
  * 
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dtexture9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DTexture9 extends IDirect3DBaseTexture9{
    /**
     * The interface identifier for IDirect3DTexture9
     * @type {Guid}
     */
    static IID => Guid("{85c31227-3de5-4f00-9b3a-f11ac38c18b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * 
     * @param {Integer} Level 
     * @param {Pointer<D3DSURFACE_DESC>} pDesc 
     * @returns {HRESULT} 
     */
    GetLevelDesc(Level, pDesc) {
        result := ComCall(17, this, "uint", Level, "ptr", pDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Level 
     * @param {Pointer<IDirect3DSurface9>} ppSurfaceLevel 
     * @returns {HRESULT} 
     */
    GetSurfaceLevel(Level, ppSurfaceLevel) {
        result := ComCall(18, this, "uint", Level, "ptr", ppSurfaceLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Level 
     * @param {Pointer<D3DLOCKED_RECT>} pLockedRect 
     * @param {Pointer<RECT>} pRect 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    LockRect(Level, pLockedRect, pRect, Flags) {
        result := ComCall(19, this, "uint", Level, "ptr", pLockedRect, "ptr", pRect, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Level 
     * @returns {HRESULT} 
     */
    UnlockRect(Level) {
        result := ComCall(20, this, "uint", Level, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pDirtyRect 
     * @returns {HRESULT} 
     */
    AddDirtyRect(pDirtyRect) {
        result := ComCall(21, this, "ptr", pDirtyRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
