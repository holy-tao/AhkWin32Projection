#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IRTCPresenceContact.ahk" { IRTCPresenceContact }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_PRESENCE_STATUS.ahk" { RTC_PRESENCE_STATUS }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCBuddy extends IRTCPresenceContact {
    /**
     * The interface identifier for IRTCBuddy
     * @type {Guid}
     */
    static IID := Guid("{fcb136c8-7b90-4e0c-befe-56edf0ba6f1c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCBuddy interfaces
    */
    struct Vtbl extends IRTCPresenceContact.Vtbl {
        get_Status : IntPtr
        get_Notes  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCBuddy.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {RTC_PRESENCE_STATUS} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {BSTR} 
     */
    Notes {
        get => this.get_Notes()
    }

    /**
     * 
     * @returns {RTC_PRESENCE_STATUS} 
     */
    get_Status() {
        result := ComCall(11, this, "int*", &penStatus := 0, "HRESULT")
        return penStatus
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Notes() {
        pbstrNotes := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pbstrNotes, "HRESULT")
        return pbstrNotes
    }

    Query(iid) {
        if (IRTCBuddy.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_Notes := CallbackCreate(GetMethod(implObj, "get_Notes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_Notes)
    }
}
