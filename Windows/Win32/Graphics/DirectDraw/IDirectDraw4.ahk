#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectDrawClipper.ahk
#Include .\IDirectDrawPalette.ahk
#Include .\IDirectDrawSurface4.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDirectDraw4 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDraw4
     * @type {Guid}
     */
    static IID => Guid("{9c59509a-39bd-11d1-8c4a-00c04fd930c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Compact", "CreateClipper", "CreatePalette", "CreateSurface", "DuplicateSurface", "EnumDisplayModes", "EnumSurfaces", "FlipToGDISurface", "GetCaps", "GetDisplayMode", "GetFourCCCodes", "GetGDISurface", "GetMonitorFrequency", "GetScanLine", "GetVerticalBlankStatus", "Initialize", "RestoreDisplayMode", "SetCooperativeLevel", "SetDisplayMode", "WaitForVerticalBlank", "GetAvailableVidMem", "GetSurfaceFromDC", "RestoreAllSurfaces", "TestCooperativeLevel", "GetDeviceIdentifier"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Compact() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {IUnknown} param2 
     * @returns {IDirectDrawClipper} 
     */
    CreateClipper(param0, param2) {
        result := ComCall(4, this, "uint", param0, "ptr*", &param1 := 0, "ptr", param2, "HRESULT")
        return IDirectDrawClipper(param1)
    }

    /**
     * The CreatePalette function creates a logical palette.
     * @param {Integer} param0 
     * @param {Pointer<PALETTEENTRY>} param1 
     * @param {IUnknown} param3 
     * @returns {IDirectDrawPalette} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createpalette
     */
    CreatePalette(param0, param1, param3) {
        result := ComCall(5, this, "uint", param0, "ptr", param1, "ptr*", &param2 := 0, "ptr", param3, "HRESULT")
        return IDirectDrawPalette(param2)
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC2>} param0 
     * @param {IUnknown} param2 
     * @returns {IDirectDrawSurface4} 
     */
    CreateSurface(param0, param2) {
        result := ComCall(6, this, "ptr", param0, "ptr*", &param1 := 0, "ptr", param2, "HRESULT")
        return IDirectDrawSurface4(param1)
    }

    /**
     * 
     * @param {IDirectDrawSurface4} param0 
     * @returns {IDirectDrawSurface4} 
     */
    DuplicateSurface(param0) {
        result := ComCall(7, this, "ptr", param0, "ptr*", &param1 := 0, "HRESULT")
        return IDirectDrawSurface4(param1)
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DDSURFACEDESC2>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Pointer<LPDDENUMMODESCALLBACK2>} param3 
     * @returns {HRESULT} 
     */
    EnumDisplayModes(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", param0, "ptr", param1, param2Marshal, param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DDSURFACEDESC2>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Pointer<LPDDENUMSURFACESCALLBACK2>} param3 
     * @returns {HRESULT} 
     */
    EnumSurfaces(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, "uint", param0, "ptr", param1, param2Marshal, param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FlipToGDISurface() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDCAPS_DX7>} param0 
     * @param {Pointer<DDCAPS_DX7>} param1 
     * @returns {HRESULT} 
     */
    GetCaps(param0, param1) {
        result := ComCall(11, this, "ptr", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC2>} param0 
     * @returns {HRESULT} 
     */
    GetDisplayMode(param0) {
        result := ComCall(12, this, "ptr", param0, "HRESULT")
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

        result := ComCall(13, this, param0Marshal, param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDirectDrawSurface4} 
     */
    GetGDISurface() {
        result := ComCall(14, this, "ptr*", &param0 := 0, "HRESULT")
        return IDirectDrawSurface4(param0)
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     */
    GetMonitorFrequency(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     */
    GetScanLine(param0) {
        param0Marshal := param0 is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} param0 
     * @returns {HRESULT} 
     */
    GetVerticalBlankStatus(param0) {
        param0Marshal := param0 is VarRef ? "int*" : "ptr"

        result := ComCall(17, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
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
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(param0) {
        result := ComCall(18, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestoreDisplayMode() {
        result := ComCall(19, this, "HRESULT")
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

        result := ComCall(20, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @returns {HRESULT} 
     */
    SetDisplayMode(param0, param1, param2, param3, param4) {
        result := ComCall(21, this, "uint", param0, "uint", param1, "uint", param2, "uint", param3, "uint", param4, "HRESULT")
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

        result := ComCall(22, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSCAPS2>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {HRESULT} 
     */
    GetAvailableVidMem(param0, param1, param2) {
        param1Marshal := param1 is VarRef ? "uint*" : "ptr"
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "ptr", param0, param1Marshal, param1, param2Marshal, param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HDC} param0 
     * @returns {IDirectDrawSurface4} 
     */
    GetSurfaceFromDC(param0) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0

        result := ComCall(24, this, "ptr", param0, "ptr*", &param1 := 0, "HRESULT")
        return IDirectDrawSurface4(param1)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RestoreAllSurfaces() {
        result := ComCall(25, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TestCooperativeLevel() {
        result := ComCall(26, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDDEVICEIDENTIFIER>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    GetDeviceIdentifier(param0, param1) {
        result := ComCall(27, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }
}
