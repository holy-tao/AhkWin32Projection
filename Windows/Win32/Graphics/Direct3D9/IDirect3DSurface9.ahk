#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirect3DResource9.ahk

/**
 * Applications use the methods of the IDirect3DSurface9 interface to query and prepare surfaces.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nn-d3d9helper-idirect3dsurface9
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
     * Provides access to the parent cube texture or texture (mipmap) object, if this surface is a child level of a cube texture or a mipmap. This method can also provide access to the parent swap chain if the surface is a back-buffer child.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference identifier of the container being requested.
     * @param {Pointer<Pointer<Void>>} ppContainer Type: <b>void**</b>
     * 
     * Address of a pointer to fill with the container pointer if the query succeeds. See Remarks.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dsurface9-getcontainer
     */
    GetContainer(riid, ppContainer) {
        ppContainerMarshal := ppContainer is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "ptr", riid, ppContainerMarshal, ppContainer, "HRESULT")
        return result
    }

    /**
     * Retrieves a description of the surface.
     * @param {Pointer<D3DSURFACE_DESC>} pDesc Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsurface-desc">D3DSURFACE_DESC</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dsurface-desc">D3DSURFACE_DESC</a> structure, describing the surface.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     * 
     * D3DERR_INVALIDCALL is returned if the argument is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dsurface9-getdesc
     */
    GetDesc(pDesc) {
        result := ComCall(12, this, "ptr", pDesc, "HRESULT")
        return result
    }

    /**
     * Locks a rectangle on a surface.
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
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK.
     * 
     * If the method fails, the return value can be D3DERR_INVALIDCALL or D3DERR_WASSTILLDRAWING.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dsurface9-lockrect
     */
    LockRect(pLockedRect, pRect, Flags) {
        result := ComCall(13, this, "ptr", pLockedRect, "ptr", pRect, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Unlocks a rectangle on a surface.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. If the method fails, the return value can be D3DERR_INVALIDCALL.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dsurface9-unlockrect
     */
    UnlockRect() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a device context.
     * @param {Pointer<HDC>} phdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a>*</b>
     * 
     * Pointer to the device context for the surface.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if the argument is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dsurface9-getdc
     */
    GetDC(phdc) {
        result := ComCall(15, this, "ptr", phdc, "HRESULT")
        return result
    }

    /**
     * Release a device context handle.
     * @param {HDC} hdc Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a></b>
     * 
     * Handle to a device context.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If the method succeeds, the return value is D3D_OK. D3DERR_INVALIDCALL is returned if the argument is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-idirect3dsurface9-releasedc
     */
    ReleaseDC(hdc) {
        hdc := hdc is Win32Handle ? NumGet(hdc, "ptr") : hdc

        result := ComCall(16, this, "ptr", hdc, "HRESULT")
        return result
    }
}
