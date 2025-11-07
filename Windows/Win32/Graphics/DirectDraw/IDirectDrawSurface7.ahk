#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectDrawSurface7.ahk
#Include .\IDirectDrawClipper.ahk
#Include .\IDirectDrawPalette.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirectDrawSurface7 interface to create DirectDrawSurface objects and work with system-level variables. This section is a reference to the methods of this interface.
 * @remarks
 * 
  * The methods of the <b>IDirectDrawSurface7</b> interface can be organized into the following groups:<table>
  * <tr>
  * <th>Group</th>
  * <th>Methods</th>
  * </tr>
  * <tr>
  * <td>Allocating memory</td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-initialize">Initialize</a>,  
  *   <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-islost">IsLost</a>,  
  * and <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-restore">Restore</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Attaching surfaces </td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-addattachedsurface">AddAttachedSurface</a>,  
  *   <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-deleteattachedsurface">DeleteAttachedSurface</a>,  
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-enumattachedsurfaces">EnumAttachedSurfaces</a>,  
  * and <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getattachedsurface">GetAttachedSurface</a>
  * </td>
  * </tr>
  * <tr>
  * <td>BitBltting</td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-blt">Blt</a>,  
  *   <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-bltbatch">BltBatch</a>,  
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-bltfast">BltFast</a>,  
  *  and  
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getbltstatus">GetBltStatus</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Color keying</td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getcolorkey">GetColorKey</a>  
  *   and <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-setcolorkey">SetColorKey</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Device contexts </td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getdc">GetDC</a>  
  *   and <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-releasedc">ReleaseDC</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Flipping</td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-flip">Flip</a>  
  *   and  
  *   <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getflipstatus">GetFlipStatus</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Locking surfaces </td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-lock">Lock</a>,  
  *   <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-pagelock">PageLock</a>,  
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-pageunlock">PageUnlock</a>,  
  * and  
  *   <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-unlock">Unlock</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Miscellaneous</td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getddinterface">GetDDInterface</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Overlays </td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-addoverlaydirtyrect">AddOverlayDirtyRect</a>,  
  *   <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-enumoverlayzorders">EnumOverlayZOrders</a>,  
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getoverlayposition">GetOverlayPosition</a>,  
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-setoverlayposition">SetOverlayPosition</a>,  
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-updateoverlay">UpdateOverlay</a>,  
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-updateoverlaydisplay">UpdateOverlayDisplay</a>,  
  * and 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-updateoverlayzorder">UpdateOverlayZOrder</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Private surface data</td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-freeprivatedata">FreePrivateData</a>, 
  *   <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getprivatedata">GetPrivateData</a>, 
  * and 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-setprivatedata">SetPrivateData</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Surface capabilities </td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getcaps">GetCaps</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Surface clipper</td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getclipper">GetClipper</a>  
  *   and 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-setclipper">SetClipper</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Surface characteristics</td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-changeuniquenessvalue">ChangeUniquenessValue</a>, 
  *   <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getpixelformat">GetPixelFormat</a>,  
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getsurfacedesc">GetSurfaceDesc</a>,  
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getuniquenessvalue">GetUniquenessValue</a>, 
  * and 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-setsurfacedesc">SetSurfaceDesc</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Surface palettes</td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getpalette">GetPalette</a>  
  *   and 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-setpalette">SetPalette</a>
  * </td>
  * </tr>
  * <tr>
  * <td>Textures</td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getlod">GetLOD</a>, 
  *   <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getpriority">GetPriority</a>, 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-setlod">SetLOD</a>, 
  * and 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-setpriority">SetPriority</a>
  * </td>
  * </tr>
  * </table>
  *  
  * 
  * 
  * 
  * The <b>IDirectDrawSurface7</b> interface extends the features of previous versions of the interface by offering methods that offer better surface management and ease of use. Many methods in this interface accept slightly different parameters than their counterparts in former versions of the interface. Wherever an <b>IDirectDrawSurface3</b> interface method might accept a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550339(v=vs.85)">DDSURFACEDESC</a> structure or an <b>IDirectDrawSurface3</b> interface, the methods in IDirectDrawSurface7 accept a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550340(v=vs.85)">DDSURFACEDESC2</a> structure or an <b>IDirectDrawSurface7</b> interface, instead.
  * 
  * 
  * 
  * Use the LPDIRECTDRAWSURFACE, LPDIRECTDRAWSURFACE2, LPDIRECTDRAWSURFACE3, LPDIRECTDRAWSURFACE4, or LPDIRECTDRAWSURFACE7 data type to declare a variable that points to various DirectDrawSurface object interfaces. The Ddraw.h header file declares these data types with the following code:
  * 
  * 
  * 
  * 
  * ```
  * 
  * typedef struct IDirectDrawSurface     FAR *LPDIRECTDRAWSURFACE;
  * typedef struct IDirectDrawSurface2    FAR *LPDIRECTDRAWSURFACE2;
  * typedef struct IDirectDrawSurface3    FAR *LPDIRECTDRAWSURFACE3;
  * typedef struct IDirectDrawSurface4    FAR *LPDIRECTDRAWSURFACE4;
  * typedef struct IDirectDrawSurface7    FAR *LPDIRECTDRAWSURFACE7;
  * 
  * ```
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ddraw/nn-ddraw-idirectdrawsurface7
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDirectDrawSurface7 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawSurface7
     * @type {Guid}
     */
    static IID => Guid("{06675a80-3b9b-11d2-b92f-00609797ea5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddAttachedSurface", "AddOverlayDirtyRect", "Blt", "BltBatch", "BltFast", "DeleteAttachedSurface", "EnumAttachedSurfaces", "EnumOverlayZOrders", "Flip", "GetAttachedSurface", "GetBltStatus", "GetCaps", "GetClipper", "GetColorKey", "GetDC", "GetFlipStatus", "GetOverlayPosition", "GetPalette", "GetPixelFormat", "GetSurfaceDesc", "Initialize", "IsLost", "Lock", "ReleaseDC", "Restore", "SetClipper", "SetColorKey", "SetOverlayPosition", "SetPalette", "Unlock", "UpdateOverlay", "UpdateOverlayDisplay", "UpdateOverlayZOrder", "GetDDInterface", "PageLock", "PageUnlock", "SetSurfaceDesc", "SetPrivateData", "GetPrivateData", "FreePrivateData", "GetUniquenessValue", "ChangeUniquenessValue", "SetPriority", "GetPriority", "SetLOD", "GetLOD"]

    /**
     * 
     * @param {IDirectDrawSurface7} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-addattachedsurface
     */
    AddAttachedSurface(param0) {
        result := ComCall(3, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-addoverlaydirtyrect
     */
    AddOverlayDirtyRect(param0) {
        result := ComCall(4, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} param0 
     * @param {IDirectDrawSurface7} param1 
     * @param {Pointer<RECT>} param2 
     * @param {Integer} param3 
     * @param {Pointer<DDBLTFX>} param4 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-blt
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
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-bltbatch
     */
    BltBatch(param0, param1, param2) {
        result := ComCall(6, this, "ptr", param0, "uint", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {IDirectDrawSurface7} param2 
     * @param {Pointer<RECT>} param3 
     * @param {Integer} param4 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-bltfast
     */
    BltFast(param0, param1, param2, param3, param4) {
        result := ComCall(7, this, "uint", param0, "uint", param1, "ptr", param2, "ptr", param3, "uint", param4, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {IDirectDrawSurface7} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-deleteattachedsurface
     */
    DeleteAttachedSurface(param0, param1) {
        result := ComCall(8, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} param0 
     * @param {Pointer<LPDDENUMSURFACESCALLBACK7>} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-enumattachedsurfaces
     */
    EnumAttachedSurfaces(param0, param1) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, param0Marshal, param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<Void>} param1 
     * @param {Pointer<LPDDENUMSURFACESCALLBACK7>} param2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-enumoverlayzorders
     */
    EnumOverlayZOrders(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "uint", param0, param1Marshal, param1, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDrawSurface7} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-flip
     */
    Flip(param0, param1) {
        result := ComCall(11, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSCAPS2>} param0 
     * @returns {IDirectDrawSurface7} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-getattachedsurface
     */
    GetAttachedSurface(param0) {
        result := ComCall(12, this, "ptr", param0, "ptr*", &param1 := 0, "HRESULT")
        return IDirectDrawSurface7(param1)
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-getbltstatus
     */
    GetBltStatus(param0) {
        result := ComCall(13, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSCAPS2>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-getcaps
     */
    GetCaps(param0) {
        result := ComCall(14, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDirectDrawClipper} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-getclipper
     */
    GetClipper() {
        result := ComCall(15, this, "ptr*", &param0 := 0, "HRESULT")
        return IDirectDrawClipper(param0)
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DDCOLORKEY>} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-getcolorkey
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
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-getflipstatus
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
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-getoverlayposition
     */
    GetOverlayPosition(param0, param1) {
        param0Marshal := param0 is VarRef ? "int*" : "ptr"
        param1Marshal := param1 is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, param0Marshal, param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDirectDrawPalette} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-getpalette
     */
    GetPalette() {
        result := ComCall(20, this, "ptr*", &param0 := 0, "HRESULT")
        return IDirectDrawPalette(param0)
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
     * @param {Pointer<DDSURFACEDESC2>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-getsurfacedesc
     */
    GetSurfaceDesc(param0) {
        result := ComCall(22, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IDirectDraw} param0 
     * @param {Pointer<DDSURFACEDESC2>} param1 
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
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-islost
     */
    IsLost() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} param0 
     * @param {Pointer<DDSURFACEDESC2>} param1 
     * @param {Integer} param2 
     * @param {HANDLE} param3 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-lock
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
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-restore
     */
    Restore() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDrawClipper} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-setclipper
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
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-setcolorkey
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
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-setoverlayposition
     */
    SetOverlayPosition(param0, param1) {
        result := ComCall(30, this, "int", param0, "int", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDrawPalette} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-setpalette
     */
    SetPalette(param0) {
        result := ComCall(31, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-unlock
     */
    Unlock(param0) {
        result := ComCall(32, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} param0 
     * @param {IDirectDrawSurface7} param1 
     * @param {Pointer<RECT>} param2 
     * @param {Integer} param3 
     * @param {Pointer<DDOVERLAYFX>} param4 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-updateoverlay
     */
    UpdateOverlay(param0, param1, param2, param3, param4) {
        result := ComCall(33, this, "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, "ptr", param4, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-updateoverlaydisplay
     */
    UpdateOverlayDisplay(param0) {
        result := ComCall(34, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {IDirectDrawSurface7} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-updateoverlayzorder
     */
    UpdateOverlayZOrder(param0, param1) {
        result := ComCall(35, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-getddinterface
     */
    GetDDInterface(param0) {
        param0Marshal := param0 is VarRef ? "ptr*" : "ptr"

        result := ComCall(36, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-pagelock
     */
    PageLock(param0) {
        result := ComCall(37, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-pageunlock
     */
    PageUnlock(param0) {
        result := ComCall(38, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC2>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-setsurfacedesc
     */
    SetSurfaceDesc(param0, param1) {
        result := ComCall(39, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<Void>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-setprivatedata
     */
    SetPrivateData(param0, param1, param2, param3) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(40, this, "ptr", param0, param1Marshal, param1, "uint", param2, "uint", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<Void>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-getprivatedata
     */
    GetPrivateData(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(41, this, "ptr", param0, param1Marshal, param1, param2Marshal, param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-freeprivatedata
     */
    FreePrivateData(param0) {
        result := ComCall(42, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-getuniquenessvalue
     */
    GetUniquenessValue(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(43, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-changeuniquenessvalue
     */
    ChangeUniquenessValue() {
        result := ComCall(44, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-setpriority
     */
    SetPriority(param0) {
        result := ComCall(45, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-getpriority
     */
    GetPriority(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(46, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-setlod
     */
    SetLOD(param0) {
        result := ComCall(47, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdrawsurface7-getlod
     */
    GetLOD(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(48, this, param0Marshal, param0, "HRESULT")
        return result
    }
}
