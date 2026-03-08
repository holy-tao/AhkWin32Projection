#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DSurface9.ahk
#Include .\IDirect3DBaseTexture9.ahk

/**
 * The IDirect3DTexture9 (d3d9.h) interface is used by applications to manipulate a texture resource.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nn-d3d9-idirect3dtexture9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DTexture9 extends IDirect3DBaseTexture9{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLevelDesc", "GetSurfaceLevel", "LockRect", "UnlockRect", "AddDirtyRect"]

    /**
     * The IDirect3DTexture9::GetLevelDesc (d3d9.h) method retrieves a level description of a texture resource.
     * @param {Integer} Level Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Identifies a level of the texture resource. This method returns a surface description for the level specified by this parameter.
     * @param {Pointer<D3DSURFACE_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsurface-desc">D3DSURFACE_DESC</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsurface-desc">D3DSURFACE_DESC</a> structure, describing the returned level.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if one of the arguments is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dtexture9-getleveldesc
     */
    GetLevelDesc(Level, pDesc) {
        result := ComCall(17, this, "uint", Level, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * The IDirect3DTexture9::GetSurfaceLevel (d3d9.h) method retrieves the specified texture surface level.
     * @remarks
     * Calling this method will increase the internal reference count on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface. Failure to call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> when finished using this <b>IDirect3DSurface9</b> interface results in a memory leak.
     * @param {Integer} Level Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Identifies a level of the texture resource. This method returns a surface for the level specified by this parameter. The top-level surface is denoted by 0.
     * @returns {IDirect3DSurface9} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a>**</b>
     * 
     * Address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface, representing the returned surface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dtexture9-getsurfacelevel
     */
    GetSurfaceLevel(Level) {
        result := ComCall(18, this, "uint", Level, "ptr*", &ppSurfaceLevel := 0, "HRESULT")
        return IDirect3DSurface9(ppSurfaceLevel)
    }

    /**
     * The IDirect3DTexture9::LockRect (d3d9.h) method locks a rectangle on a texture resource.
     * @remarks
     * Textures created with D3DPOOL_DEFAULT are not lockable. Textures created in video memory are lockable when created with <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">USAGE_DYNAMIC</a>.
     * 
     * For performance reasons, dirty regions are recorded only for level zero of a texture. Dirty regions are automatically recorded when <b>IDirect3DTexture9::LockRect</b> is called without <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK_NO_DIRTY_UPDATE</a>    or D3DLOCK_READONLY. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatetexture">IDirect3DDevice9::UpdateTexture</a> for more information.
     * 
     * The only lockable format for a depth-stencil texture is <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK_D16_LOCKABLE</a>.
     * 
     * Video memory textures cannot be locked, but must be modified by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatesurface">IDirect3DDevice9::UpdateSurface</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatetexture">IDirect3DDevice9::UpdateTexture</a>. There are exceptions for some proprietary driver pixel formats that Direct3D 9 does not recognize. These can be locked.
     * 
     * This method cannot retrieve data from a texture resource created with <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE_RENDERTARGET</a> because such a texture must be assigned to D3DPOOL_DEFAULT memory and is therefore not lockable. In this case, use instead <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-getrendertargetdata">IDirect3DDevice9::GetRenderTargetData</a> to copy texture data from device memory to system memory.
     * @param {Integer} Level Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the level of the texture resource to lock.
     * @param {Pointer<D3DLOCKED_RECT>} pLockedRect Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlocked-rect">D3DLOCKED_RECT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlocked-rect">D3DLOCKED_RECT</a> structure, describing the locked region.
     * @param {Pointer<RECT>} pRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to a rectangle to lock. Specified by a pointer to a RECT structure. Specifying <b>NULL</b> for this parameter expands the dirty region to cover the entire texture.
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
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dtexture9-lockrect
     */
    LockRect(Level, pLockedRect, pRect, Flags) {
        result := ComCall(19, this, "uint", Level, "ptr", pLockedRect, "ptr", pRect, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * The IDirect3DTexture9::UnlockRect (d3d9.h) method unlocks a rectangle on a texture resource.
     * @param {Integer} Level Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the level of the texture resource to unlock.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dtexture9-unlockrect
     */
    UnlockRect(Level) {
        result := ComCall(20, this, "uint", Level, "HRESULT")
        return result
    }

    /**
     * The IDirect3DTexture9::AddDirtyRect (d3d9.h) method adds a dirty region to a texture resource.
     * @remarks
     * For performance reasons, dirty regions are only recorded for level zero of a texture. For sublevels, it is assumed that the corresponding (scaled) rectangle or box is also dirty. Dirty regions are automatically recorded when <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dtexture9-lockrect">IDirect3DTexture9::LockRect</a> is called without <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK_NO_DIRTY_UPDATE</a> or <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK_READONLY</a>. The destination surface of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatesurface">IDirect3DDevice9::UpdateSurface</a> is also marked dirty automatically.
     * 
     * Using <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK_NO_DIRTY_UPDATE</a> and explicitly specifying dirty regions can be used to increase the efficiency of <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatetexture">IDirect3DDevice9::UpdateTexture</a>. Using this method, applications can optimize what subset of a resource is copied by specifying dirty regions on the resource. However, the dirty regions may be expanded to optimize alignment.
     * @param {Pointer<RECT>} pDirtyRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure, specifying the dirty region to add. Specifying <b>NULL</b> expands the dirty region to cover the entire texture.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dtexture9-adddirtyrect
     */
    AddDirtyRect(pDirtyRect) {
        result := ComCall(21, this, "ptr", pDirtyRect, "HRESULT")
        return result
    }
}
