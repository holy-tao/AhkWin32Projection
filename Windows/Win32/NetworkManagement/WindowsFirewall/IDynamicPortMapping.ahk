#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct IDynamicPortMapping extends IDispatch {
    /**
     * The interface identifier for IDynamicPortMapping
     * @type {Guid}
     */
    static IID := Guid("{4fc80282-23b6-4378-9a27-cd8f17c9400c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDynamicPortMapping interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ExternalIPAddress : IntPtr
        get_RemoteHost        : IntPtr
        get_ExternalPort      : IntPtr
        get_Protocol          : IntPtr
        get_InternalPort      : IntPtr
        get_InternalClient    : IntPtr
        get_Enabled           : IntPtr
        get_Description       : IntPtr
        get_LeaseDuration     : IntPtr
        RenewLease            : IntPtr
        EditInternalClient    : IntPtr
        Enable                : IntPtr
        EditDescription       : IntPtr
        EditInternalPort      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDynamicPortMapping.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ExternalIPAddress {
        get => this.get_ExternalIPAddress()
    }

    /**
     * @type {BSTR} 
     */
    RemoteHost {
        get => this.get_RemoteHost()
    }

    /**
     * @type {Integer} 
     */
    ExternalPort {
        get => this.get_ExternalPort()
    }

    /**
     * @type {BSTR} 
     */
    Protocol {
        get => this.get_Protocol()
    }

    /**
     * @type {Integer} 
     */
    InternalPort {
        get => this.get_InternalPort()
    }

    /**
     * @type {BSTR} 
     */
    InternalClient {
        get => this.get_InternalClient()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {Integer} 
     */
    LeaseDuration {
        get => this.get_LeaseDuration()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ExternalIPAddress() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_RemoteHost() {
        pVal := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExternalPort() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Protocol() {
        pVal := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InternalPort() {
        result := ComCall(11, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_InternalClient() {
        pVal := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Enabled() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        pVal := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LeaseDuration() {
        result := ComCall(15, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} lLeaseDurationDesired 
     * @returns {Integer} 
     */
    RenewLease(lLeaseDurationDesired) {
        result := ComCall(16, this, "int", lLeaseDurationDesired, "int*", &pLeaseDurationReturned := 0, "HRESULT")
        return pLeaseDurationReturned
    }

    /**
     * 
     * @param {BSTR} bstrInternalClient 
     * @returns {HRESULT} 
     */
    EditInternalClient(bstrInternalClient) {
        bstrInternalClient := bstrInternalClient is String ? BSTR.Alloc(bstrInternalClient).Value : bstrInternalClient

        result := ComCall(17, this, BSTR, bstrInternalClient, "HRESULT")
        return result
    }

    /**
     * Enables monitoring on a particular drive.
     * @remarks
     * The **Enable** method does not wait for monitoring to be enabled completely before it returns, because this could take a while. Instead, it returns immediately after starting the System Restore service and filter driver.
     * 
     * To enable System Restore on a non-system drive, you must first enable System Restore on the system drive.
     * 
     * This method fails in safe mode.
     * @param {VARIANT_BOOL} vb 
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/sr/enable-systemrestore
     */
    Enable(vb) {
        result := ComCall(18, this, VARIANT_BOOL, vb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    EditDescription(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(19, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lInternalPort 
     * @returns {HRESULT} 
     */
    EditInternalPort(lInternalPort) {
        result := ComCall(20, this, "int", lInternalPort, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDynamicPortMapping.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ExternalIPAddress := CallbackCreate(GetMethod(implObj, "get_ExternalIPAddress"), flags, 2)
        this.vtbl.get_RemoteHost := CallbackCreate(GetMethod(implObj, "get_RemoteHost"), flags, 2)
        this.vtbl.get_ExternalPort := CallbackCreate(GetMethod(implObj, "get_ExternalPort"), flags, 2)
        this.vtbl.get_Protocol := CallbackCreate(GetMethod(implObj, "get_Protocol"), flags, 2)
        this.vtbl.get_InternalPort := CallbackCreate(GetMethod(implObj, "get_InternalPort"), flags, 2)
        this.vtbl.get_InternalClient := CallbackCreate(GetMethod(implObj, "get_InternalClient"), flags, 2)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.get_LeaseDuration := CallbackCreate(GetMethod(implObj, "get_LeaseDuration"), flags, 2)
        this.vtbl.RenewLease := CallbackCreate(GetMethod(implObj, "RenewLease"), flags, 3)
        this.vtbl.EditInternalClient := CallbackCreate(GetMethod(implObj, "EditInternalClient"), flags, 2)
        this.vtbl.Enable := CallbackCreate(GetMethod(implObj, "Enable"), flags, 2)
        this.vtbl.EditDescription := CallbackCreate(GetMethod(implObj, "EditDescription"), flags, 2)
        this.vtbl.EditInternalPort := CallbackCreate(GetMethod(implObj, "EditInternalPort"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ExternalIPAddress)
        CallbackFree(this.vtbl.get_RemoteHost)
        CallbackFree(this.vtbl.get_ExternalPort)
        CallbackFree(this.vtbl.get_Protocol)
        CallbackFree(this.vtbl.get_InternalPort)
        CallbackFree(this.vtbl.get_InternalClient)
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.get_LeaseDuration)
        CallbackFree(this.vtbl.RenewLease)
        CallbackFree(this.vtbl.EditInternalClient)
        CallbackFree(this.vtbl.Enable)
        CallbackFree(this.vtbl.EditDescription)
        CallbackFree(this.vtbl.EditInternalPort)
    }
}
