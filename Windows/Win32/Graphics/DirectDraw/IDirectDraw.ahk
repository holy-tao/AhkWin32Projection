#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectDrawClipper.ahk
#Include .\IDirectDrawPalette.ahk
#Include .\IDirectDrawSurface.ahk
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
 * @see https://learn.microsoft.com/windows/win32/api//content/ddraw/nn-ddraw-idirectdraw7
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDirectDraw extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDraw
     * @type {Guid}
     */
    static IID => Guid("{6c14db80-a733-11ce-a521-0020af0be560}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Compact", "CreateClipper", "CreatePalette", "CreateSurface", "DuplicateSurface", "EnumDisplayModes", "EnumSurfaces", "FlipToGDISurface", "GetCaps", "GetDisplayMode", "GetFourCCCodes", "GetGDISurface", "GetMonitorFrequency", "GetScanLine", "GetVerticalBlankStatus", "Initialize", "RestoreDisplayMode", "SetCooperativeLevel", "SetDisplayMode", "WaitForVerticalBlank"]

    /**
     * Learn more about: CompactGrbit enumeration
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/extensible-storage-engine/compactgrbit-enumeration
     */
    Compact() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {IUnknown} param2 
     * @returns {IDirectDrawClipper} 
     */
    CreateClipper(param0, param2) {
        result := ComCall(4, this, "uint", param0, "ptr*", &param1 := 0, "ptr", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirectDrawClipper(param1)
    }

    /**
     * The CreatePalette function creates a logical palette.
     * @remarks
     * An application can determine whether a device supports palette operations by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-getdevicecaps">GetDeviceCaps</a> function and specifying the RASTERCAPS constant.
     * 
     * Once an application creates a logical palette, it can select that palette into a device context by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-selectpalette">SelectPalette</a> function. A palette selected into a device context can be realized by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-realizepalette">RealizePalette</a> function.
     * 
     * When you no longer need the palette, call the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deleteobject">DeleteObject</a> function to delete it.
     * @param {Integer} param0 
     * @param {Pointer<PALETTEENTRY>} param1 
     * @param {IUnknown} param3 
     * @returns {IDirectDrawPalette} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-createpalette
     */
    CreatePalette(param0, param1, param3) {
        result := ComCall(5, this, "uint", param0, "ptr", param1, "ptr*", &param2 := 0, "ptr", param3, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirectDrawPalette(param2)
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} param0 
     * @param {IUnknown} param2 
     * @returns {IDirectDrawSurface} 
     */
    CreateSurface(param0, param2) {
        result := ComCall(6, this, "ptr", param0, "ptr*", &param1 := 0, "ptr", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirectDrawSurface(param1)
    }

    /**
     * 
     * @param {IDirectDrawSurface} param0 
     * @returns {IDirectDrawSurface} 
     */
    DuplicateSurface(param0) {
        result := ComCall(7, this, "ptr", param0, "ptr*", &param1 := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirectDrawSurface(param1)
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DDSURFACEDESC>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Pointer<LPDDENUMMODESCALLBACK>} param3 
     * @returns {HRESULT} 
     */
    EnumDisplayModes(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", param0, "ptr", param1, param2Marshal, param2, "ptr", param3, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DDSURFACEDESC>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Pointer<LPDDENUMSURFACESCALLBACK>} param3 
     * @returns {HRESULT} 
     */
    EnumSurfaces(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, "uint", param0, "ptr", param1, param2Marshal, param2, "ptr", param3, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FlipToGDISurface() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<DDCAPS_DX7>} param0 
     * @param {Pointer<DDCAPS_DX7>} param1 
     * @returns {HRESULT} 
     */
    GetCaps(param0, param1) {
        result := ComCall(11, this, "ptr", param0, "ptr", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} param0 
     * @returns {HRESULT} 
     */
    GetDisplayMode(param0) {
        result := ComCall(12, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @param {Pointer<Integer>} param1 
     * @returns {HRESULT} 
     */
    GetFourCCCodes(param0, param1) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, param0Marshal, param0, param1Marshal, param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IDirectDrawSurface} 
     */
    GetGDISurface() {
        result := ComCall(14, this, "ptr*", &param0 := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirectDrawSurface(param0)
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     */
    GetMonitorFrequency(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, param0Marshal, param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     */
    GetScanLine(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, param0Marshal, param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} param0 
     * @returns {HRESULT} 
     */
    GetVerticalBlankStatus(param0) {
        param0Marshal := param0 is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, param0Marshal, param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * @param {Pointer<Guid>} param0 
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
     * @see https://learn.microsoft.com/windows/win32/api//content/roapi/nf-roapi-initialize
     */
    Initialize(param0) {
        result := ComCall(18, this, "ptr", param0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestoreDisplayMode() {
        result := ComCall(19, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetCooperativeLevel(param0, param1) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(20, this, "ptr", param0, "uint", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    SetDisplayMode(param0, param1, param2) {
        result := ComCall(21, this, "uint", param0, "uint", param1, "uint", param2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {HANDLE} param1 
     * @returns {HRESULT} 
     */
    WaitForVerticalBlank(param0, param1) {
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1

        result := ComCall(22, this, "uint", param0, "ptr", param1, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
