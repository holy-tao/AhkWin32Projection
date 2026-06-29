#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IRTCSession2.ahk" { IRTCSession2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_SESSION_STATE.ahk" { RTC_SESSION_STATE }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCSessionReferredEvent extends IDispatch {
    /**
     * The interface identifier for IRTCSessionReferredEvent
     * @type {Guid}
     */
    static IID := Guid("{176a6828-4fcc-4f28-a862-04597a6cf1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCSessionReferredEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Session             : IntPtr
        get_ReferredByURI       : IntPtr
        get_ReferToURI          : IntPtr
        get_ReferCookie         : IntPtr
        Accept                  : IntPtr
        Reject                  : IntPtr
        SetReferredSessionState : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCSessionReferredEvent.Vtbl()
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
     * @type {BSTR} 
     */
    ReferredByURI {
        get => this.get_ReferredByURI()
    }

    /**
     * @type {BSTR} 
     */
    ReferToURI {
        get => this.get_ReferToURI()
    }

    /**
     * @type {BSTR} 
     */
    ReferCookie {
        get => this.get_ReferCookie()
    }

    /**
     * 
     * @returns {IRTCSession2} 
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppSession := 0, "HRESULT")
        return IRTCSession2(ppSession)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ReferredByURI() {
        pbstrReferredByURI := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrReferredByURI, "HRESULT")
        return pbstrReferredByURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ReferToURI() {
        pbstrReferoURI := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrReferoURI, "HRESULT")
        return pbstrReferoURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ReferCookie() {
        pbstrReferCookie := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrReferCookie, "HRESULT")
        return pbstrReferCookie
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Accept() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reject() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_SESSION_STATE} enState 
     * @returns {HRESULT} 
     */
    SetReferredSessionState(enState) {
        result := ComCall(13, this, RTC_SESSION_STATE, enState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCSessionReferredEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Session := CallbackCreate(GetMethod(implObj, "get_Session"), flags, 2)
        this.vtbl.get_ReferredByURI := CallbackCreate(GetMethod(implObj, "get_ReferredByURI"), flags, 2)
        this.vtbl.get_ReferToURI := CallbackCreate(GetMethod(implObj, "get_ReferToURI"), flags, 2)
        this.vtbl.get_ReferCookie := CallbackCreate(GetMethod(implObj, "get_ReferCookie"), flags, 2)
        this.vtbl.Accept := CallbackCreate(GetMethod(implObj, "Accept"), flags, 1)
        this.vtbl.Reject := CallbackCreate(GetMethod(implObj, "Reject"), flags, 1)
        this.vtbl.SetReferredSessionState := CallbackCreate(GetMethod(implObj, "SetReferredSessionState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Session)
        CallbackFree(this.vtbl.get_ReferredByURI)
        CallbackFree(this.vtbl.get_ReferToURI)
        CallbackFree(this.vtbl.get_ReferCookie)
        CallbackFree(this.vtbl.Accept)
        CallbackFree(this.vtbl.Reject)
        CallbackFree(this.vtbl.SetReferredSessionState)
    }
}
