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
 * The <b>IDirectDrawSurface7</b> interface extends the features of previous versions of the interface by offering methods that offer better surface management and ease of use. Many methods in this interface accept slightly different parameters than their counterparts in former versions of the interface. Wherever an <b>IDirectDrawSurface3</b> interface method might accept a <a href="https://docs.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddsurfacedesc">DDSURFACEDESC</a> structure or an <b>IDirectDrawSurface3</b> interface, the methods in IDirectDrawSurface7 accept a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550340(v=vs.85)">DDSURFACEDESC2</a> structure or an <b>IDirectDrawSurface7</b> interface, instead.
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
 * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nn-ddraw-idirectdrawsurface7
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
     * @remarks
     * <b>AddAttachedSurface</b> increments the reference count of the surface being attached. You can explicitly unattach the surface and decrement its reference count by using the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-deleteattachedsurface">IDirectDrawSurface7::DeleteAttachedSurface</a> method. Unlike complex surfaces that you create with a single call to <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-createsurface">IDirectDraw7::CreateSurface</a>, surfaces attached with this method are not automatically released. The application must release such surfaces.
     * 
     * You can attach only z-buffer surfaces with this method.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-addattachedsurface
     */
    AddAttachedSurface(param0) {
        result := ComCall(3, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-addoverlaydirtyrect
     */
    AddOverlayDirtyRect(param0) {
        result := ComCall(4, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Performs a bit block transfer (bitblt). This method does not support z-buffering or alpha blending during bitblt operations.
     * @remarks
     * <b>Blt</b> can perform synchronous or asynchronous bitblts (the latter is the default behavior). These bitblts can occur from display memory to display memory, from display memory to system memory, from system memory to display memory, or from system memory to system memory. The bitblts can be performed by using source color keys and destination color keys. Arbitrary stretching or shrinking is performed if the source and destination rectangles are not the same size.
     * 
     * Typically, <b>Blt</b> returns immediately with an error if the bitbltter is busy and the bitblt could not be set up. Specify the DDBLT_WAIT flag to request a synchronous bitblt. When you include the DDBLT_WAIT flag, <b>Blt</b> waits until the bitblt can be set up or another error occurs before it returns.
     * 
     * RECT structures are defined so that the right and bottom members are exclusive—therefore, right minus left equals the width of the rectangle, not 1 less than the width.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-blt
     */
    Blt(param0, param1, param2, param3, param4) {
        result := ComCall(5, this, "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, "ptr", param4, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-bltbatch
     */
    BltBatch(param0, param1, param2) {
        result := ComCall(6, this, "ptr", param0, "uint", param1, "uint", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Performs a source copy bitblt or transparent bitblt by using a source color key or destination color key.
     * @remarks
     * <b>BltFast</b> always attempts an asynchronous blit if it is supported by the hardware.
     * 
     * <b>BltFast</b> works only on display memory surfaces and cannot clip when it performs a bitblt operation. If you use this method on a surface with an attached clipper, the call fails, and the method returns DDERR_UNSUPPORTED.
     * 
     * The software implementation of <b>IDirectDrawSurface7::BltFast</b> is 10 percent faster than the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-blt">IDirectDrawSurface7::Blt</a> method. However, there is no speed difference between the two if display hardware is used.
     * 
     * Typically, <b>IDirectDrawSurface7::BltFast</b> returns immediately with an error if the bitbltter is busy and the bitblt cannot be set up. You can use the DDBLTFAST_WAIT flag, however, if you want this method not to return until either the bitblt can be set up or another error occurs.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-bltfast
     */
    BltFast(param0, param1, param2, param3, param4) {
        result := ComCall(7, this, "uint", param0, "uint", param1, "ptr", param2, "ptr", param3, "uint", param4, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Detaches one or more attached surfaces.
     * @remarks
     * <b>DeleteAttachedSurface</b> decrements the reference count of the surface to be detached. If the reference count of the surface to be detached reaches 0, the surface is lost and removed from memory.
     * 
     * Implicit attachments, those formed by DirectDraw rather than the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-addattachedsurface">IDirectDrawSurface7::AddAttachedSurface</a> method, cannot be detached. Detaching surfaces from a flipping chain can alter other surfaces in the chain. If a front buffer is detached from a flipping chain, the next surface in the chain becomes the front buffer, and the following surface becomes the back buffer. If a back buffer is detached from a chain, the following surface becomes a back buffer. If a plain surface is detached from a chain, the chain simply becomes shorter. If a flipping chain has only two surfaces and they are detached, the chain is destroyed, and both surfaces return to their previous designations.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-deleteattachedsurface
     */
    DeleteAttachedSurface(param0, param1) {
        result := ComCall(8, this, "uint", param0, "ptr", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates all the surfaces that are attached to this surface.
     * @remarks
     * <b>EnumAttachedSurfaces</b> enumerates only those surfaces that are directly attached to this surface. For example, in a flipping chain of three or more surfaces, only one surface is enumerated because each surface is attached only to the next surface in the flipping chain. In such a configuration, you can call <b>EnumAttachedSurfaces</b> on each successive surface to walk the entire flipping chain.
     * 
     * <b>EnumAttachedSurfaces</b> differs from its counterparts in previous interface versions in that it accepts a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumsurfacescallback7">EnumSurfacesCallback7</a> function, rather than an <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumsurfacescallback">EnumSurfacesCallback</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumsurfacescallback2">EnumSurfacesCallback2</a> function.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-enumattachedsurfaces
     */
    EnumAttachedSurfaces(param0, param1) {
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, param0Marshal, param0, "ptr", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates the overlay surfaces on the specified destination. You can enumerate the overlays in front-to-back or back-to-front order.
     * @remarks
     * <b>EnumOverlayZOrders</b> differs from its counterparts in previous interface versions in that it accepts a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumsurfacescallback7">EnumSurfacesCallback7</a> function, rather than an <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumsurfacescallback">EnumSurfacesCallback</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumsurfacescallback2">EnumSurfacesCallback2</a> function.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-enumoverlayzorders
     */
    EnumOverlayZOrders(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "uint", param0, param1Marshal, param1, "ptr", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Makes the surface memory that is associated with the DDSCAPS_BACKBUFFER surface become associated with the front-buffer surface.
     * @remarks
     * With <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nn-ddraw-idirectdrawsurface7">IDirectDrawSurface7</a>, the default behavior of <b>Flip</b> is to wait for the accelerator to finish. Therefore, under default conditions, <b>Flip</b> never returns DDERR_WASSTILLDRAWING. If you want to see the error codes and not wait until the flip operation succeeds, use the DDFLIP_DONOTWAIT flag.
     * 
     * 
     * 
     * <b>Flip</b> can be called only for a surface that has the DDSCAPS_FLIP and DDSCAPS_FRONTBUFFER capabilities. The display memory previously associated with the front buffer is associated with the back buffer.
     * 
     * 
     * 
     * The <i>lpDDSurfaceTargetOverride</i> parameter is used in rare cases in which the back buffer is not the buffer that should become the front buffer. Typically, this parameter is NULL.
     * 
     * <b>Flip</b> is always synchronized with the vertical blank. If the surface has been assigned to a video port, this method updates the visible overlay surface and the target surface of the video port.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-flip
     */
    Flip(param0, param1) {
        result := ComCall(11, this, "ptr", param0, "uint", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Obtains the attached surface that has the specified capabilities, and increments the reference count of the retrieved interface.
     * @remarks
     * Attachments are used to connect multiple DirectDrawSurface objects into complex structures, like the complex structures required to support 3-D page flipping with z-buffers. <b>GetAttachedSurface</b> fails if more than one surface is attached that matches the capabilities requested. In this case, the application must use the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-enumattachedsurfaces">IDirectDrawSurface7::EnumAttachedSurfaces</a> method to obtain the attached surfaces.
     * @param {Pointer<DDSCAPS2>} param0 
     * @returns {IDirectDrawSurface7} 
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getattachedsurface
     */
    GetAttachedSurface(param0) {
        result := ComCall(12, this, "ptr", param0, "ptr*", &param1 := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getbltstatus
     */
    GetBltStatus(param0) {
        result := ComCall(13, this, "uint", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the capabilities of this surface. These capabilities are not necessarily related to the capabilities of the display device.
     * @remarks
     * The <b>IDirectDrawSurface7::GetCaps</b> method differs from its counterpart in the <b>IDirectDrawSurface3</b> interface in that it accepts a pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550292(v=vs.85)">DDSCAPS2</a> structure, rather than the legacy <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550286(v=vs.85)">DDSCAPS</a> structure.
     * @param {Pointer<DDSCAPS2>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getcaps
     */
    GetCaps(param0) {
        result := ComCall(14, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the DirectDrawClipper object that is associated with this surface, and increments the reference count of the returned clipper.
     * @returns {IDirectDrawClipper} 
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getclipper
     */
    GetClipper() {
        result := ComCall(15, this, "ptr*", &param0 := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getcolorkey
     */
    GetColorKey(param0, param1) {
        result := ComCall(16, this, "uint", param0, "ptr", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a GDI-compatible handle of a device context for this surface.
     * @remarks
     * <b>GetDC</b> uses an internal version of the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-lock">IDirectDrawSurface7::Lock</a> method to lock the surface. The surface remains locked until the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-releasedc">IDirectDrawSurface7::ReleaseDC</a> method is called.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getdc
     */
    GetDC(param0) {
        result := ComCall(17, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getflipstatus
     */
    GetFlipStatus(param0) {
        result := ComCall(18, this, "uint", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getoverlayposition
     */
    GetOverlayPosition(param0, param1) {
        param0Marshal := param0 is VarRef ? "int*" : "ptr"
        param1Marshal := param1 is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, param0Marshal, param0, param1Marshal, param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the DirectDrawPalette object that is associated with this surface, and increments the reference count of the returned palette.
     * @returns {IDirectDrawPalette} 
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getpalette
     */
    GetPalette() {
        result := ComCall(20, this, "ptr*", &param0 := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getpixelformat
     */
    GetPixelFormat(param0) {
        result := ComCall(21, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getsurfacedesc
     */
    GetSurfaceDesc(param0) {
        result := ComCall(22, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a DirectDrawSurface object.
     * @param {IDirectDraw} param0 
     * @param {Pointer<DDSURFACEDESC2>} param1 
     * @returns {HRESULT} This method returns DDERR_ALREADYINITIALIZED.
     * 
     * This method is provided for compliance with the Component Object Model (COM). Because the DirectDrawSurface object is initialized when it is created, this method always returns DDERR_ALREADYINITIALIZED.
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-initialize
     */
    Initialize(param0, param1) {
        result := ComCall(23, this, "ptr", param0, "ptr", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Determines whether the surface memory that is associated with a DirectDrawSurface object has been freed.
     * @remarks
     * Surfaces can lose their memory when the mode of the graphics adapter is changed or when an application receives exclusive access to the graphics adapter and frees all surface memory that is currently allocated on the graphics adapter.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-islost
     */
    IsLost() {
        result := ComCall(24, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Obtains a pointer to the surface memory.
     * @remarks
     * In <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nn-ddraw-idirectdrawsurface7">IDirectDrawSurface7</a>, the default behavior of <b>Lock</b> is to wait for the accelerator to finish. Therefore, under default conditions, <b>Lock</b> never returns DDERR_WASSTILLDRAWING. If you want to see the error codes and not wait until the bitblt operation succeeds, use the DDLOCK_DONOTWAIT flag.
     * 
     * After retrieving a surface memory pointer, you can access the surface memory until a corresponding <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-unlock">IDirectDrawSurface7::Unlock</a> method is called. When the surface is unlocked, the pointer to the surface memory is invalid.
     * 
     * Do not call DirectDraw bitblt functions to bitblt from a locked region of a surface. If you do, the bitblt returns either DDERR_SURFACEBUSY or DDERR_LOCKEDSURFACES. GDI blit functions also silently fail when used on a locked video memory surface.
     * 
     * 
     * 
     * Unless you include the DDLOCK_NOSYSLOCK flag, <b>Lock</b> causes DirectDraw to hold the Win16Mutex (also known as Win16Lock) until you call the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-unlock">IDirectDrawSurface7::Unlock</a> method. GUI debuggers cannot operate while the Win16Mutex is held.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-lock
     */
    Lock(param0, param1, param2, param3) {
        param3 := param3 is Win32Handle ? NumGet(param3, "ptr") : param3

        result := ComCall(25, this, "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Releases the handle of a device context that was previously obtained by using the IDirectDrawSurface7::GetDC method.
     * @remarks
     * <b>ReleaseDC</b> also unlocks the surface that was previously locked when the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-getdc">IDirectDrawSurface7::GetDC</a> method was called.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-releasedc
     */
    ReleaseDC(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(26, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Restores a surface that has been lost. This occurs when the surface memory that is associated with the DirectDrawSurface object has been freed.
     * @remarks
     * <b>Restore</b> restores the memory that was allocated for a surface, but does not reload any bitmaps that might have existed in the surface before it was lost.
     * 
     * Surfaces can be lost because the mode of the graphics adapter was changed or because an application received exclusive access to the graphics adapter and freed all surface memory currently allocated on the adapter. When a DirectDrawSurface object loses its surface memory, many methods return DDERR_SURFACELOST and perform no other function. The <b>IDirectDrawSurface7::Restore</b> method reallocates surface memory and reattaches it to the DirectDrawSurface object.
     * 
     * A single call to <b>Restore</b> restores a DirectDrawSurface object's associated implicit surfaces (back buffers, and so on). An attempt to restore an implicitly created surface results in an error. <b>Restore</b> does not work across explicit attachments that were created by using the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-addattachedsurface">IDirectDrawSurface7::AddAttachedSurface</a> method—each of these surfaces must be restored individually.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-restore
     */
    Restore() {
        result := ComCall(27, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Attaches a clipper object to, or deletes one from, this surface.
     * @remarks
     * When you set a clipper to a surface for the first time, <b>SetClipper</b> increments the clipper's reference count; subsequent calls do not affect the clipper's reference count. If you pass NULL as the <i>lpDDClipper</i> parameter, the clipper is removed from the surface, and the clipper's reference count is decremented. If you do not delete the clipper, the surface automatically releases its reference to the clipper when the surface itself is released. According to COM rules, your application must release any references that it holds to the clipper when the object is no longer needed.
     * 
     * <b>SetClipper</b> is primarily used by surfaces that are being overlaid on or bitbltted to the primary surface. However, it can be used on any surface. After a DirectDrawClipper object has been attached and a clip list is associated with it, the DirectDrawClipper object is used for the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-blt">IDirectDrawSurface7::Blt</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-bltbatch">IDirectDrawSurface7::BltBatch</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-updateoverlay">IDirectDrawSurface7::UpdateOverlay</a> operations that involve the parent DirectDrawSurface object. <b>SetClipper</b> can also detach the current DirectDrawClipper object of a DirectDrawSurface object.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-setclipper
     */
    SetClipper(param0) {
        result := ComCall(28, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the color key value for the DirectDrawSurface object if the hardware supports color keys on a per-surface basis.
     * @remarks
     * For transparent bitblt operations and overlays, set destination color on the destination surface and source color on the source surface.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-setcolorkey
     */
    SetColorKey(param0, param1) {
        result := ComCall(29, this, "uint", param0, "ptr", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-setoverlayposition
     */
    SetOverlayPosition(param0, param1) {
        result := ComCall(30, this, "int", param0, "int", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Attaches a palette object to (or detaches one from) a surface. The surface uses this palette for all subsequent operations. The palette change takes place immediately, without regard to refresh timing.
     * @remarks
     * When you call <b>SetPalette</b> to  set a palette to a surface for the first time, <b>SetPalette</b> increments the palette's reference count; subsequent calls to <b>SetPalette</b> do not affect the palette's reference count. If you pass NULL as the <i>lpDDPalette</i> parameter, the palette is removed from the surface, and the palette's reference count is decremented. If you do not delete the palette, the surface automatically releases its reference to the palette when the surface itself is released. According to COM rules, your application must release any references that it holds to the palette when the object is no longer needed.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-setpalette
     */
    SetPalette(param0) {
        result := ComCall(31, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies DirectDraw that the direct surface manipulations are complete.
     * @remarks
     * Because you can call <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-lock">IDirectDrawSurface7::Lock</a> multiple times for the same surface with different destination rectangles, the pointer in <i>lpRect</i> links the calls to the <b>IDirectDrawSurface7::Lock</b> and <b>IDirectDrawSurface7::Unlock</b> methods.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-unlock
     */
    Unlock(param0) {
        result := ComCall(32, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-updateoverlay
     */
    UpdateOverlay(param0, param1, param2, param3, param4) {
        result := ComCall(33, this, "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, "ptr", param4, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IDirectDrawSurface7::UpdateOverlayDisplay method is not currently implemented.
     * @param {Integer} param0 
     * @returns {HRESULT} The method is not currently implemented.
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-updateoverlaydisplay
     */
    UpdateOverlayDisplay(param0) {
        result := ComCall(34, this, "uint", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-updateoverlayzorder
     */
    UpdateOverlayZOrder(param0, param1) {
        result := ComCall(35, this, "uint", param0, "ptr", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getddinterface
     */
    GetDDInterface(param0) {
        param0Marshal := param0 is VarRef ? "ptr*" : "ptr"

        result := ComCall(36, this, param0Marshal, param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Prevents a system-memory surface from being paged out while a bit block transfer (bitblt) operation that uses direct memory access (DMA) transfers to or from system memory is in progress.
     * @remarks
     * You must call <b>PageLock</b> to make use of DMA support. If you do not, the bitblt occurs by using software emulation.
     * 
     * The performance of the operating system can be negatively affected if too much memory is locked.
     * 
     * A lock count is maintained for each surface and is incremented each time that <b>PageLock</b> is called for that surface. The count is decremented when <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-pageunlock">IDirectDrawSurface7::PageUnlock</a> is called. When the count reaches 0, the memory is unlocked, and can then be paged by the operating system.
     * 
     * <b>PageLock</b> works only on system-memory surfaces; it does not page-lock a display-memory surface or an emulated primary surface. If an application calls <b>PageLock</b> on a display memory surface, the method does nothing except return DD_OK.
     * 
     * <b>IDirectDrawSurface7::PageLock</b> was not implemented in the <b>IDirectDraw</b> interface version.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-pagelock
     */
    PageLock(param0) {
        result := ComCall(37, this, "uint", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Unlocks a system-memory surface, which then allows it to be paged out.
     * @remarks
     * A lock count is maintained for each surface and is incremented each time that <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-pagelock">IDirectDrawSurface7::PageLock</a> is called for that surface. The count is decremented when <b>PageUnlock</b> is called. When the count reaches 0, the memory is unlocked, and can then be paged by the operating system.
     * 
     * <b>PageUnlock</b> works only on system-memory surfaces; it does not page-unlock a display-memory surface or an emulated primary surface. If an application calls <b>PageUnlock</b> on a display memory surface, the method does nothing except return DD_OK.
     * 
     * <b>IDirectDrawSurface7::PageUnlock</b> was not implemented in the <b>IDirectDraw</b> interface version.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-pageunlock
     */
    PageUnlock(param0) {
        result := ComCall(38, this, "uint", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the characteristics of an existing surface.
     * @remarks
     * Currently, you can use <b>SetSurfaceDesc</b> only to set the surface data and pixel format that is used by an explicit system-memory surface. This is useful because it allows a surface to use data from a previously allocated buffer without copying. The new surface memory is allocated by the client application, and therefore the client application must also deallocate it.
     * 
     * The DirectDrawSurface object does not deallocate surface memory that it did not allocate. Therefore, when the surface memory is no longer needed, you must deallocate it. However, when you call <b>SetSurfaceDesc</b>, DirectDraw frees the original surface memory that it implicitly allocated when it created the surface.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-setsurfacedesc
     */
    SetSurfaceDesc(param0, param1) {
        result := ComCall(39, this, "ptr", param0, "uint", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Associates data with the surface that is intended for use by the application, not by DirectDraw. Data is passed by value, and multiple sets of data can be associated with a single surface.
     * @remarks
     * DirectDraw does not manage the memory at <i>lpData</i>. If this buffer was dynamically allocated, the caller must free the memory.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-setprivatedata
     */
    SetPrivateData(param0, param1, param2, param3) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(40, this, "ptr", param0, param1Marshal, param1, "uint", param2, "uint", param3, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getprivatedata
     */
    GetPrivateData(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(41, this, "ptr", param0, param1Marshal, param1, param2Marshal, param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Frees the specified private data that is associated with this surface.
     * @remarks
     * DirectDraw calls this method automatically when a surface is released.
     * 
     * If the private data was set by using the DDSPD_IUNKNOWNPOINTER flag, <b>FreePrivateData</b> calls the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method on the associated interface.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-freeprivatedata
     */
    FreePrivateData(param0) {
        result := ComCall(42, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the current uniqueness value for this surface.
     * @remarks
     * The only defined uniqueness value is 0, which indicates that the surface is likely to be changing beyond the control of DirectDraw. Other uniqueness values are significant only if they differ from a previously cached uniqueness value. If the current value is different from a cached value, the contents of the surface have changed.
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getuniquenessvalue
     */
    GetUniquenessValue(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(43, this, param0Marshal, param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Manually updates the uniqueness value for this surface.
     * @remarks
     * DirectDraw automatically updates uniqueness values whenever the contents of a surface change.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-changeuniquenessvalue
     */
    ChangeUniquenessValue() {
        result := ComCall(44, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Assigns the texture-management priority for this texture. This method succeeds only on managed textures.
     * @remarks
     * <b>SetPriority</b> was introduced with the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nn-ddraw-idirectdrawsurface7">IDirectDrawSurface7</a> interface.
     * 
     * Priorities are used to determine when managed textures are to be removed from memory. A texture assigned a low priority is removed before a texture with a high priority. If two textures have the same priority, the texture that was used more recently is kept in memory; the other texture is removed.
     * 
     * Applications can set and retrieve priorities only for managed textures (those surfaces that were created with the DDSCAPS2_TEXTUREMANAGE flag). If you call <b>SetPriority</b> on a nonmanaged texture, <b>SetPriority</b> fails and returns DDERR_INVALIDOBJECT.
     * @param {Integer} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the return value is an error. The method returns DDERR_INVALIDOBJECT if the parameter is invalid or if the texture is not managed by Direct3D.
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-setpriority
     */
    SetPriority(param0) {
        result := ComCall(45, this, "uint", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the texture-management priority for this texture. This method succeeds only on managed textures.
     * @remarks
     * Priorities are used to determine when managed textures are to be removed from memory. A texture assigned a low priority is removed before a texture with a high priority. If two textures have the same priority, the texture that was used more recently is kept in memory; the other texture is removed.
     * 
     * Applications can set and retrieve priorities only for managed textures (those surfaces that were created with the DDSCAPS2_TEXTUREMANAGE flag). If you call <b>GetPriority</b> on a nonmanaged texture, <b>GetPriority</b> fails and returns DDERR_INVALIDOBJECT.
     * 
     * <b>GetPriority</b> was introduced with the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nn-ddraw-idirectdrawsurface7">IDirectDrawSurface7</a> interface.
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the return value is an error. The method returns DDERR_INVALIDOBJECT if the parameter is invalid or if the texture is not managed by Direct3D.
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getpriority
     */
    GetPriority(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(46, this, param0Marshal, param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the maximum level of detail (LOD) for a managed mipmap surface. This method succeeds only on managed textures.
     * @remarks
     * Applications can call this method only for managed textures (those surfaces that were created with the DDSCAPS2_TEXTUREMANAGE flag). If you call <b>SetLOD</b> on a nonmanaged texture, <b>SetLOD</b> fails and returns DDERR_INVALIDOBJECT.
     * 
     * <b>SetLOD</b> communicates to the Direct3D texture manager the most detailed mipmap in this chain that it should load into local video memory. For example, in a five-level mipmap chain, if you set <i>dwMaxLOD</i> to 2, the texture manager should load only mipmap levels 2 through 4 into local video memory at any given time. Likewise, if the most detailed mipmap in the chain has the dimensions 256×256, setting the maximum level to 2 means that the largest mipmap ever present in video memory has dimensions 64×64.
     * @param {Integer} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-setlod
     */
    SetLOD(param0) {
        result := ComCall(47, this, "uint", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the maximum level of detail (LOD) currently set for a managed mipmap surface. This method succeeds only on managed textures.
     * @remarks
     * Applications can call this method only for managed textures (those surfaces that were created with the DDSCAPS2_TEXTUREMANAGE flag). If you call <b>GetLOD</b> on a nonmanaged texture, <b>GetLOD</b> fails and returns DDERR_INVALIDOBJECT.
     * 
     * <b>GetLOD</b> communicates to the Direct3D texture manager the most detailed mipmap in this chain that it should load into local video memory. For example, in a five-level mipmap chain, a value of 2 in the variable at <i>lpdwMaxLOD</i> indicates that the texture manager loads only mipmap levels 2 through 4 into local video memory at any given time. Likewise, if the most detailed mipmap in the chain has the dimensions 256×256, a value of 2 in <i>lpdwMaxLOD</i> means that the largest mipmap ever present in video memory has dimensions 64×64.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nf-ddraw-idirectdrawsurface7-getlod
     */
    GetLOD(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(48, this, param0Marshal, param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
