#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_PARTICIPANT_STATE.ahk" { RTC_PARTICIPANT_STATE }
#Import ".\IRTCParticipant.ahk" { IRTCParticipant }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCParticipantStateChangeEvent extends IDispatch {
    /**
     * The interface identifier for IRTCParticipantStateChangeEvent
     * @type {Guid}
     */
    static IID := Guid("{09bcb597-f0fa-48f9-b420-468cea7fde04}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCParticipantStateChangeEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Participant : IntPtr
        get_State       : IntPtr
        get_StatusCode  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCParticipantStateChangeEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCParticipant} 
     */
    Participant {
        get => this.get_Participant()
    }

    /**
     * @type {RTC_PARTICIPANT_STATE} 
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
     * 
     * @returns {IRTCParticipant} 
     */
    get_Participant() {
        result := ComCall(7, this, "ptr*", &ppParticipant := 0, "HRESULT")
        return IRTCParticipant(ppParticipant)
    }

    /**
     * 
     * @returns {RTC_PARTICIPANT_STATE} 
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

    Query(iid) {
        if (IRTCParticipantStateChangeEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Participant := CallbackCreate(GetMethod(implObj, "get_Participant"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_StatusCode := CallbackCreate(GetMethod(implObj, "get_StatusCode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Participant)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_StatusCode)
    }
}
