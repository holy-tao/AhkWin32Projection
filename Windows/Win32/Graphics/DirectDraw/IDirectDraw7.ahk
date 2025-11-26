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
 * 
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
 * The <b>IDirectDraw7</b> interface extends the features of previous versions of the interface by offering methods that enable more flexible surface management than previous versions. All the surface-related methods in the <b>IDirectDraw7</b> interface accept slightly different parameters than their counterparts in the <b>IDirectDraw2</b> interface. Wherever an <b>IDirectDraw2</b> interface method might accept a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550339(v=vs.85)">DDSURFACEDESC</a> structure and retrieve an <b>IDirectDrawSurface3</b> interface, the methods in <b>IDirectDraw7</b> accept a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550340(v=vs.85)">DDSURFACEDESC2</a> structure and retrieve an <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nn-ddraw-idirectdrawsurface7">IDirectDrawSurface7</a> interface, instead.
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
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ddraw/nn-ddraw-idirectdraw7
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
     * This method is not currently implemented.
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-compact
     */
    Compact() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Creates a DirectDrawClipper object.
     * @param {Integer} param0 
     * @param {IUnknown} param2 
     * @returns {IDirectDrawClipper} 
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-createclipper
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-createpalette
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-createsurface
     */
    CreateSurface(param0, param2) {
        result := ComCall(6, this, "ptr", param0, "ptr*", &param1 := 0, "ptr", param2, "HRESULT")
        return IDirectDrawSurface7(param1)
    }

    /**
     * Duplicates a DirectDrawSurface object.
     * @param {IDirectDrawSurface7} param0 
     * @returns {IDirectDrawSurface7} 
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-duplicatesurface
     */
    DuplicateSurface(param0) {
        result := ComCall(7, this, "ptr", param0, "ptr*", &param1 := 0, "HRESULT")
        return IDirectDrawSurface7(param1)
    }

    /**
     * Enumerates all the display modes that the hardware exposes through the DirectDraw object and that are compatible with a provided surface description.
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-enumdisplaymodes
     */
    EnumDisplayModes(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", param0, "ptr", param1, param2Marshal, param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * Enumerates all the existing or possible surfaces that meet the specified surface description.
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-enumsurfaces
     */
    EnumSurfaces(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, "uint", param0, "ptr", param1, param2Marshal, param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * Makes the surface that the GDI writes to the primary surface.
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-fliptogdisurface
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-getcaps
     */
    GetCaps(param0, param1) {
        result := ComCall(11, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * Retrieves the current display mode.
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-getdisplaymode
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-getfourcccodes
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-getgdisurface
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-getmonitorfrequency
     */
    GetMonitorFrequency(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * Retrieves the scan line that is currently being drawn on the monitor.
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-getscanline
     */
    GetScanLine(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * Retrieves the status of the vertical blank.
     * @param {Pointer<BOOL>} param0 
     * @returns {HRESULT} If the method succeeds, the return value is DD_OK.
     * 
     * If it fails, the method can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_INVALIDOBJECT</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-getverticalblankstatus
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
     * This method is provided for compliance with the Component Object Model (COM). If you already used the <a href="/windows/desktop/api/ddraw/nf-ddraw-directdrawcreate">DirectDrawCreate</a> function to create a DirectDraw object, this method returns DDERR_ALREADYINITIALIZED. If you do not call <b>IDirectDraw7::Initialize</b> when you use <a href="/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> to create a DirectDraw object, any method that you call afterward returns DDERR_NOTINITIALIZED.
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-initialize
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-restoredisplaymode
     */
    RestoreDisplayMode() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * Determines the top-level behavior of the application.
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-setcooperativelevel
     */
    SetCooperativeLevel(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(20, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * Sets the mode of the display-device hardware.
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-setdisplaymode
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-waitforverticalblank
     */
    WaitForVerticalBlank(param0, param1) {
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1

        result := ComCall(22, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * Retrieves the total amount of display memory available and the amount of display memory currently free for a given type of surface.
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-getavailablevidmem
     */
    GetAvailableVidMem(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "ptr", param0, param1Marshal, param1, param2Marshal, param2, "HRESULT")
        return result
    }

    /**
     * Retrieves the IDirectDrawSurface7 interface for a surface, based on its GDI device context handle.
     * @param {HDC} param0 
     * @returns {IDirectDrawSurface7} 
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-getsurfacefromdc
     */
    GetSurfaceFromDC(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(24, this, "ptr", param0, "ptr*", &param1 := 0, "HRESULT")
        return IDirectDrawSurface7(param1)
    }

    /**
     * Restores all the surfaces that were created for the DirectDraw object, in the order that they were created.
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-restoreallsurfaces
     */
    RestoreAllSurfaces() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * Reports the current cooperative-level status of the DirectDraw device for a windowed or full-screen application.
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-testcooperativelevel
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-getdeviceidentifier
     */
    GetDeviceIdentifier(param0, param1) {
        result := ComCall(27, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * Initiates a test to update the system registry with refresh rate information for the current display adapter and monitor combination.
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-startmodetest
     */
    StartModeTest(param0, param1, param2) {
        result := ComCall(28, this, "ptr", param0, "uint", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * Used after a call to IDirectDraw7::StartModeTest to pass or fail each mode that the test presents and to step through the modes until the test is complete.
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
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-idirectdraw7-evaluatemode
     */
    EvaluateMode(param0, param1) {
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"

        result := ComCall(29, this, "uint", param0, param1Marshal, param1, "HRESULT")
        return result
    }
}
