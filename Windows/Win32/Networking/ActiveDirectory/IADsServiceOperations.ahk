#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADs.ahk" { IADs }

/**
 * The IADsServiceOperations interface is a dual interface that inherits from IADs.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsserviceoperations
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsServiceOperations extends IADs {
    /**
     * The interface identifier for IADsServiceOperations
     * @type {Guid}
     */
    static IID := Guid("{5d7b33f0-31ca-11cf-a98a-00aa006bc149}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsServiceOperations interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_Status  : IntPtr
        Start       : IntPtr
        Stop        : IntPtr
        Pause       : IntPtr
        Continue    : IntPtr
        SetPassword : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsServiceOperations.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(20, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * The IADsServiceOperations::Start method starts a network service.
     * @returns {HRESULT} This method supports the standard return values, including S_OK. For more information about other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsserviceoperations-start
     */
    Start() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * The IADsServiceOperations::Stop method stops a currently active network service.
     * @returns {HRESULT} This method supports standard return values, including S_OK. For more information about other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsserviceoperations-stop
     */
    Stop() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * The IADsServiceOperations::Pause method pauses a service started with the IADsServiceOperations::Start method.
     * @returns {HRESULT} This method supports the standard return values, including S_OK. For more information about other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsserviceoperations-pause
     */
    Pause() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * The IADsServiceOperations::Continue method resumes a service operation paused by the IADsServiceOperations::Pause method.
     * @returns {HRESULT} This method supports the standard return values, including S_OK. For more information about other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsserviceoperations-continue
     */
    Continue() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * The IADsServiceOperations::SetPassword method sets the password for the account used by the service manager. This method is called when the security context for this service is created.
     * @remarks
     * The property <a href="https://docs.microsoft.com/windows/desktop/ADSI/iadsservice-property-methods">IADsService::get_ServiceAccountName</a> identifies the account for which this password is to be set.
     * @param {BSTR} bstrNewPassword The null-terminated Unicode string to be stored as the new password.
     * @returns {HRESULT} This method supports the standard return values, including S_OK. For more information about other return values, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsserviceoperations-setpassword
     */
    SetPassword(bstrNewPassword) {
        bstrNewPassword := bstrNewPassword is String ? BSTR.Alloc(bstrNewPassword).Value : bstrNewPassword

        result := ComCall(25, this, BSTR, bstrNewPassword, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsServiceOperations.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.Start := CallbackCreate(GetMethod(implObj, "Start"), flags, 1)
        this.vtbl.Stop := CallbackCreate(GetMethod(implObj, "Stop"), flags, 1)
        this.vtbl.Pause := CallbackCreate(GetMethod(implObj, "Pause"), flags, 1)
        this.vtbl.Continue := CallbackCreate(GetMethod(implObj, "Continue"), flags, 1)
        this.vtbl.SetPassword := CallbackCreate(GetMethod(implObj, "SetPassword"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.Start)
        CallbackFree(this.vtbl.Stop)
        CallbackFree(this.vtbl.Pause)
        CallbackFree(this.vtbl.Continue)
        CallbackFree(this.vtbl.SetPassword)
    }
}
