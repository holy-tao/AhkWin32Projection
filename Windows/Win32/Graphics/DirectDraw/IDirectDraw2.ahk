#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDirectDraw2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDraw2
     * @type {Guid}
     */
    static IID => Guid("{b3a6f3e0-2b43-11cf-a2de-00aa00b93356}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Compact", "CreateClipper", "CreatePalette", "CreateSurface", "DuplicateSurface", "EnumDisplayModes", "EnumSurfaces", "FlipToGDISurface", "GetCaps", "GetDisplayMode", "GetFourCCCodes", "GetGDISurface", "GetMonitorFrequency", "GetScanLine", "GetVerticalBlankStatus", "Initialize", "RestoreDisplayMode", "SetCooperativeLevel", "SetDisplayMode", "WaitForVerticalBlank", "GetAvailableVidMem"]

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
     * @param {Pointer<IDirectDrawClipper>} param1 
     * @param {IUnknown} param2 
     * @returns {HRESULT} 
     */
    CreateClipper(param0, param1, param2) {
        result := ComCall(4, this, "uint", param0, "ptr*", param1, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * The CreatePalette function creates a logical palette.
     * @param {Integer} param0 
     * @param {Pointer<PALETTEENTRY>} param1 
     * @param {Pointer<IDirectDrawPalette>} param2 
     * @param {IUnknown} param3 
     * @returns {HRESULT} If the function succeeds, the return value is a handle to a logical palette.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createpalette
     */
    CreatePalette(param0, param1, param2, param3) {
        result := ComCall(5, this, "uint", param0, "ptr", param1, "ptr*", param2, "ptr", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} param0 
     * @param {Pointer<IDirectDrawSurface>} param1 
     * @param {IUnknown} param2 
     * @returns {HRESULT} 
     */
    CreateSurface(param0, param1, param2) {
        result := ComCall(6, this, "ptr", param0, "ptr*", param1, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDrawSurface} param0 
     * @param {Pointer<IDirectDrawSurface>} param1 
     * @returns {HRESULT} 
     */
    DuplicateSurface(param0, param1) {
        result := ComCall(7, this, "ptr", param0, "ptr*", param1, "HRESULT")
        return result
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
        result := ComCall(8, this, "uint", param0, "ptr", param1, "ptr", param2, "ptr", param3, "HRESULT")
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
        result := ComCall(9, this, "uint", param0, "ptr", param1, "ptr", param2, "ptr", param3, "HRESULT")
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
     * @param {Pointer<DDSURFACEDESC>} param0 
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
        result := ComCall(13, this, "uint*", param0, "uint*", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDrawSurface>} param0 
     * @returns {HRESULT} 
     */
    GetGDISurface(param0) {
        result := ComCall(14, this, "ptr*", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     */
    GetMonitorFrequency(param0) {
        result := ComCall(15, this, "uint*", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     */
    GetScanLine(param0) {
        result := ComCall(16, this, "uint*", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} param0 
     * @returns {HRESULT} 
     */
    GetVerticalBlankStatus(param0) {
        result := ComCall(17, this, "ptr", param0, "HRESULT")
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
     * @param {Pointer<DDSCAPS>} param0 
     * @param {Pointer<Integer>} param1 
     * @param {Pointer<Integer>} param2 
     * @returns {HRESULT} 
     */
    GetAvailableVidMem(param0, param1, param2) {
        result := ComCall(23, this, "ptr", param0, "uint*", param1, "uint*", param2, "HRESULT")
        return result
    }
}
