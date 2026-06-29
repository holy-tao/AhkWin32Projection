#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HINSTANCE.ahk" { HINSTANCE }
#Import ".\IDirectInputDeviceW.ahk" { IDirectInputDeviceW }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
export default struct IDirectInputW extends IUnknown {
    /**
     * The interface identifier for IDirectInputW
     * @type {Guid}
     */
    static IID := Guid("{89521361-aa8a-11cf-bfc7-444553540000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectInputW interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateDevice    : IntPtr
        EnumDevices     : IntPtr
        GetDeviceStatus : IntPtr
        RunControlPanel : IntPtr
        Initialize      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectInputW.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {IUnknown} param2 
     * @returns {IDirectInputDeviceW} 
     */
    CreateDevice(param0, param2) {
        result := ComCall(3, this, Guid.Ptr, param0, "ptr*", &param1 := 0, "ptr", param2, "HRESULT")
        return IDirectInputDeviceW(param1)
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<LPDIENUMDEVICESCALLBACKW>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    EnumDevices(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", param0, "ptr", param1, param2Marshal, param2, "uint", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @returns {HRESULT} 
     */
    GetDeviceStatus(param0) {
        result := ComCall(5, this, Guid.Ptr, param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    RunControlPanel(param0, param1) {
        result := ComCall(6, this, HWND, param0, "uint", param1, "HRESULT")
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
     * @param {HINSTANCE} param0 
     * @param {Integer} param1 
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
        result := ComCall(7, this, HINSTANCE, param0, "uint", param1, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectInputW.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDevice := CallbackCreate(GetMethod(implObj, "CreateDevice"), flags, 4)
        this.vtbl.EnumDevices := CallbackCreate(GetMethod(implObj, "EnumDevices"), flags, 5)
        this.vtbl.GetDeviceStatus := CallbackCreate(GetMethod(implObj, "GetDeviceStatus"), flags, 2)
        this.vtbl.RunControlPanel := CallbackCreate(GetMethod(implObj, "RunControlPanel"), flags, 3)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDevice)
        CallbackFree(this.vtbl.EnumDevices)
        CallbackFree(this.vtbl.GetDeviceStatus)
        CallbackFree(this.vtbl.RunControlPanel)
        CallbackFree(this.vtbl.Initialize)
    }
}
