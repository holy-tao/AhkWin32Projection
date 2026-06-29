#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\RTC_REGISTRATION_STATE.ahk" { RTC_REGISTRATION_STATE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRTCProfile.ahk" { IRTCProfile }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCRegistrationStateChangeEvent extends IDispatch {
    /**
     * The interface identifier for IRTCRegistrationStateChangeEvent
     * @type {Guid}
     */
    static IID := Guid("{62d0991b-50ab-4f02-b948-ca94f26f8f95}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCRegistrationStateChangeEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Profile    : IntPtr
        get_State      : IntPtr
        get_StatusCode : IntPtr
        get_StatusText : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCRegistrationStateChangeEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCProfile} 
     */
    Profile {
        get => this.get_Profile()
    }

    /**
     * @type {RTC_REGISTRATION_STATE} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {Integer} 
     */
    StatusCode {
        get => this.get_StatusCode()
    }

    /**
     * @type {BSTR} 
     */
    StatusText {
        get => this.get_StatusText()
    }

    /**
     * 
     * @returns {IRTCProfile} 
     */
    get_Profile() {
        result := ComCall(7, this, "ptr*", &ppProfile := 0, "HRESULT")
        return IRTCProfile(ppProfile)
    }

    /**
     * 
     * @returns {RTC_REGISTRATION_STATE} 
     */
    get_State() {
        result := ComCall(8, this, "int*", &penState := 0, "HRESULT")
        return penState
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(9, this, "int*", &plStatusCode := 0, "HRESULT")
        return plStatusCode
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StatusText() {
        pbstrStatusText := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrStatusText, "HRESULT")
        return pbstrStatusText
    }

    Query(iid) {
        if (IRTCRegistrationStateChangeEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Profile := CallbackCreate(GetMethod(implObj, "get_Profile"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_StatusCode := CallbackCreate(GetMethod(implObj, "get_StatusCode"), flags, 2)
        this.vtbl.get_StatusText := CallbackCreate(GetMethod(implObj, "get_StatusText"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Profile)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_StatusCode)
        CallbackFree(this.vtbl.get_StatusText)
    }
}
