#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\RTC_SECURITY_LEVEL.ahk" { RTC_SECURITY_LEVEL }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IRTCSession.ahk" { IRTCSession }
#Import ".\RTC_SECURITY_TYPE.ahk" { RTC_SECURITY_TYPE }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCSession2 extends IRTCSession {
    /**
     * The interface identifier for IRTCSession2
     * @type {Guid}
     */
    static IID := Guid("{17d7cdfc-b007-484c-99d2-86a8a820991d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCSession2 interfaces
    */
    struct Vtbl extends IRTCSession.Vtbl {
        SendInfo                       : IntPtr
        put_PreferredSecurityLevel     : IntPtr
        get_PreferredSecurityLevel     : IntPtr
        IsSecurityEnabled              : IntPtr
        AnswerWithSessionDescription   : IntPtr
        ReInviteWithSessionDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCSession2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrInfoHeader 
     * @param {BSTR} bstrInfo 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    SendInfo(bstrInfoHeader, bstrInfo, lCookie) {
        bstrInfoHeader := bstrInfoHeader is String ? BSTR.Alloc(bstrInfoHeader).Value : bstrInfoHeader
        bstrInfo := bstrInfo is String ? BSTR.Alloc(bstrInfo).Value : bstrInfo

        result := ComCall(23, this, BSTR, bstrInfoHeader, BSTR, bstrInfo, "ptr", lCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_SECURITY_TYPE} enSecurityType 
     * @param {RTC_SECURITY_LEVEL} enSecurityLevel 
     * @returns {HRESULT} 
     */
    put_PreferredSecurityLevel(enSecurityType, enSecurityLevel) {
        result := ComCall(24, this, RTC_SECURITY_TYPE, enSecurityType, RTC_SECURITY_LEVEL, enSecurityLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RTC_SECURITY_TYPE} enSecurityType 
     * @returns {RTC_SECURITY_LEVEL} 
     */
    get_PreferredSecurityLevel(enSecurityType) {
        result := ComCall(25, this, RTC_SECURITY_TYPE, enSecurityType, "int*", &penSecurityLevel := 0, "HRESULT")
        return penSecurityLevel
    }

    /**
     * 
     * @param {RTC_SECURITY_TYPE} enSecurityType 
     * @returns {VARIANT_BOOL} 
     */
    IsSecurityEnabled(enSecurityType) {
        result := ComCall(26, this, RTC_SECURITY_TYPE, enSecurityType, VARIANT_BOOL.Ptr, &pfSecurityEnabled := 0, "HRESULT")
        return pfSecurityEnabled
    }

    /**
     * 
     * @param {BSTR} bstrContentType 
     * @param {BSTR} bstrSessionDescription 
     * @returns {HRESULT} 
     */
    AnswerWithSessionDescription(bstrContentType, bstrSessionDescription) {
        bstrContentType := bstrContentType is String ? BSTR.Alloc(bstrContentType).Value : bstrContentType
        bstrSessionDescription := bstrSessionDescription is String ? BSTR.Alloc(bstrSessionDescription).Value : bstrSessionDescription

        result := ComCall(27, this, BSTR, bstrContentType, BSTR, bstrSessionDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrContentType 
     * @param {BSTR} bstrSessionDescription 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    ReInviteWithSessionDescription(bstrContentType, bstrSessionDescription, lCookie) {
        bstrContentType := bstrContentType is String ? BSTR.Alloc(bstrContentType).Value : bstrContentType
        bstrSessionDescription := bstrSessionDescription is String ? BSTR.Alloc(bstrSessionDescription).Value : bstrSessionDescription

        result := ComCall(28, this, BSTR, bstrContentType, BSTR, bstrSessionDescription, "ptr", lCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCSession2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SendInfo := CallbackCreate(GetMethod(implObj, "SendInfo"), flags, 4)
        this.vtbl.put_PreferredSecurityLevel := CallbackCreate(GetMethod(implObj, "put_PreferredSecurityLevel"), flags, 3)
        this.vtbl.get_PreferredSecurityLevel := CallbackCreate(GetMethod(implObj, "get_PreferredSecurityLevel"), flags, 3)
        this.vtbl.IsSecurityEnabled := CallbackCreate(GetMethod(implObj, "IsSecurityEnabled"), flags, 3)
        this.vtbl.AnswerWithSessionDescription := CallbackCreate(GetMethod(implObj, "AnswerWithSessionDescription"), flags, 3)
        this.vtbl.ReInviteWithSessionDescription := CallbackCreate(GetMethod(implObj, "ReInviteWithSessionDescription"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SendInfo)
        CallbackFree(this.vtbl.put_PreferredSecurityLevel)
        CallbackFree(this.vtbl.get_PreferredSecurityLevel)
        CallbackFree(this.vtbl.IsSecurityEnabled)
        CallbackFree(this.vtbl.AnswerWithSessionDescription)
        CallbackFree(this.vtbl.ReInviteWithSessionDescription)
    }
}
