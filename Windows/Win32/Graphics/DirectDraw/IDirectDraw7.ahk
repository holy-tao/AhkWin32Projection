#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectDrawClipper.ahk
#Include .\IDirectDrawPalette.ahk
#Include .\IDirectDrawSurface7.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Applications use the methods of the IDirectDraw7 interface to create DirectDraw objects and work with system-level variables. This section is a reference to the methods of the IDirectDraw7 interface.
 * @remarks
 * The methods of the <b>IDirectDraw7</b> interface can be organized into the following groups:<table>
 * <tr>
 * <th>Group</th>
 * <th>Methods</th>
 * </tr>
 * <tr>
 * <td>Allocating memory</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-compact">Compact</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-initialize">Initialize</a>
 * </td>
 * </tr>
 * <tr>
 * <td>Cooperative levels</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-setcooperativelevel">SetCooperativeLevel</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-testcooperativelevel">TestCooperativeLevel</a>
 * </td>
 * </tr>
 * <tr>
 * <td>Creating objects</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-createclipper">CreateClipper</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-createpalette">CreatePalette</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-createsurface">CreateSurface</a>
 * </td>
 * </tr>
 * <tr>
 * <td>Device capabilities</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getcaps">GetCaps</a>
 * </td>
 * </tr>
 * <tr>
 * <td>Display modes</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-enumdisplaymodes">EnumDisplayModes</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getdisplaymode">GetDisplayMode</a>,  
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getmonitorfrequency">GetMonitorFrequency</a>,  
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-restoredisplaymode">RestoreDisplayMode</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-setdisplaymode">SetDisplayMode</a>,  
 * and <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-waitforverticalblank">WaitForVerticalBlank</a>
 * </td>
 * </tr>
 * <tr>
 * <td>Display status</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getscanline">GetScanLine</a> and  
 *   <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getverticalblankstatus">GetVerticalBlankStatus</a>
 * </td>
 * </tr>
 * <tr>
 * <td>Miscellaneous</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-evaluatemode">EvaluateMode</a>, 
 *   <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getavailablevidmem">GetAvailableVidMem</a>,  
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getdeviceidentifier">GetDeviceIdentifier</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getfourcccodes">GetFourCCCodes</a>, and  
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-startmodetest">StartModeTest</a>
 * </td>
 * </tr>
 * <tr>
 * <td>Surface management</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-duplicatesurface">DuplicateSurface</a>,  
 *   <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-enumsurfaces">EnumSurfaces</a>,  
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-fliptogdisurface">FlipToGDISurface</a>,  
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getgdisurface">GetGDISurface</a>,  
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-getsurfacefromdc">GetSurfaceFromDC</a>, and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-restoreallsurfaces">RestoreAllSurfaces</a>
 * </td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * The <b>IDirectDraw7</b> interface extends the features of previous versions of the interface by offering methods that enable more flexible surface management than previous versions. All the surface-related methods in the <b>IDirectDraw7</b> interface accept slightly different parameters than their counterparts in the <b>IDirectDraw2</b> interface. Wherever an <b>IDirectDraw2</b> interface method might accept a <a href="https://docs.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddsurfacedesc">DDSURFACEDESC</a> structure and retrieve an <b>IDirectDrawSurface3</b> interface, the methods in <b>IDirectDraw7</b> accept a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550340(v=vs.85)">DDSURFACEDESC2</a> structure and retrieve an <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nn-ddraw-idirectdrawsurface7">IDirectDrawSurface7</a> interface, instead.
 * 
 * <b>IDirectDraw7</b> introduces improved compliance with COM rules that dictate the lifetime of child objects.
 * 
 * Use the LPDIRECTDRAW, LPDIRECTDRAW2, LPDIRECTDRAW4 or LPDIRECTDRAW7 data types to declare a variable that contains a pointer to an <b>IDirectDraw</b>, <b>IDirectDraw2</b>, <b>IDirectDraw4</b> or <b>IDirectDraw7</b> interface. The Ddraw.h header file declares these data types with the following code:
 * 
 * 
 * ```
 * 
 * typedef struct IDirectDraw     FAR *LPDIRECTDRAW;
 * typedef struct IDirectDraw2    FAR *LPDIRECTDRAW2;
 * typedef struct IDirectDraw4    FAR *LPDIRECTDRAW4;
 * typedef struct IDirectDraw7    FAR *LPDIRECTDRAW7;
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/nn-ddraw-idirectdraw7
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDirectDraw7 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDraw7
     * @type {Guid}
     */
    static IID => Guid("{15e65ec0-3b9c-11d2-b92f-00609797ea5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Compact", "CreateClipper", "CreatePalette", "CreateSurface", "DuplicateSurface", "EnumDisplayModes", "EnumSurfaces", "FlipToGDISurface", "GetCaps", "GetDisplayMode", "GetFourCCCodes", "GetGDISurface", "GetMonitorFrequency", "GetScanLine", "GetVerticalBlankStatus", "Initialize", "RestoreDisplayMode", "SetCooperativeLevel", "SetDisplayMode", "WaitForVerticalBlank", "GetAvailableVidMem", "GetSurfaceFromDC", "RestoreAllSurfaces", "TestCooperativeLevel", "GetDeviceIdentifier", "StartModeTest", "EvaluateMode"]

    /**
     * This method is not currently implemented. (IDirectDraw7.Compact)
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NOEXCLUSIVEMODE</li>
     * <li>DDERR_SURFACEBUSY</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-compact
     */
    Compact() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Creates a DirectDrawClipper object.
     * @remarks
     * The DirectDrawClipper object can be attached to a DirectDrawSurface and used during <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-blt">IDirectDrawSurface7::Blt</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-bltbatch">IDirectDrawSurface7::BltBatch</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-updateoverlay">IDirectDrawSurface7::UpdateOverlay</a> operations.
     * 
     * To create a DirectDrawClipper object that is not owned by a specific DirectDraw object, use the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-directdrawcreateclipper">DirectDrawCreateClipper</a> function.
     * @param {Integer} param0 
     * @param {IUnknown} param2 
     * @returns {IDirectDrawClipper} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-createclipper
     */
    CreateClipper(param0, param2) {
        result := ComCall(4, this, "uint", param0, "ptr*", &param1 := 0, "ptr", param2, "HRESULT")
        return IDirectDrawClipper(param1)
    }

    /**
     * Creates a DirectDrawPalette object for this DirectDraw object.
     * @param {Integer} param0 
     * @param {Pointer<PALETTEENTRY>} param1 
     * @param {IUnknown} param3 
     * @returns {IDirectDrawPalette} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-createpalette
     */
    CreatePalette(param0, param1, param3) {
        result := ComCall(5, this, "uint", param0, "ptr", param1, "ptr*", &param2 := 0, "ptr", param3, "HRESULT")
        return IDirectDrawPalette(param2)
    }

    /**
     * Creates a DirectDrawSurface object for this DirectDraw object.
     * @param {Pointer<DDSURFACEDESC2>} param0 
     * @param {IUnknown} param2 
     * @returns {IDirectDrawSurface7} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-createsurface
     */
    CreateSurface(param0, param2) {
        result := ComCall(6, this, "ptr", param0, "ptr*", &param1 := 0, "ptr", param2, "HRESULT")
        return IDirectDrawSurface7(param1)
    }

    /**
     * Duplicates a DirectDrawSurface object.
     * @remarks
     * <b>DuplicateSurface</b> creates a new DirectDrawSurface object that points to the same surface memory as an existing DirectDrawSurface object. This duplicate can be used just like the original object. The surface memory is released after the last object referring to it is released. A primary surface, 3-D surface, or implicitly created surface cannot be duplicated.
     * @param {IDirectDrawSurface7} param0 
     * @returns {IDirectDrawSurface7} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-duplicatesurface
     */
    DuplicateSurface(param0) {
        result := ComCall(7, this, "ptr", param0, "ptr*", &param1 := 0, "HRESULT")
        return IDirectDrawSurface7(param1)
    }

    /**
     * Enumerates all the display modes that the hardware exposes through the DirectDraw object and that are compatible with a provided surface description.
     * @remarks
     * <b>IDirectDraw7::EnumDisplayModes</b> enumerates the <b>dwRefreshRate</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550340(v=vs.85)">DDSURFACEDESC2</a> structure; the IDirectDraw::EnumDisplayModes method does not have this ability. If you use the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-setdisplaymode">IDirectDraw7::SetDisplayMode</a> method to set the refresh rate of a new mode, use <b>IDirectDraw7::EnumDisplayModes</b> to enumerate the <b>dwRefreshRate</b> member.
     * 
     * 
     * 
     * <b>IDirectDraw7::EnumDisplayModes</b> differs from its counterparts in former interfaces in that it accepts the address of an <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenummodescallback2">EnumModesCallback2</a> function as a parameter, rather than an <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenummodescallback">EnumModesCallback</a> function.
     * @param {Integer} param0 
     * @param {Pointer<DDSURFACEDESC2>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Pointer<LPDDENUMMODESCALLBACK2>} param3 
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
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-enumdisplaymodes
     */
    EnumDisplayModes(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", param0, "ptr", param1, param2Marshal, param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * Enumerates all the existing or possible surfaces that meet the specified surface description.
     * @remarks
     * If the DDENUMSURFACES_CANBECREATED flag is set, this method attempts to temporarily create a surface that meets the search criterion.
     * 
     * When you use the DDENUMSURFACES_DOESEXIST flag, an enumerated surface's reference count is incremented—if you are not going to use the surface, be sure to use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IDirectDrawSurface7::Release</a> to release it after each enumeration. If you will be using the surface, release it when it is no longer needed.
     * 
     * 
     * 
     * This method differs from its counterparts in previous interface versions in that it accepts a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumsurfacescallback7">EnumSurfacesCallback7</a> function, rather than an <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumsurfacescallback">EnumSurfacesCallback</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumsurfacescallback2">EnumSurfacesCallback2</a> function.
     * @param {Integer} param0 
     * @param {Pointer<DDSURFACEDESC2>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Pointer<LPDDENUMSURFACESCALLBACK7>} param3 
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
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-enumsurfaces
     */
    EnumSurfaces(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, "uint", param0, "ptr", param1, param2Marshal, param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * Makes the surface that the GDI writes to the primary surface.
     * @remarks
     * You can call  <b>FlipToGDISurface</b> at the end of a page-flipping application to ensure that the display memory that the GDI writes to is visible.
     * 
     * You can also use  <b>FlipToGDISurface</b> to make the GDI surface the primary surface so that normal windows, such as dialog boxes, can be displayed in full-screen mode. The hardware must have the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/ns-ddraw-ddcaps_dx3">DDCAPS2_CANRENDERWINDOWED</a> capability.
     * 
     * <b>FlipToGDISurface</b> disables stereo autoflipping.
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NOTFOUND</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-fliptogdisurface
     */
    FlipToGDISurface() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the capabilities of the device driver for the hardware and the hardware emulation layer (HEL).
     * @param {Pointer<DDCAPS_DX7>} param0 
     * @param {Pointer<DDCAPS_DX7>} param1 
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
     * You can set only one of the two parameters to NULL to exclude it. If you set both to NULL, the method fails and returns DDERR_INVALIDPARAMS.
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-getcaps
     */
    GetCaps(param0, param1) {
        result := ComCall(11, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * Retrieves the current display mode.
     * @remarks
     * An application should not save the information that <b>GetDisplayMode</b> returns to restore the display mode on clean-up. The application should instead use the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-restoredisplaymode">IDirectDraw7::RestoreDisplayMode</a> method to restore the mode on clean-up, thus avoiding mode-setting conflicts that could arise in a multiprocess environment.
     * @param {Pointer<DDSURFACEDESC2>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_UNSUPPORTEDMODE</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-getdisplaymode
     */
    GetDisplayMode(param0) {
        result := ComCall(12, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Retrieves the four-character codes (FOURCC) that are supported by the DirectDraw object. This method can also retrieve the number of codes that are supported.
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
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
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-getfourcccodes
     */
    GetFourCCCodes(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, param0Marshal, param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * Retrieves the DirectDrawSurface object that currently represents the surface memory that GDI is treating as the primary surface.
     * @returns {IDirectDrawSurface7} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-getgdisurface
     */
    GetGDISurface() {
        result := ComCall(14, this, "ptr*", &param0 := 0, "HRESULT")
        return IDirectDrawSurface7(param0)
    }

    /**
     * Retrieves the frequency of the monitor that the DirectDraw object controls.
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_UNSUPPORTED</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-getmonitorfrequency
     */
    GetMonitorFrequency(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * Retrieves the scan line that is currently being drawn on the monitor.
     * @remarks
     * Scan lines are reported as zero-based integers. The returned scan line value is in the range from 0 through n, where 0 is the first visible scan line on the screen and n is the last visible scan line, plus any scan lines that occur during the vertical blank period. So, in a case where an application is running at a resolution of 640×480 and there are 12 scan lines during vblank, the values returned by this method range from 0 through 491.
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_UNSUPPORTED</li>
     * <li>DDERR_VERTICALBLANKINPROGRESS</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-getscanline
     */
    GetScanLine(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * Retrieves the status of the vertical blank.
     * @remarks
     * To synchronize with the vertical blank, use the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-waitforverticalblank">IDirectDraw7::WaitForVerticalBlank</a> method.
     * @param {Pointer<BOOL>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-getverticalblankstatus
     */
    GetVerticalBlankStatus(param0) {
        param0Marshal := param0 is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * Initializes a DirectDraw object that was created by using the CoCreateInstance COM function.
     * @param {Pointer<Guid>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_ALREADYINITIALIZED</li>
     * <li>DDERR_DIRECTDRAWALREADYCREATED</li>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NODIRECTDRAWHW</li>
     * <li>DDERR_NODIRECTDRAWSUPPORT</li>
     * <li>DDERR_OUTOFMEMORY</li>
     * </ul>
     * This method is provided for compliance with the Component Object Model (COM). If you already used the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-directdrawcreate">DirectDrawCreate</a> function to create a DirectDraw object, this method returns DDERR_ALREADYINITIALIZED. If you do not call <b>IDirectDraw7::Initialize</b> when you use <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> to create a DirectDraw object, any method that you call afterward returns DDERR_NOTINITIALIZED.
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-initialize
     */
    Initialize(param0) {
        result := ComCall(18, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * Resets the mode of the display device hardware for the primary surface to what it was before the IDirectDraw7::SetDisplayMode method was called. Exclusive-level access is required to use this method.
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
     * <li>DDERR_LOCKEDSURFACES</li>
     * <li>DDERR_NOEXCLUSIVEMODE</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-restoredisplaymode
     */
    RestoreDisplayMode() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * Determines the top-level behavior of the application.
     * @remarks
     * This method must be called by the same thread that created the application window.
     * 
     * 
     * 
     * An application must set either the DDSCL_EXCLUSIVE or the DDSCL_NORMAL flag.
     * 
     * 
     * 
     * The DDSCL_EXCLUSIVE flag must be set to call functions that can adversely affect performance of other applications.
     * 
     * Interaction between this method and the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-setdisplaymode">IDirectDraw7::SetDisplayMode</a> method differs from their IDirectDraw counterparts.
     * 
     * If you use Microsoft Foundation Classes (MFC), the window handle passed to this method must identify the application's top-level window, not a derived child window. To retrieve your MFC application's top-level window handle, you could use the following code:
     * 
     * 
     * 
     * 
     * ```
     * 
     * HWND hwndTop = AfxGetMainWnd()->GetSafeHwnd();
     * 
     * ```
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_EXCLUSIVEMODEALREADYSET</li>
     * <li>DDERR_HWNDALREADYSET</li>
     * <li>DDERR_HWNDSUBCLASSED</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_OUTOFMEMORY</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-setcooperativelevel
     */
    SetCooperativeLevel(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(20, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * Sets the mode of the display-device hardware.
     * @remarks
     * This method must be called by the same thread that created the application window.
     * 
     * If another application changes the display mode, the primary surface is lost, and the method returns DDERR_SURFACELOST until the primary surface is recreated to match the new display mode.
     * 
     * 
     * 
     * As part of the prior-version <b>IDirectDraw</b> interface, this method did not include the <i>dwRefreshRate</i> and <i>dwFlags</i> parameters.
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDMODE</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_LOCKEDSURFACES</li>
     * <li>DDERR_NOEXCLUSIVEMODE</li>
     * <li>DDERR_SURFACEBUSY</li>
     * <li>DDERR_UNSUPPORTED</li>
     * <li>DDERR_UNSUPPORTEDMODE</li>
     * <li>DDERR_WASSTILLDRAWING</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-setdisplaymode
     */
    SetDisplayMode(param0, param1, param2, param3, param4) {
        result := ComCall(21, this, "uint", param0, "uint", param1, "uint", param2, "uint", param3, "uint", param4, "HRESULT")
        return result
    }

    /**
     * Helps the application synchronize itself with the vertical-blank interval.
     * @param {Integer} param0 
     * @param {HANDLE} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_UNSUPPORTED</li>
     * <li>DDERR_WASSTILLDRAWING</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-waitforverticalblank
     */
    WaitForVerticalBlank(param0, param1) {
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1

        result := ComCall(22, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * Retrieves the total amount of display memory available and the amount of display memory currently free for a given type of surface.
     * @remarks
     * The following C++ example demonstrates how to use <b>GetAvailableVidMem</b> to determine both the total and free display memory available for texture-map surfaces:
     * 
     * 
     * ```
     * // For this example, the lpDD variable is a valid 
     * // pointer to an IDirectDraw7 interface.
     * LPDIRECTDRAW7 lpDD;
     * DDSCAPS2      ddsCaps2; 
     * DWORD         dwTotal; 
     * DWORD         dwFree;
     * HRESULT       hr; 
     *  
     * hr = lpDD->QueryInterface(IID_IDirectDraw7, &lpDD); 
     * if (FAILED(hr))
     *     return hr; 
     *  
     * // Initialize the structure.
     * ZeroMemory(&ddsCaps2, sizeof(ddsCaps2));
     *  
     * ddsCaps2.dwCaps = DDSCAPS_TEXTURE; 
     * hr = lpDD->GetAvailableVidMem(&ddsCaps2, &dwTotal, &dwFree); 
     * if (FAILED(hr))
     *     return hr;
     * 
     * 
     * ```
     * 
     * 
     * If the surface has the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550286(v=vs.85)">DDSCAPS_VIDEOMEMORY</a> flag set, <b>GetAvailableVidMem</b> returns different amounts of video memory depending on whether the surface can be used as a 3-D texture. If the surface can be used for 3-D textures, <b>GetAvailableVidMem</b> returns the sum of the local video memory and the non-local video memory on AGP systems.
     * 
     * <b>GetAvailableVidMem</b> provides only a snapshot of the current display-memory state. The amount of free display memory is subject to change as surfaces are created and released. Therefore, you should use the free memory value only as an approximation. In addition, a particular display adapter card might make no distinction between two different memory types. For example, the adapter might use the same portion of display memory to store z-buffers and textures. So, allocating one type of surface (for example, a z-buffer) can affect the amount of display memory available for another type of surface (textures). Therefore, it is best to first allocate an application's fixed resources (such as front and back buffers and z-buffers) before determining how much memory is available for dynamic use (such as texture mapping).
     * 
     * 
     * 
     * <b>GetAvailableVidMem</b> was not implemented in the previous DirectX IDirectDraw interface version.
     * @param {Pointer<DDSCAPS2>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDCAPS</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NODIRECTDRAWHW</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-getavailablevidmem
     */
    GetAvailableVidMem(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "ptr", param0, param1Marshal, param1, param2Marshal, param2, "HRESULT")
        return result
    }

    /**
     * Retrieves the IDirectDrawSurface7 interface for a surface, based on its GDI device context handle.
     * @remarks
     * This method succeeds only for device context handles that identify surfaces already associated with the DirectDraw object.
     * @param {HDC} param0 
     * @returns {IDirectDrawSurface7} 
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-getsurfacefromdc
     */
    GetSurfaceFromDC(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(24, this, "ptr", param0, "ptr*", &param1 := 0, "HRESULT")
        return IDirectDrawSurface7(param1)
    }

    /**
     * Restores all the surfaces that were created for the DirectDraw object, in the order that they were created.
     * @remarks
     * This method is provided for convenience. Effectively, this method calls the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdrawsurface7-restore">IDirectDrawSurface7::Restore</a> method for each surface that is created by this DirectDraw object.
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
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-restoreallsurfaces
     */
    RestoreAllSurfaces() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * Reports the current cooperative-level status of the DirectDraw device for a windowed or full-screen application.
     * @remarks
     * This method is particularly useful to applications that use the WM_ACTIVATEAPP and WM_DISPLAYCHANGE system messages as a notification to restore surfaces or recreate DirectDraw objects. The DD_OK return value always indicates that the application can continue, but the error codes are interpreted differently, depending on the cooperative level that the application uses.
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK, which indicates that the calling application can continue.
     * 
     * If it fails, the method can return one of the following error values (see Remarks):
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_EXCLUSIVEMODEALREADYSET</li>
     * <li>DDERR_NOEXCLUSIVEMODE</li>
     * <li>DDERR_WRONGMODE</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-testcooperativelevel
     */
    TestCooperativeLevel() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * Obtains information about the device driver. This method can be used, with caution, to recognize specific hardware installations to implement workarounds for poor driver or chipset behavior.
     * @param {Pointer<DDDEVICEIDENTIFIER2>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return DDERR_INVALIDPARAMS.
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-getdeviceidentifier
     */
    GetDeviceIdentifier(param0, param1) {
        result := ComCall(27, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * Initiates a test to update the system registry with refresh rate information for the current display adapter and monitor combination.
     * @remarks
     * You can use the <b>StartModeTest</b> method together with the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-evaluatemode">IDirectDraw7::EvaluateMode</a> method to determine the maximum refresh rate that an EDID monitor and display adapter combination can support for each screen resolution. The results of the testing are stored in the system registry and affect the operation of <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-enumdisplaymodes">IDirectDraw7::EnumDisplayModes</a> when that method is called with the DDEDM_REFRESHRATES flag set.
     * 
     * 
     * 
     * Specifically, a call to <b>StartModeTest</b> directs DirectDraw to establish a set of testable resolutions and to display a mode based on the first resolution in the set. Subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-evaluatemode">IDirectDraw7::EvaluateMode</a> can be used to pass or fail each mode and to advance the test to the next display mode.
     * 
     * 
     * 
     * <b>StartModeTest</b> succeeds only with monitors that contain EDID data. If the monitor is not EDID-compliant, <b>StartModeTest</b> returns DDERR_TESTFINISHED without testing any modes. If the EDID table does not contain values higher than 60 Hz, no modes are tested. Refresh rates higher than 100 Hz are tested only if the EDID table contains values higher than 85 Hz.
     * 
     * 
     * 
     * If you call <b>StartModeTest</b> with an argument list of (NULL, 0, 0), <b>StartModeTest</b> clears existing refresh rate information from the registry.
     * 
     * 
     * 
     * The test does not guarantee to display only the resolutions in the array described by the <i>lpModesToTest</i> and <i>dwNumEntries</i> parameters. For example, the 640×480 resolution is used to obtain a maximum viewable refresh rate for the 320×200 resolution.
     * @param {Pointer<SIZE>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_CURRENTLYNOTAVAIL</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NOEXCLUSIVEMODE</li>
     * <li>DDERR_NOTFOUND</li>
     * <li>DDERR_TESTFINISHED</li>
     * </ul>
     * When the method is called with the DDSMT_ISTESTREQUIRED flag, it can return one of the following values:
     * 
     * <ul>
     * <li>DDERR_NEWMODE</li>
     * <li>DDERR_NODRIVERSUPPORT</li>
     * <li>DDERR_NOMONITORINFORMATION</li>
     * <li>DDERR_TESTFINISHED</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-startmodetest
     */
    StartModeTest(param0, param1, param2) {
        result := ComCall(28, this, "ptr", param0, "uint", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * Used after a call to IDirectDraw7::StartModeTest to pass or fail each mode that the test presents and to step through the modes until the test is complete.
     * @remarks
     * You can use <b>EvaluateMode</b> in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-startmodetest">IDirectDraw7::StartModeTest</a> method to determine the maximum refresh rate that an EDID monitor and display adapter combination can support for each screen resolution.
     * 
     * Specifically, a call to <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nf-ddraw-idirectdraw7-startmodetest">IDirectDraw7::StartModeTest</a> directs DirectDraw to establish a set of testable resolutions and to display a mode based on the first resolution in the set. Subsequent calls to <b>EvaluateMode</b> can be used to pass or fail each mode and to advance the test to the next display mode. The method steps through the testable resolutions starting with the highest refresh rate supported for a given resolution. After a refresh rate for a given resolution passes, testing of lower refresh rates for that resolution is skipped.
     * 
     * 
     * 
     * When the test is initiated, or whenever a mode is passed or failed, DirectDraw begins a 15 second timeout. An application can monitor the time remaining without passing or failing the current mode by calling <b>EvaluateMode</b> with a value of 0 for the dwFlags argument. Note that DirectDraw only changes modes or terminates the test when <b>EvaluateMode</b> is called. However, if an application calls <b>EvaluateMode</b> after the timeout period has elapsed, the current mode fails, regardless of the value passed to the <i>dwFlags</i> parameter.
     * @param {Integer} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails or on completion, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_TESTFINISHED</li>
     * <li>DDERR_NEWMODE</li>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NOTFOUND </li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/ddraw/nf-ddraw-idirectdraw7-evaluatemode
     */
    EvaluateMode(param0, param1) {
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"

        result := ComCall(29, this, "uint", param0, param1Marshal, param1, "HRESULT")
        return result
    }
}
