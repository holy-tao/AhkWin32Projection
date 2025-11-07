#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DSurface9.ahk
#Include .\IDirect3DBaseTexture9.ahk

/**
 * Applications use the methods of the IDirect3DCubeTexture9 interface to manipulate a cube texture resource.
 * @remarks
 * 
  * The <b>IDirect3DCubeTexture9</b> interface can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createcubetexture">IDirect3DDevice9::CreateCubeTexture</a> method or one of the D3DXCreateCubeTexture<i>xxx</i> functions.
  * 
  * This interface inherits additional functionality from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dbasetexture9">IDirect3DBaseTexture9</a> interface.
  * 
  * This interface, like all COM interfaces, inherits additional functionality from the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface.
  * 
  * The LPDIRECT3DCUBETEXTURE9 and PDIRECT3DCubeTexture9 types are defined as pointers to the <b>IDirect3DCubeTexture9</b> interface.
  *     
  * 
  *     
  * 
  * 
  * ```
  * 
  * typedef struct IDirect3DCubeTexture9 *LPDIRECT3DCUBETEXTURE9, *PDIRECT3DCubeTexture9;
  * 
  * ```
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dcubetexture9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DCubeTexture9 extends IDirect3DBaseTexture9{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DCubeTexture9
     * @type {Guid}
     */
    static IID => Guid("{fff32f81-d953-473a-9223-93d652aba93f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLevelDesc", "GetCubeMapSurface", "LockRect", "UnlockRect", "AddDirtyRect"]

    /**
     * 
     * @param {Integer} Level 
     * @param {Pointer<D3DSURFACE_DESC>} pDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcubetexture9-getleveldesc
     */
    GetLevelDesc(Level, pDesc) {
        result := ComCall(17, this, "uint", Level, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FaceType 
     * @param {Integer} Level 
     * @returns {IDirect3DSurface9} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcubetexture9-getcubemapsurface
     */
    GetCubeMapSurface(FaceType, Level) {
        result := ComCall(18, this, "int", FaceType, "uint", Level, "ptr*", &ppCubeMapSurface := 0, "HRESULT")
        return IDirect3DSurface9(ppCubeMapSurface)
    }

    /**
     * 
     * @param {Integer} FaceType 
     * @param {Integer} Level 
     * @param {Pointer<D3DLOCKED_RECT>} pLockedRect 
     * @param {Pointer<RECT>} pRect 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcubetexture9-lockrect
     */
    LockRect(FaceType, Level, pLockedRect, pRect, Flags) {
        result := ComCall(19, this, "int", FaceType, "uint", Level, "ptr", pLockedRect, "ptr", pRect, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FaceType 
     * @param {Integer} Level 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcubetexture9-unlockrect
     */
    UnlockRect(FaceType, Level) {
        result := ComCall(20, this, "int", FaceType, "uint", Level, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} FaceType 
     * @param {Pointer<RECT>} pDirtyRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dcubetexture9-adddirtyrect
     */
    AddDirtyRect(FaceType, pDirtyRect) {
        result := ComCall(21, this, "int", FaceType, "ptr", pDirtyRect, "HRESULT")
        return result
    }
}
