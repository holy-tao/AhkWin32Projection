#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITRequestEvent interface contains methods that allow an application to receive and process Assisted Telephony request events.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itrequestevent
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITRequestEvent extends IDispatch {
    /**
     * The interface identifier for ITRequestEvent
     * @type {Guid}
     */
    static IID := Guid("{ac48ffde-f8c4-11d1-a030-00c04fb6809f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITRequestEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_RegistrationInstance : IntPtr
        get_RequestMode          : IntPtr
        get_DestAddress          : IntPtr
        get_AppName              : IntPtr
        get_CalledParty          : IntPtr
        get_Comment              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITRequestEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    RegistrationInstance {
        get => this.get_RegistrationInstance()
    }

    /**
     * @type {Integer} 
     */
    RequestMode {
        get => this.get_RequestMode()
    }

    /**
     * @type {BSTR} 
     */
    DestAddress {
        get => this.get_DestAddress()
    }

    /**
     * @type {BSTR} 
     */
    AppName {
        get => this.get_AppName()
    }

    /**
     * @type {BSTR} 
     */
    CalledParty {
        get => this.get_CalledParty()
    }

    /**
     * @type {BSTR} 
     */
    Comment {
        get => this.get_Comment()
    }

    /**
     * The get_RegistrationInstance method gets the registration instance.
     * @returns {Integer} Pointer to the registration instance.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itrequestevent-get_registrationinstance
     */
    get_RegistrationInstance() {
        result := ComCall(7, this, "int*", &plRegistrationInstance := 0, "HRESULT")
        return plRegistrationInstance
    }

    /**
     * The get_RequestMode method gets the mode of the request.
     * @returns {Integer} Pointer to the request mode.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itrequestevent-get_requestmode
     */
    get_RequestMode() {
        result := ComCall(8, this, "int*", &plRequestMode := 0, "HRESULT")
        return plRequestMode
    }

    /**
     * The get_DestAddress method gets the destination address.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppDestAddress</i> parameter.
     * @returns {BSTR} Pointer to a <b>BSTR</b> containing the destination address.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itrequestevent-get_destaddress
     */
    get_DestAddress() {
        ppDestAddress := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, ppDestAddress, "HRESULT")
        return ppDestAddress
    }

    /**
     * The get_AppName method gets the name of the application.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppAppName</i> parameter.
     * @returns {BSTR} Pointer to a <b>BSTR</b> containing the application name.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itrequestevent-get_appname
     */
    get_AppName() {
        ppAppName := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, ppAppName, "HRESULT")
        return ppAppName
    }

    /**
     * The get_CalledParty method gets the called party.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppCalledParty</i> parameter.
     * @returns {BSTR} Pointer to a <b>BSTR</b> containing the called party identifier.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itrequestevent-get_calledparty
     */
    get_CalledParty() {
        ppCalledParty := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, ppCalledParty, "HRESULT")
        return ppCalledParty
    }

    /**
     * The get_Comment method gets the comment.
     * @remarks
     * The application must use 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a> to free the memory allocated for the <i>ppComment</i> parameter.
     * @returns {BSTR} Pointer to a <b>BSTR</b> containing the comment.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itrequestevent-get_comment
     */
    get_Comment() {
        ppComment := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, ppComment, "HRESULT")
        return ppComment
    }

    Query(iid) {
        if (ITRequestEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_RegistrationInstance := CallbackCreate(GetMethod(implObj, "get_RegistrationInstance"), flags, 2)
        this.vtbl.get_RequestMode := CallbackCreate(GetMethod(implObj, "get_RequestMode"), flags, 2)
        this.vtbl.get_DestAddress := CallbackCreate(GetMethod(implObj, "get_DestAddress"), flags, 2)
        this.vtbl.get_AppName := CallbackCreate(GetMethod(implObj, "get_AppName"), flags, 2)
        this.vtbl.get_CalledParty := CallbackCreate(GetMethod(implObj, "get_CalledParty"), flags, 2)
        this.vtbl.get_Comment := CallbackCreate(GetMethod(implObj, "get_Comment"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_RegistrationInstance)
        CallbackFree(this.vtbl.get_RequestMode)
        CallbackFree(this.vtbl.get_DestAddress)
        CallbackFree(this.vtbl.get_AppName)
        CallbackFree(this.vtbl.get_CalledParty)
        CallbackFree(this.vtbl.get_Comment)
    }
}
