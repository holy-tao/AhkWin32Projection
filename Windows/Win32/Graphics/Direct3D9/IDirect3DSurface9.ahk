#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DResource9.ahk

/**
 * The IDirect3DSurface9 (d3d9.h) interface is used by applications to query and prepare surfaces.
 * @remarks
 * The LPDIRECT3DSURFACE9 and PDIRECT3DSURFACE9 types are defined as pointers to the <b>IDirect3DSurface9</b> interface.
 *     
 * 
 *     
 * 
 * 
 * ```
 * 
 * typedef struct IDirect3DSurface9 *LPDIRECT3DSURFACE9, *PDIRECT3DSURFACE9;
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/d3d9/nn-d3d9-idirect3dsurface9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class IDirect3DSurface9 extends IDirect3DResource9{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DSurface9
     * @type {Guid}
     */
    static IID => Guid("{0cfbaf3a-9ff6-429a-99b3-a2796af8b89b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContainer", "GetDesc", "LockRect", "UnlockRect", "GetDC", "ReleaseDC"]

    /**
     * The IDirect3DSurface9::GetContainer (d3d9.h) method provides access to the parent cube texture or texture (mipmap) object.
     * @remarks
     * If the surface is created using <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createrendertarget">CreateRenderTarget</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createoffscreenplainsurface">CreateOffscreenPlainSurface</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createdepthstencilsurface">CreateDepthStencilSurface</a>, the surface is considered stand alone. In this case, <b>GetContainer</b> will return the Direct3D device used to create the surface.
     * 
     * If the call succeeds, the reference count of the container is increased by one.
     * 
     * Here's an example getting the parent texture of a mip surface.
     * 
     * 
     * ```
     * 
     *     
     * // Assumes pSurface is a valid IDirect3DSurface9 pointer
     * void *pContainer = NULL;
     * IDirect3DTexture9 *pTexture = NULL;
     * HRESULT hr = pSurface->GetContainer(IID_IDirect3DTexture9, &pContainer);
     * if (SUCCEEDED(hr) && pContainer)
     * {
     *     pTexture = (IDirect3DTexture9 *)pContainer;
     * }
     * 
     * ```
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference identifier of the container being requested.
     * @param {Pointer<Pointer<Void>>} ppContainer Type: <b>void**</b>
     * 
     * Address of a pointer to fill with the container pointer if the query succeeds. See Remarks.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dsurface9-getcontainer
     */
    GetContainer(riid, ppContainer) {
        ppContainerMarshal := ppContainer is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", riid, ppContainerMarshal, ppContainer, "HRESULT")
        return result
    }

    /**
     * The IDirect3DSurface9::GetDesc (d3d9.h) method retrieves a description of the surface.
     * @param {Pointer<D3DSURFACE_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsurface-desc">D3DSURFACE_DESC</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsurface-desc">D3DSURFACE_DESC</a> structure, describing the surface.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     * 
     * D3DERR_INVALIDCALL is returned if the argument is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dsurface9-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(12, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * The IDirect3DSurface9::LockRect (d3d9.h) method locks a rectangle on a surface.
     * @remarks
     * If the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK_DONOTWAIT</a> flag is specified and the driver cannot lock the surface immediately, <b>IDirect3DSurface9::LockRect</b> will return D3DERR_WASSTILLDRAWING so that an application can use the CPU cycles while waiting for the driver to lock the surface.
     * 
     * The only lockable format for a depth-stencil surface is D3DFMT_D16_LOCKABLE. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a>.
     * 
     * For performance reasons, dirty regions are recorded only for level zero of a texture. Dirty regions are automatically recorded when <b>IDirect3DSurface9::LockRect</b> is called without <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK_NO_DIRTY_UPDATE</a>    or D3DLOCK_READONLY. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatetexture">IDirect3DDevice9::UpdateTexture</a> for more information.
     * 
     * A multisample back buffer cannot be locked.
     * 
     * This method cannot retrieve data from a surface that is is contained by a texture resource created with <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dusage">D3DUSAGE_RENDERTARGET</a> because such a texture must be assigned to D3DPOOL_DEFAULT memory and is therefore not lockable. In this case, use instead <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-getrendertargetdata">IDirect3DDevice9::GetRenderTargetData</a> to copy texture data from device memory to system memory.
     * @param {Pointer<D3DLOCKED_RECT>} pLockedRect Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlocked-rect">D3DLOCKED_RECT</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlocked-rect">D3DLOCKED_RECT</a> structure that describes the locked region.
     * @param {Pointer<RECT>} pRect Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * Pointer to a rectangle to lock. Specified by a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure. Specifying <b>NULL</b> for this parameter expands the dirty region to cover the entire surface.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Combination of zero or more locking flags that describe the type of lock to perform. For this method, the valid flags are: 
     *     
     * 
     * 
     * <ul>
     * <li>D3DLOCK_DISCARD</li>
     * <li>D3DLOCK_DONOTWAIT</li>
     * <li>D3DLOCK_NO_DIRTY_UPDATE</li>
     * <li>D3DLOCK_NOSYSLOCK</li>
     * <li>D3DLOCK_READONLY</li>
     * </ul>
     * You may not specify a subrect when using D3DLOCK_DISCARD. For a description of the flags, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dlock">D3DLOCK</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     * 
     * If the method fails, the return value can be D3DERR_INVALIDCALL or D3DERR_WASSTILLDRAWING.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dsurface9-lockrect
     */
    LockRect(pLockedRect, pRect, Flags) {
        result := ComCall(13, this, "ptr", pLockedRect, "ptr", pRect, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * The IDirect3DSurface9::UnlockRect (d3d9.h) method unlocks a rectangle on a surface.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dsurface9-unlockrect
     */
    UnlockRect() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * The IDirect3DSurface9::GetDC (d3d9.h) method retrieves a device context.
     * @remarks
     * The following restrictions apply.
     * 
     * <ul>
     * <li><b>IDirect3DSurface9::GetDC</b> is valid on the following formats only: D3DFMT_R5G6B5, D3DFMT_X1R5G5B5, D3DFMT_R8G8B8, and D3DFMT_X8R8G8B8. Formats that contain Alpha are not supported because the GDI implementations don't have a well-defined behavior on the alpha channel. For more information about formats, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFORMAT</a>.</li>
     * <li>Only one device context per surface can be returned at a time.</li>
     * <li><b>IDirect3DSurface9::GetDC</b> will fail if the surface is already locked. If the surface is a member of a mipmap or cubemap, <b>IDirect3DSurface9::GetDC</b> fails if any other mipmap or cubemap member is locked.</li>
     * <li><b>IDirect3DSurface9::GetDC</b> fails on render targets unless they were created lockable (or, in the case of back buffers, with the D3DPRESENTFLAG_LOCKABLE_BACKBUFFER flag).</li>
     * <li>For surfaces not created with <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-createoffscreenplainsurface">IDirect3DDevice9::CreateOffscreenPlainSurface</a>, <b>IDirect3DSurface9::GetDC</b> will fail on default pool (D3DPOOL_DEFAULT) surfaces unless they are dynamic (D3DUSAGE_DYNAMIC) or are lockable render targets.</li>
     * <li><b>IDirect3DSurface9::GetDC</b> will fail on D3DPOOL_SCRATCH surfaces.</li>
     * </ul>
     * When a device context is outstanding on a surface, the application may not call these methods:
     * 
     * <table>
     * <tr>
     * <td>IDirect3DCubeTexture9</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3dcubetexture9-lockrect">IDirect3DCubeTexture9::LockRect</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IDirect3DDevice9</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-colorfill">IDirect3DDevice9::ColorFill</a>
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-stretchrect">IDirect3DDevice9::StretchRect</a>
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatesurface">IDirect3DDevice9::UpdateSurface</a>
     * </td>
     * </tr>
     * <tr>
     * <td></td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatetexture">IDirect3DDevice9::UpdateTexture</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IDirect3DSurface9</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dsurface9-lockrect">IDirect3DSurface9::LockRect</a>
     * </td>
     * </tr>
     * <tr>
     * <td>IDirect3DSwapChain9</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dswapchain9-present">IDirect3DSwapChain9::Present</a> *</td>
     * </tr>
     * <tr>
     * <td>IDirect3DTexture9</td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dtexture9-lockrect">IDirect3DTexture9::LockRect</a>
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * * (on a swap chain that contains the surface)
     * 
     * <b>IDirect3DSurface9::GetDC</b> causes an implicit lock; do not retain the device context for later use. Call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dsurface9-releasedc">IDirect3DSurface9::ReleaseDC</a> to release it.	
     * 
     * It is valid to call <b>IDirect3DSurface9::GetDC</b>/<a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dsurface9-releasedc">IDirect3DSurface9::ReleaseDC</a> on levels of a mipmap or cubemap, however, these calls will be slow to all miplevels except the topmost level, and GDI operations to these miplevels will not be accelerated.
     * 
     * The hdc provides access to Win32 and GDI functionality.
     * @param {Pointer<HDC>} phdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a>*</b>
     * 
     * Pointer to the device context for the surface.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if the argument is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dsurface9-getdc
     */
    GetDC(phdc) {
        result := ComCall(15, this, "ptr", phdc, "HRESULT")
        return result
    }

    /**
     * The IDirect3DSurface9::ReleaseDC (d3d9.h) method releases a device context handle.
     * @remarks
     * An hdc is a Windows resource. It must be released after use so Windows can return it to the pool of available resources.
     * 
     * This method will release only the device context returned by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3dsurface9-getdc">IDirect3DSurface9::GetDC</a>. Otherwise, this method will fail.
     * @param {HDC} hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * Handle to a device context.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if the argument is invalid.
     * @see https://learn.microsoft.com/windows/win32/api/d3d9/nf-d3d9-idirect3dsurface9-releasedc
     */
    ReleaseDC(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(16, this, "ptr", hdc, "HRESULT")
        return result
    }
}
