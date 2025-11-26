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
     * Attaches the specified z-buffer surface to this surface.
     * @param {IDirectDrawSurface7} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_CANNOTATTACHSURFACE</li>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_SURFACEALREADYATTACHED</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_WASSTILLDRAWING</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-addattachedsurface
     */
    AddAttachedSurface(param0) {
        result := ComCall(3, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * The IDirectDrawSurface7::AddOverlayDirtyRect method is not currently implemented.
     * @param {Pointer<RECT>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_INVALIDSURFACETYPE</li>
     * <li>DDERR_UNSUPPORTED</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-addoverlaydirtyrect
     */
    AddOverlayDirtyRect(param0) {
        result := ComCall(4, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Performs a bit block transfer (bitblt). This method does not support z-buffering or alpha blending during bitblt operations.
     * @param {Pointer<RECT>} param0 
     * @param {IDirectDrawSurface7} param1 
     * @param {Pointer<RECT>} param2 
     * @param {Integer} param3 
     * @param {Pointer<DDBLTFX>} param4 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDCLIPLIST</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_INVALIDRECT</li>
     * <li>DDERR_NOALPHAHW</li>
     * <li>DDERR_NOBLTHW</li>
     * <li>DDERR_NOCLIPLIST</li>
     * <li>DDERR_NODDROPSHW</li>
     * <li>DDERR_NOMIRRORHW</li>
     * <li>DDERR_NORASTEROPHW</li>
     * <li>DDERR_NOROTATIONHW</li>
     * <li>DDERR_NOSTRETCHHW</li>
     * <li>DDERR_NOZBUFFERHW</li>
     * <li>DDERR_SURFACEBUSY</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_UNSUPPORTED</li>
     * <li>DDERR_WASSTILLDRAWING</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-blt
     */
    Blt(param0, param1, param2, param3, param4) {
        result := ComCall(5, this, "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, "ptr", param4, "HRESULT")
        return result
    }

    /**
     * The IDirectDrawSurface7::BltBatch method is not currently implemented.
     * @param {Pointer<DDBLTBATCH>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDCLIPLIST</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_INVALIDRECT</li>
     * <li>DDERR_NOALPHAHW</li>
     * <li>DDERR_NOBLTHW</li>
     * <li>DDERR_NOCLIPLIST</li>
     * <li>DDERR_NODDROPSHW</li>
     * <li>DDERR_NOMIRRORHW</li>
     * <li>DDERR_NORASTEROPHW</li>
     * <li>DDERR_NOROTATIONHW</li>
     * <li>DDERR_NOSTRETCHHW</li>
     * <li>DDERR_NOZBUFFERHW</li>
     * <li>DDERR_SURFACEBUSY</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_UNSUPPORTED</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-bltbatch
     */
    BltBatch(param0, param1, param2) {
        result := ComCall(6, this, "ptr", param0, "uint", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * Performs a source copy bitblt or transparent bitblt by using a source color key or destination color key.
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {IDirectDrawSurface7} param2 
     * @param {Pointer<RECT>} param3 
     * @param {Integer} param4 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_EXCEPTION</li>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_INVALIDRECT</li>
     * <li>DDERR_NOBLTHW</li>
     * <li>DDERR_SURFACEBUSY</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_UNSUPPORTED</li>
     * <li>DDERR_WASSTILLDRAWING</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-bltfast
     */
    BltFast(param0, param1, param2, param3, param4) {
        result := ComCall(7, this, "uint", param0, "uint", param1, "ptr", param2, "ptr", param3, "uint", param4, "HRESULT")
        return result
    }

    /**
     * Detaches one or more attached surfaces.
     * @param {Integer} param0 
     * @param {IDirectDrawSurface7} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_CANNOTDETACHSURFACE</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_SURFACENOTATTACHED</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-deleteattachedsurface
     */
    DeleteAttachedSurface(param0, param1) {
        result := ComCall(8, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * Enumerates all the surfaces that are attached to this surface.
     * @param {Pointer<Void>} param0 
     * @param {Pointer<LPDDENUMSURFACESCALLBACK7>} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_SURFACELOST</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-enumattachedsurfaces
     */
    EnumAttachedSurfaces(param0, param1) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, param0Marshal, param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * Enumerates the overlay surfaces on the specified destination. You can enumerate the overlays in front-to-back or back-to-front order.
     * @param {Integer} param0 
     * @param {Pointer<Void>} param1 
     * @param {Pointer<LPDDENUMSURFACESCALLBACK7>} param2 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-enumoverlayzorders
     */
    EnumOverlayZOrders(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "uint", param0, param1Marshal, param1, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * Makes the surface memory that is associated with the DDSCAPS_BACKBUFFER surface become associated with the front-buffer surface.
     * @param {IDirectDrawSurface7} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NOFLIPHW</li>
     * <li>DDERR_NOTFLIPPABLE</li>
     * <li>DDERR_SURFACEBUSY</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_UNSUPPORTED</li>
     * <li>DDERR_WASSTILLDRAWING</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-flip
     */
    Flip(param0, param1) {
        result := ComCall(11, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * Obtains the attached surface that has the specified capabilities, and increments the reference count of the retrieved interface.
     * @param {Pointer<DDSCAPS2>} param0 
     * @returns {IDirectDrawSurface7} 
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getattachedsurface
     */
    GetAttachedSurface(param0) {
        result := ComCall(12, this, "ptr", param0, "ptr*", &param1 := 0, "HRESULT")
        return IDirectDrawSurface7(param1)
    }

    /**
     * Obtains status about a bit block transfer (bitblt) operation.
     * @param {Integer} param0 
     * @returns {HRESULT} If the method succeeds, a bitbltter is present, and the return value is DD_OK.
     * 
     * If it fails, the method returns DDERR_WASSTILLDRAWING if the bitbltter is busy, DDERR_NOBLTHW if there is no bitbltter, or one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NOBLTHW</li>
     * <li>DDERR_SURFACEBUSY</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_UNSUPPORTED</li>
     * <li>DDERR_WASSTILLDRAWING</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getbltstatus
     */
    GetBltStatus(param0) {
        result := ComCall(13, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * Retrieves the capabilities of this surface. These capabilities are not necessarily related to the capabilities of the display device.
     * @param {Pointer<DDSCAPS2>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getcaps
     */
    GetCaps(param0) {
        result := ComCall(14, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Retrieves the DirectDrawClipper object that is associated with this surface, and increments the reference count of the returned clipper.
     * @returns {IDirectDrawClipper} 
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getclipper
     */
    GetClipper() {
        result := ComCall(15, this, "ptr*", &param0 := 0, "HRESULT")
        return IDirectDrawClipper(param0)
    }

    /**
     * Retrieves the color key value for this surface.
     * @param {Integer} param0 
     * @param {Pointer<DDCOLORKEY>} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NOCOLORKEY</li>
     * <li>DDERR_NOCOLORKEYHW</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_UNSUPPORTED</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getcolorkey
     */
    GetColorKey(param0, param1) {
        result := ComCall(16, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * Creates a GDI-compatible handle of a device context for this surface.
     * @param {Pointer<HDC>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_DCALREADYCREATED</li>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_INVALIDSURFACETYPE</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_UNSUPPORTED</li>
     * <li>DDERR_WASSTILLDRAWING</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getdc
     */
    GetDC(param0) {
        result := ComCall(17, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Retrieves status about whether this surface has finished its flipping process.
     * @param {Integer} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return DDERR_WASSTILLDRAWING if the surface has not finished its flipping process, or one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_INVALIDSURFACETYPE</li>
     * <li>DDERR_SURFACEBUSY</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_UNSUPPORTED</li>
     * <li>DDERR_WASSTILLDRAWING</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getflipstatus
     */
    GetFlipStatus(param0) {
        result := ComCall(18, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * Retrieves the display coordinates of this surface. This method is used on a visible, active overlay surface (that is, a surface that has the DDSCAPS_OVERLAY flag set).
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_INVALIDPOSITION</li>
     * <li>DDERR_NOOVERLAYDEST</li>
     * <li>DDERR_NOTAOVERLAYSURFACE</li>
     * <li>DDERR_OVERLAYNOTVISIBLE</li>
     * <li>DDERR_SURFACELOST</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getoverlayposition
     */
    GetOverlayPosition(param0, param1) {
        param0Marshal := param0 is VarRef ? "int*" : "ptr"
        param1Marshal := param1 is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, param0Marshal, param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * Retrieves the DirectDrawPalette object that is associated with this surface, and increments the reference count of the returned palette.
     * @returns {IDirectDrawPalette} 
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getpalette
     */
    GetPalette() {
        result := ComCall(20, this, "ptr*", &param0 := 0, "HRESULT")
        return IDirectDrawPalette(param0)
    }

    /**
     * Retrieves the color and pixel format of this surface.
     * @param {Pointer<DDPIXELFORMAT>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_INVALIDSURFACETYPE</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getpixelformat
     */
    GetPixelFormat(param0) {
        result := ComCall(21, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Retrieves a description of this surface in its current condition.
     * @param {Pointer<DDSURFACEDESC2>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getsurfacedesc
     */
    GetSurfaceDesc(param0) {
        result := ComCall(22, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Initializes a DirectDrawSurface object.
     * @param {IDirectDraw} param0 
     * @param {Pointer<DDSURFACEDESC2>} param1 
     * @returns {HRESULT} This method returns DDERR_ALREADYINITIALIZED.
     * 
     * This method is provided for compliance with the Component Object Model (COM). Because the DirectDrawSurface object is initialized when it is created, this method always returns DDERR_ALREADYINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-initialize
     */
    Initialize(param0, param1) {
        result := ComCall(23, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * Determines whether the surface memory that is associated with a DirectDrawSurface object has been freed.
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK because the memory has not been freed.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_SURFACELOST</li>
     * </ul>
     * You can use this method to determine when you need to reallocate surface memory. When a DirectDrawSurface object loses its surface memory, most methods return DDERR_SURFACELOST and perform no other action.
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-islost
     */
    IsLost() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * Obtains a pointer to the surface memory.
     * @param {Pointer<RECT>} param0 
     * @param {Pointer<DDSURFACEDESC2>} param1 
     * @param {Integer} param2 
     * @param {HANDLE} param3 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_OUTOFMEMORY</li>
     * <li>DDERR_SURFACEBUSY</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_WASSTILLDRAWING</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-lock
     */
    Lock(param0, param1, param2, param3) {
        param3 := param3 is Win32Handle ? NumGet(param3, "ptr") : param3

        result := ComCall(25, this, "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * Releases the handle of a device context that was previously obtained by using the IDirectDrawSurface7::GetDC method.
     * @param {HDC} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_UNSUPPORTED</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-releasedc
     */
    ReleaseDC(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(26, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Restores a surface that has been lost. This occurs when the surface memory that is associated with the DirectDrawSurface object has been freed.
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_IMPLICITLYCREATED</li>
     * <li>DDERR_INCOMPATIBLEPRIMARY</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NOEXCLUSIVEMODE</li>
     * <li>DDERR_OUTOFMEMORY</li>
     * <li>DDERR_UNSUPPORTED</li>
     * <li>DDERR_WRONGMODE</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-restore
     */
    Restore() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * Attaches a clipper object to, or deletes one from, this surface.
     * @param {IDirectDrawClipper} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_INVALIDSURFACETYPE</li>
     * <li>DDERR_NOCLIPPERATTACHED</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-setclipper
     */
    SetClipper(param0) {
        result := ComCall(28, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Sets the color key value for the DirectDrawSurface object if the hardware supports color keys on a per-surface basis.
     * @param {Integer} param0 
     * @param {Pointer<DDCOLORKEY>} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_INVALIDSURFACETYPE</li>
     * <li>DDERR_NOOVERLAYHW</li>
     * <li>DDERR_NOTAOVERLAYSURFACE</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_UNSUPPORTED</li>
     * <li>DDERR_WASSTILLDRAWING</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-setcolorkey
     */
    SetColorKey(param0, param1) {
        result := ComCall(29, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * Changes the display coordinates of an overlay surface.
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_INVALIDPOSITION</li>
     * <li>DDERR_NOOVERLAYDEST</li>
     * <li>DDERR_NOTAOVERLAYSURFACE</li>
     * <li>DDERR_OVERLAYNOTVISIBLE</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_UNSUPPORTED</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-setoverlayposition
     */
    SetOverlayPosition(param0, param1) {
        result := ComCall(30, this, "int", param0, "int", param1, "HRESULT")
        return result
    }

    /**
     * Attaches a palette object to (or detaches one from) a surface. The surface uses this palette for all subsequent operations. The palette change takes place immediately, without regard to refresh timing.
     * @param {IDirectDrawPalette} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_INVALIDPIXELFORMAT</li>
     * <li>DDERR_INVALIDSURFACETYPE</li>
     * <li>DDERR_NOEXCLUSIVEMODE</li>
     * <li>DDERR_NOPALETTEATTACHED</li>
     * <li>DDERR_NOPALETTEHW</li>
     * <li>DDERR_NOT8BITCOLOR</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_UNSUPPORTED</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-setpalette
     */
    SetPalette(param0) {
        result := ComCall(31, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Notifies DirectDraw that the direct surface manipulations are complete.
     * @param {Pointer<RECT>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_INVALIDRECT</li>
     * <li>DDERR_NOTLOCKED</li>
     * <li>DDERR_SURFACELOST</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-unlock
     */
    Unlock(param0) {
        result := ComCall(32, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Repositions or modifies the visual attributes of an overlay surface. These surfaces must have the DDSCAPS_OVERLAY flag set.
     * @param {Pointer<RECT>} param0 
     * @param {IDirectDrawSurface7} param1 
     * @param {Pointer<RECT>} param2 
     * @param {Integer} param3 
     * @param {Pointer<DDOVERLAYFX>} param4 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_DEVICEDOESNTOWNSURFACE</li>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_HEIGHTALIGN</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_INVALIDRECT</li>
     * <li>DDERR_INVALIDSURFACETYPE</li>
     * <li>DDERR_NOSTRETCHHW</li>
     * <li>DDERR_NOTAOVERLAYSURFACE</li>
     * <li>DDERR_OUTOFCAPS</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_UNSUPPORTED</li>
     * <li>DDERR_XALIGN</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-updateoverlay
     */
    UpdateOverlay(param0, param1, param2, param3, param4) {
        result := ComCall(33, this, "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, "ptr", param4, "HRESULT")
        return result
    }

    /**
     * The IDirectDrawSurface7::UpdateOverlayDisplay method is not currently implemented.
     * @param {Integer} param0 
     * @returns {HRESULT} The method is not currently implemented.
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-updateoverlaydisplay
     */
    UpdateOverlayDisplay(param0) {
        result := ComCall(34, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * Sets the z-order of an overlay.
     * @param {Integer} param0 
     * @param {IDirectDrawSurface7} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NOTAOVERLAYSURFACE</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-updateoverlayzorder
     */
    UpdateOverlayZOrder(param0, param1) {
        result := ComCall(35, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * Retrieves an interface to the DirectDraw object that was used to create this surface.
     * @param {Pointer<Pointer<Void>>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getddinterface
     */
    GetDDInterface(param0) {
        param0Marshal := param0 is VarRef ? "ptr*" : "ptr"

        result := ComCall(36, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * Prevents a system-memory surface from being paged out while a bit block transfer (bitblt) operation that uses direct memory access (DMA) transfers to or from system memory is in progress.
     * @param {Integer} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_CANTPAGELOCK</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_SURFACELOST</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-pagelock
     */
    PageLock(param0) {
        result := ComCall(37, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * Unlocks a system-memory surface, which then allows it to be paged out.
     * @param {Integer} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_CANTPAGEUNLOCK</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NOTPAGELOCKED</li>
     * <li>DDERR_SURFACELOST</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-pageunlock
     */
    PageUnlock(param0) {
        result := ComCall(38, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * Sets the characteristics of an existing surface.
     * @param {Pointer<DDSURFACEDESC2>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_SURFACELOST</li>
     * <li>DDERR_SURFACEBUSY</li>
     * <li>DDERR_INVALIDSURFACETYPE</li>
     * <li>DDERR_INVALIDPIXELFORMAT</li>
     * <li>DDERR_INVALIDCAPS</li>
     * <li>DDERR_UNSUPPORTED</li>
     * <li>DDERR_GENERIC</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-setsurfacedesc
     */
    SetSurfaceDesc(param0, param1) {
        result := ComCall(39, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * Associates data with the surface that is intended for use by the application, not by DirectDraw. Data is passed by value, and multiple sets of data can be associated with a single surface.
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<Void>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_OUTOFMEMORY</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-setprivatedata
     */
    SetPrivateData(param0, param1, param2, param3) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(40, this, "ptr", param0, param1Marshal, param1, "uint", param2, "uint", param3, "HRESULT")
        return result
    }

    /**
     * Copies the private data that is associated with this surface to a provided buffer.
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<Void>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_EXPIRED</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_MOREDATA</li>
     * <li>DDERR_NOTFOUND</li>
     * <li>DDERR_OUTOFMEMORY</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getprivatedata
     */
    GetPrivateData(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(41, this, "ptr", param0, param1Marshal, param1, param2Marshal, param2, "HRESULT")
        return result
    }

    /**
     * Frees the specified private data that is associated with this surface.
     * @param {Pointer<Guid>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NOTFOUND</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-freeprivatedata
     */
    FreePrivateData(param0) {
        result := ComCall(42, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Retrieves the current uniqueness value for this surface.
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getuniquenessvalue
     */
    GetUniquenessValue(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(43, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * Manually updates the uniqueness value for this surface.
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_EXCEPTION</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-changeuniquenessvalue
     */
    ChangeUniquenessValue() {
        result := ComCall(44, this, "HRESULT")
        return result
    }

    /**
     * Assigns the texture-management priority for this texture. This method succeeds only on managed textures.
     * @param {Integer} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the return value is an error. The method returns DDERR_INVALIDOBJECT if the parameter is invalid or if the texture is not managed by Direct3D.
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-setpriority
     */
    SetPriority(param0) {
        result := ComCall(45, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * Retrieves the texture-management priority for this texture. This method succeeds only on managed textures.
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the return value is an error. The method returns DDERR_INVALIDOBJECT if the parameter is invalid or if the texture is not managed by Direct3D.
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getpriority
     */
    GetPriority(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(46, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * Sets the maximum level of detail (LOD) for a managed mipmap surface. This method succeeds only on managed textures.
     * @param {Integer} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-setlod
     */
    SetLOD(param0) {
        result := ComCall(47, this, "uint", param0, "HRESULT")
        return result
    }

    /**
     * Retrieves the maximum level of detail (LOD) currently set for a managed mipmap surface. This method succeeds only on managed textures.
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdrawsurface7-getlod
     */
    GetLOD(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(48, this, param0Marshal, param0, "HRESULT")
        return result
    }
}
