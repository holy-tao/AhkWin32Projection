#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\Gdi\PALETTEENTRY.ahk" { PALETTEENTRY }
#Import ".\IDirectDrawPalette.ahk" { IDirectDrawPalette }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IDirectDrawSurface.ahk" { IDirectDrawSurface }
#Import ".\DDSURFACEDESC.ahk" { DDSURFACEDESC }
#Import ".\DDCAPS_DX7.ahk" { DDCAPS_DX7 }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDirectDrawClipper.ahk" { IDirectDrawClipper }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct IDirectDraw extends IUnknown {
    /**
     * The interface identifier for IDirectDraw
     * @type {Guid}
     */
    static IID := Guid("{6c14db80-a733-11ce-a521-0020af0be560}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectDraw interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Compact                : IntPtr
        CreateClipper          : IntPtr
        CreatePalette          : IntPtr
        CreateSurface          : IntPtr
        DuplicateSurface       : IntPtr
        EnumDisplayModes       : IntPtr
        EnumSurfaces           : IntPtr
        FlipToGDISurface       : IntPtr
        GetCaps                : IntPtr
        GetDisplayMode         : IntPtr
        GetFourCCCodes         : IntPtr
        GetGDISurface          : IntPtr
        GetMonitorFrequency    : IntPtr
        GetScanLine            : IntPtr
        GetVerticalBlankStatus : IntPtr
        Initialize             : IntPtr
        RestoreDisplayMode     : IntPtr
        SetCooperativeLevel    : IntPtr
        SetDisplayMode         : IntPtr
        WaitForVerticalBlank   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectDraw.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-createpalette
     */
    CreatePalette(param0, param1, param3) {
        result := ComCall(5, this, "uint", param0, PALETTEENTRY.Ptr, param1, "ptr*", &param2 := 0, "ptr", param3, "HRESULT")
        return IDirectDrawPalette(param2)
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} param0 
     * @param {IUnknown} param2 
     * @returns {IDirectDrawSurface} 
     */
    CreateSurface(param0, param2) {
        result := ComCall(6, this, DDSURFACEDESC.Ptr, param0, "ptr*", &param1 := 0, "ptr", param2, "HRESULT")
        return IDirectDrawSurface(param1)
    }

    /**
     * 
     * @param {IDirectDrawSurface} param0 
     * @returns {IDirectDrawSurface} 
     */
    DuplicateSurface(param0) {
        result := ComCall(7, this, "ptr", param0, "ptr*", &param1 := 0, "HRESULT")
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

        result := ComCall(8, this, "uint", param0, DDSURFACEDESC.Ptr, param1, param2Marshal, param2, "ptr", param3, "HRESULT")
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

        result := ComCall(9, this, "uint", param0, DDSURFACEDESC.Ptr, param1, param2Marshal, param2, "ptr", param3, "HRESULT")
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
        result := ComCall(11, this, DDCAPS_DX7.Ptr, param0, DDCAPS_DX7.Ptr, param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} param0 
     * @returns {HRESULT} 
     */
    GetDisplayMode(param0) {
        result := ComCall(12, this, DDSURFACEDESC.Ptr, param0, "HRESULT")
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
     * @returns {IDirectDrawSurface} 
     */
    GetGDISurface() {
        result := ComCall(14, this, "ptr*", &param0 := 0, "HRESULT")
        return IDirectDrawSurface(param0)
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
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(param0) {
        result := ComCall(18, this, Guid.Ptr, param0, "HRESULT")
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
        result := ComCall(20, this, HWND, param0, "uint", param1, "HRESULT")
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
        result := ComCall(21, this, "uint", param0, "uint", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {HANDLE} param1 
     * @returns {HRESULT} 
     */
    WaitForVerticalBlank(param0, param1) {
        result := ComCall(22, this, "uint", param0, HANDLE, param1, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectDraw.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Compact := CallbackCreate(GetMethod(implObj, "Compact"), flags, 1)
        this.vtbl.CreateClipper := CallbackCreate(GetMethod(implObj, "CreateClipper"), flags, 4)
        this.vtbl.CreatePalette := CallbackCreate(GetMethod(implObj, "CreatePalette"), flags, 5)
        this.vtbl.CreateSurface := CallbackCreate(GetMethod(implObj, "CreateSurface"), flags, 4)
        this.vtbl.DuplicateSurface := CallbackCreate(GetMethod(implObj, "DuplicateSurface"), flags, 3)
        this.vtbl.EnumDisplayModes := CallbackCreate(GetMethod(implObj, "EnumDisplayModes"), flags, 5)
        this.vtbl.EnumSurfaces := CallbackCreate(GetMethod(implObj, "EnumSurfaces"), flags, 5)
        this.vtbl.FlipToGDISurface := CallbackCreate(GetMethod(implObj, "FlipToGDISurface"), flags, 1)
        this.vtbl.GetCaps := CallbackCreate(GetMethod(implObj, "GetCaps"), flags, 3)
        this.vtbl.GetDisplayMode := CallbackCreate(GetMethod(implObj, "GetDisplayMode"), flags, 2)
        this.vtbl.GetFourCCCodes := CallbackCreate(GetMethod(implObj, "GetFourCCCodes"), flags, 3)
        this.vtbl.GetGDISurface := CallbackCreate(GetMethod(implObj, "GetGDISurface"), flags, 2)
        this.vtbl.GetMonitorFrequency := CallbackCreate(GetMethod(implObj, "GetMonitorFrequency"), flags, 2)
        this.vtbl.GetScanLine := CallbackCreate(GetMethod(implObj, "GetScanLine"), flags, 2)
        this.vtbl.GetVerticalBlankStatus := CallbackCreate(GetMethod(implObj, "GetVerticalBlankStatus"), flags, 2)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.RestoreDisplayMode := CallbackCreate(GetMethod(implObj, "RestoreDisplayMode"), flags, 1)
        this.vtbl.SetCooperativeLevel := CallbackCreate(GetMethod(implObj, "SetCooperativeLevel"), flags, 3)
        this.vtbl.SetDisplayMode := CallbackCreate(GetMethod(implObj, "SetDisplayMode"), flags, 4)
        this.vtbl.WaitForVerticalBlank := CallbackCreate(GetMethod(implObj, "WaitForVerticalBlank"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Compact)
        CallbackFree(this.vtbl.CreateClipper)
        CallbackFree(this.vtbl.CreatePalette)
        CallbackFree(this.vtbl.CreateSurface)
        CallbackFree(this.vtbl.DuplicateSurface)
        CallbackFree(this.vtbl.EnumDisplayModes)
        CallbackFree(this.vtbl.EnumSurfaces)
        CallbackFree(this.vtbl.FlipToGDISurface)
        CallbackFree(this.vtbl.GetCaps)
        CallbackFree(this.vtbl.GetDisplayMode)
        CallbackFree(this.vtbl.GetFourCCCodes)
        CallbackFree(this.vtbl.GetGDISurface)
        CallbackFree(this.vtbl.GetMonitorFrequency)
        CallbackFree(this.vtbl.GetScanLine)
        CallbackFree(this.vtbl.GetVerticalBlankStatus)
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.RestoreDisplayMode)
        CallbackFree(this.vtbl.SetCooperativeLevel)
        CallbackFree(this.vtbl.SetDisplayMode)
        CallbackFree(this.vtbl.WaitForVerticalBlank)
    }
}
