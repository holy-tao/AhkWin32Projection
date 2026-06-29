#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\RTC_SECURITY_LEVEL.ahk" { RTC_SECURITY_LEVEL }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\IRTCSession2.ahk" { IRTCSession2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_REINVITE_STATE.ahk" { RTC_REINVITE_STATE }
#Import ".\RTC_SECURITY_TYPE.ahk" { RTC_SECURITY_TYPE }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCMediaRequestEvent extends IDispatch {
    /**
     * The interface identifier for IRTCMediaRequestEvent
     * @type {Guid}
     */
    static IID := Guid("{52572d15-148c-4d97-a36c-2da55c289d63}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCMediaRequestEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Session                      : IntPtr
        get_ProposedMedia                : IntPtr
        get_CurrentMedia                 : IntPtr
        Accept                           : IntPtr
        get_RemotePreferredSecurityLevel : IntPtr
        Reject                           : IntPtr
        get_State                        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCMediaRequestEvent.Vtbl()
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
     * @type {Integer} 
     */
    ProposedMedia {
        get => this.get_ProposedMedia()
    }

    /**
     * @type {Integer} 
     */
    CurrentMedia {
        get => this.get_CurrentMedia()
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
        result := ComCall(7, this, "ptr*", &ppSession := 0, "HRESULT")
        return IRTCSession2(ppSession)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProposedMedia() {
        result := ComCall(8, this, "int*", &plMediaTypes := 0, "HRESULT")
        return plMediaTypes
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentMedia() {
        result := ComCall(9, this, "int*", &plMediaTypes := 0, "HRESULT")
        return plMediaTypes
    }

    /**
     * 
     * @param {Integer} lMediaTypes 
     * @returns {HRESULT} 
     */
    Accept(lMediaTypes) {
        result := ComCall(10, this, "int", lMediaTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_SECURITY_TYPE} enSecurityType 
     * @returns {RTC_SECURITY_LEVEL} 
     */
    get_RemotePreferredSecurityLevel(enSecurityType) {
        result := ComCall(11, this, RTC_SECURITY_TYPE, enSecurityType, "int*", &penSecurityLevel := 0, "HRESULT")
        return penSecurityLevel
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
     * @returns {RTC_REINVITE_STATE} 
     */
    get_State() {
        result := ComCall(13, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    Query(iid) {
        if (IRTCMediaRequestEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Session := CallbackCreate(GetMethod(implObj, "get_Session"), flags, 2)
        this.vtbl.get_ProposedMedia := CallbackCreate(GetMethod(implObj, "get_ProposedMedia"), flags, 2)
        this.vtbl.get_CurrentMedia := CallbackCreate(GetMethod(implObj, "get_CurrentMedia"), flags, 2)
        this.vtbl.Accept := CallbackCreate(GetMethod(implObj, "Accept"), flags, 2)
        this.vtbl.get_RemotePreferredSecurityLevel := CallbackCreate(GetMethod(implObj, "get_RemotePreferredSecurityLevel"), flags, 3)
        this.vtbl.Reject := CallbackCreate(GetMethod(implObj, "Reject"), flags, 1)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Session)
        CallbackFree(this.vtbl.get_ProposedMedia)
        CallbackFree(this.vtbl.get_CurrentMedia)
        CallbackFree(this.vtbl.Accept)
        CallbackFree(this.vtbl.get_RemotePreferredSecurityLevel)
        CallbackFree(this.vtbl.Reject)
        CallbackFree(this.vtbl.get_State)
    }
}
