#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DDSCAPS.ahk" { DDSCAPS }
#Import ".\DDBLTFX.ahk" { DDBLTFX }
#Import ".\IDirectDrawPalette.ahk" { IDirectDrawPalette }
#Import ".\DDOVERLAYFX.ahk" { DDOVERLAYFX }
#Import ".\IDirectDraw.ahk" { IDirectDraw }
#Import ".\IDirectDrawClipper.ahk" { IDirectDrawClipper }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DDSURFACEDESC.ahk" { DDSURFACEDESC }
#Import ".\DDCOLORKEY.ahk" { DDCOLORKEY }
#Import "..\Gdi\HDC.ahk" { HDC }
#Import ".\DDPIXELFORMAT.ahk" { DDPIXELFORMAT }
#Import ".\DDBLTBATCH.ahk" { DDBLTBATCH }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct IDirectDrawSurface extends IUnknown {
    /**
     * The interface identifier for IDirectDrawSurface
     * @type {Guid}
     */
    static IID := Guid("{6c14db81-a733-11ce-a521-0020af0be560}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectDrawSurface interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddAttachedSurface    : IntPtr
        AddOverlayDirtyRect   : IntPtr
        Blt                   : IntPtr
        BltBatch              : IntPtr
        BltFast               : IntPtr
        DeleteAttachedSurface : IntPtr
        EnumAttachedSurfaces  : IntPtr
        EnumOverlayZOrders    : IntPtr
        Flip                  : IntPtr
        GetAttachedSurface    : IntPtr
        GetBltStatus          : IntPtr
        GetCaps               : IntPtr
        GetClipper            : IntPtr
        GetColorKey           : IntPtr
        GetDC                 : IntPtr
        GetFlipStatus         : IntPtr
        GetOverlayPosition    : IntPtr
        GetPalette            : IntPtr
        GetPixelFormat        : IntPtr
        GetSurfaceDesc        : IntPtr
        Initialize            : IntPtr
        IsLost                : IntPtr
        Lock                  : IntPtr
        ReleaseDC             : IntPtr
        Restore               : IntPtr
        SetClipper            : IntPtr
        SetColorKey           : IntPtr
        SetOverlayPosition    : IntPtr
        SetPalette            : IntPtr
        Unlock                : IntPtr
        UpdateOverlay         : IntPtr
        UpdateOverlayDisplay  : IntPtr
        UpdateOverlayZOrder   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectDrawSurface.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IDirectDrawSurface} param0 
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
        result := ComCall(4, this, RECT.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} param0 
     * @param {IDirectDrawSurface} param1 
     * @param {Pointer<RECT>} param2 
     * @param {Integer} param3 
     * @param {Pointer<DDBLTFX>} param4 
     * @returns {HRESULT} 
     */
    Blt(param0, param1, param2, param3, param4) {
        result := ComCall(5, this, RECT.Ptr, param0, "ptr", param1, RECT.Ptr, param2, "uint", param3, DDBLTFX.Ptr, param4, "HRESULT")
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
        result := ComCall(6, this, DDBLTBATCH.Ptr, param0, "uint", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {IDirectDrawSurface} param2 
     * @param {Pointer<RECT>} param3 
     * @param {Integer} param4 
     * @returns {HRESULT} 
     */
    BltFast(param0, param1, param2, param3, param4) {
        result := ComCall(7, this, "uint", param0, "uint", param1, "ptr", param2, RECT.Ptr, param3, "uint", param4, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {IDirectDrawSurface} param1 
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
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, param0Marshal, param0, "ptr", param1, "HRESULT")
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
        param1Marshal := param1 is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "uint", param0, param1Marshal, param1, "ptr", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDrawSurface} param0 
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
     * @returns {IDirectDrawSurface} 
     */
    GetAttachedSurface(param0) {
        result := ComCall(12, this, DDSCAPS.Ptr, param0, "ptr*", &param1 := 0, "HRESULT")
        return IDirectDrawSurface(param1)
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
        result := ComCall(14, this, DDSCAPS.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDirectDrawClipper} 
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
     */
    GetColorKey(param0, param1) {
        result := ComCall(16, this, "uint", param0, DDCOLORKEY.Ptr, param1, "HRESULT")
        return result
    }

    /**
     * The GetDC function retrieves a handle to a device context (DC) for the client area of a specified window or for the entire screen.
     * @remarks
     * The <b>GetDC</b> function retrieves a common, class, or private DC depending on the class style of the specified window. For class and private DCs, <b>GetDC</b> leaves the previously assigned attributes unchanged. However, for common DCs, <b>GetDC</b> assigns default attributes to the DC each time it is retrieved. For example, the default font is System, which is a bitmap font. Because of this, the handle to a common DC returned by <b>GetDC</b> does not tell you what font, color, or brush was used when the window was drawn. To determine the font, call <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gettextfacea">GetTextFace</a>.
     * 
     * Note that the handle to the DC can only be used by a single thread at any one time.
     * 
     * After painting with a common DC, the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-releasedc">ReleaseDC</a> function must be called to release the DC. Class and private DCs do not have to be released. <b>ReleaseDC</b> must be called from the same thread that called <b>GetDC</b>. The number of DCs is limited only by available memory.
     * @param {Pointer<HDC>} param0 
     * @returns {HRESULT} If the function succeeds, the return value is a handle to the DC for the specified window's client area.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getdc
     */
    GetDC(param0) {
        result := ComCall(17, this, HDC.Ptr, param0, "HRESULT")
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
        param0Marshal := param0 is VarRef ? "int*" : "ptr"
        param1Marshal := param1 is VarRef ? "int*" : "ptr"

        result := ComCall(19, this, param0Marshal, param0, param1Marshal, param1, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IDirectDrawPalette} 
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
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getpixelformat
     */
    GetPixelFormat(param0) {
        result := ComCall(21, this, DDPIXELFORMAT.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDSURFACEDESC>} param0 
     * @returns {HRESULT} 
     */
    GetSurfaceDesc(param0) {
        result := ComCall(22, this, DDSURFACEDESC.Ptr, param0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(param0, param1) {
        result := ComCall(23, this, "ptr", param0, DDSURFACEDESC.Ptr, param1, "HRESULT")
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
     * Dismounts the volume and removes the volume's encryption key from system memory.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {Pointer<RECT>} param0 
     * @param {Pointer<DDSURFACEDESC>} param1 
     * @param {Integer} param2 
     * @param {HANDLE} param3 
     * @returns {HRESULT} Type: **uint32**
     * 
     * This method returns one of the following codes or another error code if it fails.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                           | Description                                                                                                                                                               |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                           | The method was successful.<br/>                                                                                                                                     |
     * | <dl> <dt>**E\_ACCESS\_DENIED**</dt> <dt>2147942405 (0x80070005)</dt> </dl>               | Applications are accessing this volume. If all access is nonexclusive, specifying the *ForceDismount* parameter as true allows the method to run successfully.<br/> |
     * | <dl> <dt>**FVE\_E\_NOT\_ENCRYPTED**</dt> <dt>2150694913 (0x80310001)</dt> </dl>          | The volume is fully decrypted and cannot be locked.<br/>                                                                                                            |
     * | <dl> <dt>**FVE\_E\_PROTECTION\_DISABLED**</dt> <dt>2150694945 (0x80310021)</dt> </dl>    | The volume's encryption key is available in the clear on the disk, preventing the volume from being locked.<br/>                                                    |
     * | <dl> <dt>**FVE\_E\_RECOVERY\_KEY\_REQUIRED**</dt> <dt>2150694946 (0x80310022)</dt> </dl> | The volume does not have key protectors of the type "Numerical Password" or "External Key" that are necessary to unlock the volume.<br/>                            |
     * @see https://learn.microsoft.com/windows/win32/SecProv/lock-win32-encryptablevolume
     */
    Lock(param0, param1, param2, param3) {
        result := ComCall(25, this, RECT.Ptr, param0, DDSURFACEDESC.Ptr, param1, "uint", param2, HANDLE, param3, "HRESULT")
        return result
    }

    /**
     * The ReleaseDC function releases a device context (DC), freeing it for use by other applications. The effect of the ReleaseDC function depends on the type of DC. It frees only common and window DCs. It has no effect on class or private DCs.
     * @remarks
     * The application must call the <b>ReleaseDC</b> function for each call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getwindowdc">GetWindowDC</a> function and for each call to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdc">GetDC</a> function that retrieves a common DC.
     * 
     * An application cannot use the <b>ReleaseDC</b> function to release a DC that was created by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdca">CreateDC</a> function; instead, it must use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-deletedc">DeleteDC</a> function. <b>ReleaseDC</b> must be called from the same thread that called <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getdc">GetDC</a>.
     * @param {HDC} param0 
     * @returns {HRESULT} The return value indicates whether the DC was released. If the DC was released, the return value is 1.
     * 
     * If the DC was not released, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-releasedc
     */
    ReleaseDC(param0) {
        result := ComCall(26, this, HDC, param0, "HRESULT")
        return result
    }

    /**
     * Initiates a system restore.
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/sr/restore-systemrestore
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
        result := ComCall(29, this, "uint", param0, DDCOLORKEY.Ptr, param1, "HRESULT")
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
        param0Marshal := param0 is VarRef ? "ptr" : "ptr"

        result := ComCall(32, this, param0Marshal, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} param0 
     * @param {IDirectDrawSurface} param1 
     * @param {Pointer<RECT>} param2 
     * @param {Integer} param3 
     * @param {Pointer<DDOVERLAYFX>} param4 
     * @returns {HRESULT} 
     */
    UpdateOverlay(param0, param1, param2, param3, param4) {
        result := ComCall(33, this, RECT.Ptr, param0, "ptr", param1, RECT.Ptr, param2, "uint", param3, DDOVERLAYFX.Ptr, param4, "HRESULT")
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
     * @param {IDirectDrawSurface} param1 
     * @returns {HRESULT} 
     */
    UpdateOverlayZOrder(param0, param1) {
        result := ComCall(35, this, "uint", param0, "ptr", param1, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectDrawSurface.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddAttachedSurface := CallbackCreate(GetMethod(implObj, "AddAttachedSurface"), flags, 2)
        this.vtbl.AddOverlayDirtyRect := CallbackCreate(GetMethod(implObj, "AddOverlayDirtyRect"), flags, 2)
        this.vtbl.Blt := CallbackCreate(GetMethod(implObj, "Blt"), flags, 6)
        this.vtbl.BltBatch := CallbackCreate(GetMethod(implObj, "BltBatch"), flags, 4)
        this.vtbl.BltFast := CallbackCreate(GetMethod(implObj, "BltFast"), flags, 6)
        this.vtbl.DeleteAttachedSurface := CallbackCreate(GetMethod(implObj, "DeleteAttachedSurface"), flags, 3)
        this.vtbl.EnumAttachedSurfaces := CallbackCreate(GetMethod(implObj, "EnumAttachedSurfaces"), flags, 3)
        this.vtbl.EnumOverlayZOrders := CallbackCreate(GetMethod(implObj, "EnumOverlayZOrders"), flags, 4)
        this.vtbl.Flip := CallbackCreate(GetMethod(implObj, "Flip"), flags, 3)
        this.vtbl.GetAttachedSurface := CallbackCreate(GetMethod(implObj, "GetAttachedSurface"), flags, 3)
        this.vtbl.GetBltStatus := CallbackCreate(GetMethod(implObj, "GetBltStatus"), flags, 2)
        this.vtbl.GetCaps := CallbackCreate(GetMethod(implObj, "GetCaps"), flags, 2)
        this.vtbl.GetClipper := CallbackCreate(GetMethod(implObj, "GetClipper"), flags, 2)
        this.vtbl.GetColorKey := CallbackCreate(GetMethod(implObj, "GetColorKey"), flags, 3)
        this.vtbl.GetDC := CallbackCreate(GetMethod(implObj, "GetDC"), flags, 2)
        this.vtbl.GetFlipStatus := CallbackCreate(GetMethod(implObj, "GetFlipStatus"), flags, 2)
        this.vtbl.GetOverlayPosition := CallbackCreate(GetMethod(implObj, "GetOverlayPosition"), flags, 3)
        this.vtbl.GetPalette := CallbackCreate(GetMethod(implObj, "GetPalette"), flags, 2)
        this.vtbl.GetPixelFormat := CallbackCreate(GetMethod(implObj, "GetPixelFormat"), flags, 2)
        this.vtbl.GetSurfaceDesc := CallbackCreate(GetMethod(implObj, "GetSurfaceDesc"), flags, 2)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.IsLost := CallbackCreate(GetMethod(implObj, "IsLost"), flags, 1)
        this.vtbl.Lock := CallbackCreate(GetMethod(implObj, "Lock"), flags, 5)
        this.vtbl.ReleaseDC := CallbackCreate(GetMethod(implObj, "ReleaseDC"), flags, 2)
        this.vtbl.Restore := CallbackCreate(GetMethod(implObj, "Restore"), flags, 1)
        this.vtbl.SetClipper := CallbackCreate(GetMethod(implObj, "SetClipper"), flags, 2)
        this.vtbl.SetColorKey := CallbackCreate(GetMethod(implObj, "SetColorKey"), flags, 3)
        this.vtbl.SetOverlayPosition := CallbackCreate(GetMethod(implObj, "SetOverlayPosition"), flags, 3)
        this.vtbl.SetPalette := CallbackCreate(GetMethod(implObj, "SetPalette"), flags, 2)
        this.vtbl.Unlock := CallbackCreate(GetMethod(implObj, "Unlock"), flags, 2)
        this.vtbl.UpdateOverlay := CallbackCreate(GetMethod(implObj, "UpdateOverlay"), flags, 6)
        this.vtbl.UpdateOverlayDisplay := CallbackCreate(GetMethod(implObj, "UpdateOverlayDisplay"), flags, 2)
        this.vtbl.UpdateOverlayZOrder := CallbackCreate(GetMethod(implObj, "UpdateOverlayZOrder"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddAttachedSurface)
        CallbackFree(this.vtbl.AddOverlayDirtyRect)
        CallbackFree(this.vtbl.Blt)
        CallbackFree(this.vtbl.BltBatch)
        CallbackFree(this.vtbl.BltFast)
        CallbackFree(this.vtbl.DeleteAttachedSurface)
        CallbackFree(this.vtbl.EnumAttachedSurfaces)
        CallbackFree(this.vtbl.EnumOverlayZOrders)
        CallbackFree(this.vtbl.Flip)
        CallbackFree(this.vtbl.GetAttachedSurface)
        CallbackFree(this.vtbl.GetBltStatus)
        CallbackFree(this.vtbl.GetCaps)
        CallbackFree(this.vtbl.GetClipper)
        CallbackFree(this.vtbl.GetColorKey)
        CallbackFree(this.vtbl.GetDC)
        CallbackFree(this.vtbl.GetFlipStatus)
        CallbackFree(this.vtbl.GetOverlayPosition)
        CallbackFree(this.vtbl.GetPalette)
        CallbackFree(this.vtbl.GetPixelFormat)
        CallbackFree(this.vtbl.GetSurfaceDesc)
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.IsLost)
        CallbackFree(this.vtbl.Lock)
        CallbackFree(this.vtbl.ReleaseDC)
        CallbackFree(this.vtbl.Restore)
        CallbackFree(this.vtbl.SetClipper)
        CallbackFree(this.vtbl.SetColorKey)
        CallbackFree(this.vtbl.SetOverlayPosition)
        CallbackFree(this.vtbl.SetPalette)
        CallbackFree(this.vtbl.Unlock)
        CallbackFree(this.vtbl.UpdateOverlay)
        CallbackFree(this.vtbl.UpdateOverlayDisplay)
        CallbackFree(this.vtbl.UpdateOverlayZOrder)
    }
}
