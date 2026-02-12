#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DSurface9.ahk
#Include .\IDirect3DBaseTexture9.ahk

/**
 * The IDirect3DCubeTexture9 (d3d9.h) interface applications use the methods of the IDirect3DCubeTexture9 interface to manipulate a cube texture resource.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d9/nn-d3d9-idirect3dcubetexture9
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
     * The IDirect3DCubeTexture9::GetLevelDesc method (d3d9.h) retrieves a description of one face of the specified cube texture level.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsurface-desc">D3DSURFACE_DESC</a> structure contains Width and Height members, which describe the size of one face in the cube. To get the size of the entire cube, multiply six (the number of cube faces) by the product of Width and Height.
     * @param {Integer} Level Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies a level of a mipmapped cube texture.
     * @param {Pointer<D3DSURFACE_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsurface-desc">D3DSURFACE_DESC</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsurface-desc">D3DSURFACE_DESC</a> structure, describing one face of the specified cube texture level.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be: D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d9/nf-d3d9-idirect3dcubetexture9-getleveldesc
     */
    GetLevelDesc(Level, pDesc) {
        result := ComCall(17, this, "uint", Level, "ptr", pDesc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IDirect3DCubeTexture9::GetCubeMapSurface method (d3d9.h) retrieves a cube texture map surface.
     * @remarks
     * Calling this method will increase the internal reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface. Failure to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when finished using this <b>IDirect3DSurface9</b> interface results in a memory leak.
     * @param {Integer} FaceType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcubemap-faces">D3DCUBEMAP_FACES</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcubemap-faces">D3DCUBEMAP_FACES</a> enumerated type, identifying a cube map face.
     * @param {Integer} Level Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies a level of a mipmapped cube texture.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface, representing the returned cube texture map surface.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d9/nf-d3d9-idirect3dcubetexture9-getcubemapsurface
     */
    GetCubeMapSurface(FaceType, Level) {
        result := ComCall(18, this, "int", FaceType, "uint", Level, "ptr*", &ppCubeMapSurface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirect3DSurface9(ppCubeMapSurface)
    }

    /**
     * The IDirect3DCubeTexture9::LockRect method (d3d9.h) locks a rectangle on a cube texture resource.
     * @remarks
     * For performance reasons, dirty regions are only recorded for level zero of a texture. Dirty regions are automatically recorded when <b>IDirect3DCubeTexture9::LockRect</b> is called without D3DLOCK_NO_DIRTY_UPDATE or D3DLOCK_READONLY. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatetexture">IDirect3DDevice9::UpdateTexture</a> for more information.
     * 
     * Cube textures created with D3DPOOL_DEFAULT are not lockable. Cube textures created in video memory are lockable when created with <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">USAGE_DYNAMIC</a>.
     * 
     * The only lockable format for a depth-stencil texture is <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFMT_D16_LOCKABLE</a>.
     * @param {Integer} FaceType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcubemap-faces">D3DCUBEMAP_FACES</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcubemap-faces">D3DCUBEMAP_FACES</a> enumerated type, identifying a cube map face.
     * @param {Integer} Level Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies a level of a mipmapped cube texture.
     * @param {Pointer<D3DLOCKED_RECT>} pLockedRect Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlocked-rect">D3DLOCKED_RECT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlocked-rect">D3DLOCKED_RECT</a> structure, describing the region to lock.
     * @param {Pointer<RECT>} pRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to a rectangle to lock. Specified by a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure. Specifying <b>NULL</b> for this parameter expands the dirty region to cover the entire cube texture.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Combination of zero or more locking flags that describe the type of lock to perform. For this method, the valid flags are: 
     * 
     * 
     * 
     * <ul>
     * <li>D3DLOCK_DISCARD</li>
     * <li>D3DLOCK_NO_DIRTY_UPDATE</li>
     * <li>D3DLOCK_NOSYSLOCK</li>
     * <li>D3DLOCK_READONLY</li>
     * </ul>
     * You may not specify a subrect when using D3DLOCK_DISCARD. For a description of the flags, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if one or more of the arguments is invalid.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d9/nf-d3d9-idirect3dcubetexture9-lockrect
     */
    LockRect(FaceType, Level, pLockedRect, pRect, Flags) {
        result := ComCall(19, this, "int", FaceType, "uint", Level, "ptr", pLockedRect, "ptr", pRect, "uint", Flags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IDirect3DCubeTexture9::UnlockRect method (d3d9.h) unlocks a rectangle on a cube texture resource.
     * @param {Integer} FaceType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcubemap-faces">D3DCUBEMAP_FACES</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcubemap-faces">D3DCUBEMAP_FACES</a> enumerated type, identifying a cube map face.
     * @param {Integer} Level Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies a level of a mipmapped cube texture.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be: D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d9/nf-d3d9-idirect3dcubetexture9-unlockrect
     */
    UnlockRect(FaceType, Level) {
        result := ComCall(20, this, "int", FaceType, "uint", Level, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IDirect3DCubeTexture9::AddDirtyRect adds a dirty region to a cube texture resource.
     * @remarks
     * For performance reasons, dirty regions are only recorded for level zero of a texture. For sublevels, it is assumed that the corresponding (scaled) rectangle or box is also dirty. Dirty regions are automatically recorded when <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcubetexture9-lockrect">IDirect3DCubeTexture9::LockRect</a> is called without <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK_NO_DIRTY_UPDATE</a> or <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK_READONLY</a>. The destination surface of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatesurface">IDirect3DDevice9::UpdateSurface</a> is also marked dirty automatically.
     * 
     * Using <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK_NO_DIRTY_UPDATE</a> and explicitly specifying dirty regions can be used to increase the efficiency of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatetexture">IDirect3DDevice9::UpdateTexture</a>. Using this method, applications can optimize what subset of a resource is copied by specifying dirty regions on the resource. However, the dirty regions may be expanded to optimize alignment.
     * @param {Integer} FaceType Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcubemap-faces">D3DCUBEMAP_FACES</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcubemap-faces">D3DCUBEMAP_FACES</a> enumerated type, identifying the cube map face.
     * @param {Pointer<RECT>} pDirtyRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure, specifying the dirty region. Specifying <b>NULL</b> expands the dirty region to cover the entire cube texture.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be: D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d9/nf-d3d9-idirect3dcubetexture9-adddirtyrect
     */
    AddDirtyRect(FaceType, pDirtyRect) {
        result := ComCall(21, this, "int", FaceType, "ptr", pDirtyRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
