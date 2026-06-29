#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INetCfgComponent.ahk" { INetCfgComponent }
#Import ".\IEnumNetCfgComponent.ahk" { IEnumNetCfgComponent }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct INetCfg extends IUnknown {
    /**
     * The interface identifier for INetCfg
     * @type {Guid}
     */
    static IID := Guid("{c0e8ae93-306e-11d1-aacf-00805fc1270e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetCfg interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize       : IntPtr
        Uninitialize     : IntPtr
        Apply            : IntPtr
        Cancel           : IntPtr
        EnumComponents   : IntPtr
        FindComponent    : IntPtr
        QueryNetCfgClass : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetCfg.Vtbl()
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
    Initialize() {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "ptr", pvReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Uninitialize() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Apply() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidClass 
     * @returns {IEnumNetCfgComponent} 
     */
    EnumComponents(pguidClass) {
        result := ComCall(7, this, Guid.Ptr, pguidClass, "ptr*", &ppenumComponent := 0, "HRESULT")
        return IEnumNetCfgComponent(ppenumComponent)
    }

    /**
     * 
     * @param {PWSTR} pszwInfId 
     * @returns {INetCfgComponent} 
     */
    FindComponent(pszwInfId) {
        pszwInfId := pszwInfId is String ? StrPtr(pszwInfId) : pszwInfId

        result := ComCall(8, this, "ptr", pszwInfId, "ptr*", &pComponent := 0, "HRESULT")
        return INetCfgComponent(pComponent)
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidClass 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    QueryNetCfgClass(pguidClass, riid) {
        result := ComCall(9, this, Guid.Ptr, pguidClass, Guid.Ptr, riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    Query(iid) {
        if (INetCfg.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 2)
        this.vtbl.Uninitialize := CallbackCreate(GetMethod(implObj, "Uninitialize"), flags, 1)
        this.vtbl.Apply := CallbackCreate(GetMethod(implObj, "Apply"), flags, 1)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
        this.vtbl.EnumComponents := CallbackCreate(GetMethod(implObj, "EnumComponents"), flags, 3)
        this.vtbl.FindComponent := CallbackCreate(GetMethod(implObj, "FindComponent"), flags, 3)
        this.vtbl.QueryNetCfgClass := CallbackCreate(GetMethod(implObj, "QueryNetCfgClass"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Uninitialize)
        CallbackFree(this.vtbl.Apply)
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.EnumComponents)
        CallbackFree(this.vtbl.FindComponent)
        CallbackFree(this.vtbl.QueryNetCfgClass)
    }
}
