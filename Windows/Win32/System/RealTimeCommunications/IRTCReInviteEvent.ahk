#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IRTCSession2.ahk" { IRTCSession2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_REINVITE_STATE.ahk" { RTC_REINVITE_STATE }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCReInviteEvent extends IDispatch {
    /**
     * The interface identifier for IRTCReInviteEvent
     * @type {Guid}
     */
    static IID := Guid("{11558d84-204c-43e7-99b0-2034e9417f7d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCReInviteEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Session                 : IntPtr
        Accept                      : IntPtr
        Reject                      : IntPtr
        get_State                   : IntPtr
        GetRemoteSessionDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCReInviteEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCSession2} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * @type {RTC_REINVITE_STATE} 
     */
    State {
        get => this.get_State()
    }

    /**
     * 
     * @returns {IRTCSession2} 
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppSession2 := 0, "HRESULT")
        return IRTCSession2(ppSession2)
    }

    /**
     * 
     * @param {BSTR} bstrContentType 
     * @param {BSTR} bstrSessionDescription 
     * @returns {HRESULT} 
     */
    Accept(bstrContentType, bstrSessionDescription) {
        bstrContentType := bstrContentType is String ? BSTR.Alloc(bstrContentType).Value : bstrContentType
        bstrSessionDescription := bstrSessionDescription is String ? BSTR.Alloc(bstrSessionDescription).Value : bstrSessionDescription

        result := ComCall(8, this, BSTR, bstrContentType, BSTR, bstrSessionDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reject() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {RTC_REINVITE_STATE} 
     */
    get_State() {
        result := ComCall(10, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrContentType 
     * @param {Pointer<BSTR>} pbstrSessionDescription 
     * @returns {HRESULT} 
     */
    GetRemoteSessionDescription(pbstrContentType, pbstrSessionDescription) {
        result := ComCall(11, this, BSTR.Ptr, pbstrContentType, BSTR.Ptr, pbstrSessionDescription, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCReInviteEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Session := CallbackCreate(GetMethod(implObj, "get_Session"), flags, 2)
        this.vtbl.Accept := CallbackCreate(GetMethod(implObj, "Accept"), flags, 3)
        this.vtbl.Reject := CallbackCreate(GetMethod(implObj, "Reject"), flags, 1)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.GetRemoteSessionDescription := CallbackCreate(GetMethod(implObj, "GetRemoteSessionDescription"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Session)
        CallbackFree(this.vtbl.Accept)
        CallbackFree(this.vtbl.Reject)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.GetRemoteSessionDescription)
    }
}
