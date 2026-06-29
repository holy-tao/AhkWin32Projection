#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDialEventSink.ahk" { IDialEventSink }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Networking.WinInet
 */
export default struct IDialEngine extends IUnknown {
    /**
     * The interface identifier for IDialEngine
     * @type {Guid}
     */
    static IID := Guid("{39fd782b-7905-40d5-9148-3c9b190423d5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDialEngine interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize        : IntPtr
        GetProperty       : IntPtr
        SetProperty       : IntPtr
        Dial              : IntPtr
        HangUp            : IntPtr
        GetConnectedState : IntPtr
        GetConnectHandle  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDialEngine.Vtbl()
        }
        super.__New(implObj, flags)
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
     * @param {PWSTR} pwzConnectoid 
     * @param {IDialEventSink} pIDES 
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
    Initialize(pwzConnectoid, pIDES) {
        pwzConnectoid := pwzConnectoid is String ? StrPtr(pwzConnectoid) : pwzConnectoid

        result := ComCall(3, this, "ptr", pwzConnectoid, "ptr", pIDES, "HRESULT")
        return result
    }

    /**
     * The GetProperty function returns a handle to a given property.
     * @remarks
     * The **GetProperty** function can be used to obtain the property handle needed to locate instances of the property. The functions used to locate property instances are [FindPropertyInstance](findpropertyinstance.md) (which locates the first instance) and [FindPropertyInstanceRestart](findpropertyinstancerestart.md) (which locates the next instance).
     * 
     * [*Experts*](e.md) and [*parsers*](p.md) can call the **GetProperty** function.
     * @param {PWSTR} pwzProperty 
     * @param {PWSTR} pwzValue 
     * @param {Integer} dwBufSize 
     * @returns {HRESULT} If the function is successful, the return value is the handle to the property.
     * 
     * If the function is unsuccessful, the return value is **NULL**.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/getproperty
     */
    GetProperty(pwzProperty, pwzValue, dwBufSize) {
        pwzProperty := pwzProperty is String ? StrPtr(pwzProperty) : pwzProperty
        pwzValue := pwzValue is String ? StrPtr(pwzValue) : pwzValue

        result := ComCall(4, this, "ptr", pwzProperty, "ptr", pwzValue, "uint", dwBufSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzProperty 
     * @param {PWSTR} pwzValue 
     * @returns {HRESULT} 
     */
    SetProperty(pwzProperty, pwzValue) {
        pwzProperty := pwzProperty is String ? StrPtr(pwzProperty) : pwzProperty
        pwzValue := pwzValue is String ? StrPtr(pwzValue) : pwzValue

        result := ComCall(5, this, "ptr", pwzProperty, "ptr", pwzValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Dial() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    HangUp() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetConnectedState() {
        result := ComCall(8, this, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * 
     * @returns {Pointer} 
     */
    GetConnectHandle() {
        result := ComCall(9, this, "ptr*", &pdwHandle := 0, "HRESULT")
        return pdwHandle
    }

    Query(iid) {
        if (IDialEngine.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 4)
        this.vtbl.SetProperty := CallbackCreate(GetMethod(implObj, "SetProperty"), flags, 3)
        this.vtbl.Dial := CallbackCreate(GetMethod(implObj, "Dial"), flags, 1)
        this.vtbl.HangUp := CallbackCreate(GetMethod(implObj, "HangUp"), flags, 1)
        this.vtbl.GetConnectedState := CallbackCreate(GetMethod(implObj, "GetConnectedState"), flags, 2)
        this.vtbl.GetConnectHandle := CallbackCreate(GetMethod(implObj, "GetConnectHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetProperty)
        CallbackFree(this.vtbl.SetProperty)
        CallbackFree(this.vtbl.Dial)
        CallbackFree(this.vtbl.HangUp)
        CallbackFree(this.vtbl.GetConnectedState)
        CallbackFree(this.vtbl.GetConnectHandle)
    }
}
