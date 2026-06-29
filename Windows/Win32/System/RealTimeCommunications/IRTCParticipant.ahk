#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IRTCSession.ahk" { IRTCSession }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\RTC_PARTICIPANT_STATE.ahk" { RTC_PARTICIPANT_STATE }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCParticipant extends IUnknown {
    /**
     * The interface identifier for IRTCParticipant
     * @type {Guid}
     */
    static IID := Guid("{ae86add5-26b1-4414-af1d-b94cd938d739}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCParticipant interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_UserURI   : IntPtr
        get_Name      : IntPtr
        get_Removable : IntPtr
        get_State     : IntPtr
        get_Session   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCParticipant.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    UserURI {
        get => this.get_UserURI()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Removable {
        get => this.get_Removable()
    }

    /**
     * @type {RTC_PARTICIPANT_STATE} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {IRTCSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_UserURI() {
        pbstrUserURI := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrUserURI, "HRESULT")
        return pbstrUserURI
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Removable() {
        result := ComCall(5, this, VARIANT_BOOL.Ptr, &pfRemovable := 0, "HRESULT")
        return pfRemovable
    }

    /**
     * 
     * @returns {RTC_PARTICIPANT_STATE} 
     */
    get_State() {
        result := ComCall(6, this, "int*", &penState := 0, "HRESULT")
        return penState
    }

    /**
     * 
     * @returns {IRTCSession} 
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppSession := 0, "HRESULT")
        return IRTCSession(ppSession)
    }

    Query(iid) {
        if (IRTCParticipant.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_UserURI := CallbackCreate(GetMethod(implObj, "get_UserURI"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Removable := CallbackCreate(GetMethod(implObj, "get_Removable"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_Session := CallbackCreate(GetMethod(implObj, "get_Session"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_UserURI)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Removable)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_Session)
    }
}
