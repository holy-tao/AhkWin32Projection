#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDirectDrawSurface3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawSurface3
     * @type {Guid}
     */
    static IID => Guid("{da044e00-69b2-11d0-a1d5-00aa00b8dfbb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddAttachedSurface", "AddOverlayDirtyRect", "Blt", "BltBatch", "BltFast", "DeleteAttachedSurface", "EnumAttachedSurfaces", "EnumOverlayZOrders", "Flip", "GetAttachedSurface", "GetBltStatus", "GetCaps", "GetClipper", "GetColorKey", "GetDC", "GetFlipStatus", "GetOverlayPosition", "GetPalette", "GetPixelFormat", "GetSurfaceDesc", "Initialize", "IsLost", "Lock", "ReleaseDC", "Restore", "SetClipper", "SetColorKey", "SetOverlayPosition", "SetPalette", "Unlock", "UpdateOverlay", "UpdateOverlayDisplay", "UpdateOverlayZOrder", "GetDDInterface", "PageLock", "PageUnlock", "SetSurfaceDesc"]

    /**
     * 
     * @param {IDirectDrawSurface3} param0 
     * @returns {HRESULT} 
     */
    AddAttachedSurface(param0) {
        result := ComCall(3, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} param0 
     * @returns {HRESULT} 
     */
    AddOverlayDirtyRect(param0) {
        result := ComCall(4, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} param0 
     * @param {IDirectDrawSurface3} param1 
     * @param {Pointer<RECT>} param2 
     * @param {Integer} param3 
     * @param {Pointer<DDBLTFX>} param4 
     * @returns {HRESULT} 
     */
    Blt(param0, param1, param2, param3, param4) {
        result := ComCall(5, this, "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, "ptr", param4, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDBLTBATCH>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    BltBatch(param0, param1, param2) {
        result := ComCall(6, this, "ptr", param0, "uint", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {IDirectDrawSurface3} param2 
     * @param {Pointer<RECT>} param3 
     * @param {Integer} param4 
     * @returns {HRESULT} 
     */
    BltFast(param0, param1, param2, param3, param4) {
        result := ComCall(7, this, "uint", param0, "uint", param1, "ptr", param2, "ptr", param3, "uint", param4, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {IDirectDrawSurface3} param1 
     * @returns {HRESULT} 
     */
    DeleteAttachedSurface(param0, param1) {
        result := ComCall(8, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<LPDDENUMSURFACESCALLBACK>} param1 
     * @returns {HRESULT} 
     */
    EnumAttachedSurfaces(param0, param1) {
        result := ComCall(9, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<Void>} param1 
     * @param {Pointer<LPDDENUMSURFACESCALLBACK>} param2 
     * @returns {HRESULT} 
     */
    EnumOverlayZOrders(param0, param1, param2) {
        result := ComCall(10, this, "uint", param0, "ptr", param1, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDrawSurface3} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    Flip(param0, param1) {
        result := ComCall(11, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSCAPS>} param0 
     * @param {Pointer<IDirectDrawSurface3>} param1 
     * @returns {HRESULT} 
     */
    GetAttachedSurface(param0, param1) {
        result := ComCall(12, this, "ptr", param0, "ptr*", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     */
    GetBltStatus(param0) {
        result := ComCall(13, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSCAPS>} param0 
     * @returns {HRESULT} 
     */
    GetCaps(param0) {
        result := ComCall(14, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDrawClipper>} param0 
     * @returns {HRESULT} 
     */
    GetClipper(param0) {
        result := ComCall(15, this, "ptr*", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DDCOLORKEY>} param1 
     * @returns {HRESULT} 
     */
    GetColorKey(param0, param1) {
        result := ComCall(16, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * The GetDC function retrieves a handle to a device context (DC) for the client area of a specified window or for the entire screen.
     * @param {Pointer<HDC>} param0 
     * @returns {HRESULT} If the function succeeds, the return value is a handle to the DC for the specified window's client area.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getdc
     */
    GetDC(param0) {
        result := ComCall(17, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     */
    GetFlipStatus(param0) {
        result := ComCall(18, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {HRESULT} 
     */
    GetOverlayPosition(param0, param1) {
        result := ComCall(19, this, "int*", param0, "int*", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDrawPalette>} param0 
     * @returns {HRESULT} 
     */
    GetPalette(param0) {
        result := ComCall(20, this, "ptr*", param0, "HRESULT")
        return result
    }

    /**
     * The GetPixelFormat function obtains the index of the currently selected pixel format of the specified device context.
     * @param {Pointer<DDPIXELFORMAT>} param0 
     * @returns {HRESULT} If the function succeeds, the return value is the currently selected pixel format index of the specified device context. This is a positive, one-based index value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpixelformat
     */
    GetPixelFormat(param0) {
        result := ComCall(21, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} param0 
     * @returns {HRESULT} 
     */
    GetSurfaceDesc(param0) {
        result := ComCall(22, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IDirectDraw} param0 
     * @param {Pointer<DDSURFACEDESC>} param1 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(param0, param1) {
        result := ComCall(23, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsLost() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} param0 
     * @param {Pointer<DDSURFACEDESC>} param1 
     * @param {Integer} param2 
     * @param {HANDLE} param3 
     * @returns {HRESULT} 
     */
    Lock(param0, param1, param2, param3) {
        param3 := param3 is Win32Handle ? NumGet(param3, "ptr") : param3

        result := ComCall(25, this, "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * The ReleaseDC function releases a device context (DC), freeing it for use by other applications. The effect of the ReleaseDC function depends on the type of DC. It frees only common and window DCs. It has no effect on class or private DCs.
     * @param {HDC} param0 
     * @returns {HRESULT} The return value indicates whether the DC was released. If the DC was released, the return value is 1.
     * 
     * If the DC was not released, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-releasedc
     */
    ReleaseDC(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(26, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Restore() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDrawClipper} param0 
     * @returns {HRESULT} 
     */
    SetClipper(param0) {
        result := ComCall(28, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DDCOLORKEY>} param1 
     * @returns {HRESULT} 
     */
    SetColorKey(param0, param1) {
        result := ComCall(29, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetOverlayPosition(param0, param1) {
        result := ComCall(30, this, "int", param0, "int", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDrawPalette} param0 
     * @returns {HRESULT} 
     */
    SetPalette(param0) {
        result := ComCall(31, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @returns {HRESULT} 
     */
    Unlock(param0) {
        result := ComCall(32, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} param0 
     * @param {IDirectDrawSurface3} param1 
     * @param {Pointer<RECT>} param2 
     * @param {Integer} param3 
     * @param {Pointer<DDOVERLAYFX>} param4 
     * @returns {HRESULT} 
     */
    UpdateOverlay(param0, param1, param2, param3, param4) {
        result := ComCall(33, this, "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, "ptr", param4, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     */
    UpdateOverlayDisplay(param0) {
        result := ComCall(34, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {IDirectDrawSurface3} param1 
     * @returns {HRESULT} 
     */
    UpdateOverlayZOrder(param0, param1) {
        result := ComCall(35, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} param0 
     * @returns {HRESULT} 
     */
    GetDDInterface(param0) {
        result := ComCall(36, this, "ptr*", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     */
    PageLock(param0) {
        result := ComCall(37, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     */
    PageUnlock(param0) {
        result := ComCall(38, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetSurfaceDesc(param0, param1) {
        result := ComCall(39, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }
}
