#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWdsTransportNamespaceScheduledCast.ahk" { IWdsTransportNamespaceScheduledCast }

/**
 * An administrator can specify criteria that starts transmission on an object of an IWdsTransportNamespaceScheduledCastAutoStart interface automatically. Applications can continue to join sessions of the namespace object until these criteria are reached.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportnamespacescheduledcastautostart
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportNamespaceScheduledCastAutoStart extends IWdsTransportNamespaceScheduledCast {
    /**
     * The interface identifier for IWdsTransportNamespaceScheduledCastAutoStart
     * @type {Guid}
     */
    static IID := Guid("{d606af3d-ea9c-4219-961e-7491d618d9b9}")

    /**
     * The class identifier for WdsTransportNamespaceScheduledCastAutoStart
     * @type {Guid}
     */
    static CLSID := Guid("{a1107052-122c-4b81-9b7c-386e6855383f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportNamespaceScheduledCastAutoStart interfaces
    */
    struct Vtbl extends IWdsTransportNamespaceScheduledCast.Vtbl {
        get_MinimumClients : IntPtr
        put_MinimumClients : IntPtr
        get_StartTime      : IntPtr
        put_StartTime      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportNamespaceScheduledCastAutoStart.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    MinimumClients {
        get => this.get_MinimumClients()
        set => this.put_MinimumClients(value)
    }

    /**
     * @type {Float} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * Retrieves or sets a condition that starts transmission automatically. Transmission starts if the number of applications that have joined sessions reaches the value of this property. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacescheduledcastautostart-get_minimumclients
     */
    get_MinimumClients() {
        result := ComCall(29, this, "uint*", &pulMinimumClients := 0, "HRESULT")
        return pulMinimumClients
    }

    /**
     * Retrieves or sets a condition that starts transmission automatically. Transmission starts if the number of applications that have joined sessions reaches the value of this property. (Put)
     * @param {Integer} ulMinimumClients 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacescheduledcastautostart-put_minimumclients
     */
    put_MinimumClients(ulMinimumClients) {
        result := ComCall(30, this, "uint", ulMinimumClients, "HRESULT")
        return result
    }

    /**
     * Retrieves or sets a condition that starts transmission automatically. Transmission starts when the UTC time reaches the value of this property. (Get)
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacescheduledcastautostart-get_starttime
     */
    get_StartTime() {
        result := ComCall(31, this, "double*", &pStartTime := 0, "HRESULT")
        return pStartTime
    }

    /**
     * Retrieves or sets a condition that starts transmission automatically. Transmission starts when the UTC time reaches the value of this property. (Put)
     * @param {Float} StartTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportnamespacescheduledcastautostart-put_starttime
     */
    put_StartTime(StartTime) {
        result := ComCall(32, this, "double", StartTime, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWdsTransportNamespaceScheduledCastAutoStart.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MinimumClients := CallbackCreate(GetMethod(implObj, "get_MinimumClients"), flags, 2)
        this.vtbl.put_MinimumClients := CallbackCreate(GetMethod(implObj, "put_MinimumClients"), flags, 2)
        this.vtbl.get_StartTime := CallbackCreate(GetMethod(implObj, "get_StartTime"), flags, 2)
        this.vtbl.put_StartTime := CallbackCreate(GetMethod(implObj, "put_StartTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MinimumClients)
        CallbackFree(this.vtbl.put_MinimumClients)
        CallbackFree(this.vtbl.get_StartTime)
        CallbackFree(this.vtbl.put_StartTime)
    }
}
