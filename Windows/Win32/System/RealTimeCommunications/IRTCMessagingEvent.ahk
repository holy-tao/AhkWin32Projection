#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\RTC_MESSAGING_EVENT_TYPE.ahk" { RTC_MESSAGING_EVENT_TYPE }
#Import ".\RTC_MESSAGING_USER_STATUS.ahk" { RTC_MESSAGING_USER_STATUS }
#Import ".\IRTCSession.ahk" { IRTCSession }
#Import ".\IRTCParticipant.ahk" { IRTCParticipant }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCMessagingEvent extends IDispatch {
    /**
     * The interface identifier for IRTCMessagingEvent
     * @type {Guid}
     */
    static IID := Guid("{d3609541-1b29-4de5-a4ad-5aebaf319512}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCMessagingEvent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Session       : IntPtr
        get_Participant   : IntPtr
        get_EventType     : IntPtr
        get_Message       : IntPtr
        get_MessageHeader : IntPtr
        get_UserStatus    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCMessagingEvent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRTCSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * @type {IRTCParticipant} 
     */
    Participant {
        get => this.get_Participant()
    }

    /**
     * @type {RTC_MESSAGING_EVENT_TYPE} 
     */
    EventType {
        get => this.get_EventType()
    }

    /**
     * @type {BSTR} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * @type {BSTR} 
     */
    MessageHeader {
        get => this.get_MessageHeader()
    }

    /**
     * @type {RTC_MESSAGING_USER_STATUS} 
     */
    UserStatus {
        get => this.get_UserStatus()
    }

    /**
     * 
     * @returns {IRTCSession} 
     */
    get_Session() {
        result := ComCall(7, this, "ptr*", &ppSession := 0, "HRESULT")
        return IRTCSession(ppSession)
    }

    /**
     * 
     * @returns {IRTCParticipant} 
     */
    get_Participant() {
        result := ComCall(8, this, "ptr*", &ppParticipant := 0, "HRESULT")
        return IRTCParticipant(ppParticipant)
    }

    /**
     * 
     * @returns {RTC_MESSAGING_EVENT_TYPE} 
     */
    get_EventType() {
        result := ComCall(9, this, "int*", &penEventType := 0, "HRESULT")
        return penEventType
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Message() {
        pbstrMessage := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pbstrMessage, "HRESULT")
        return pbstrMessage
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_MessageHeader() {
        pbstrMessageHeader := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrMessageHeader, "HRESULT")
        return pbstrMessageHeader
    }

    /**
     * 
     * @returns {RTC_MESSAGING_USER_STATUS} 
     */
    get_UserStatus() {
        result := ComCall(12, this, "int*", &penUserStatus := 0, "HRESULT")
        return penUserStatus
    }

    Query(iid) {
        if (IRTCMessagingEvent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Session := CallbackCreate(GetMethod(implObj, "get_Session"), flags, 2)
        this.vtbl.get_Participant := CallbackCreate(GetMethod(implObj, "get_Participant"), flags, 2)
        this.vtbl.get_EventType := CallbackCreate(GetMethod(implObj, "get_EventType"), flags, 2)
        this.vtbl.get_Message := CallbackCreate(GetMethod(implObj, "get_Message"), flags, 2)
        this.vtbl.get_MessageHeader := CallbackCreate(GetMethod(implObj, "get_MessageHeader"), flags, 2)
        this.vtbl.get_UserStatus := CallbackCreate(GetMethod(implObj, "get_UserStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Session)
        CallbackFree(this.vtbl.get_Participant)
        CallbackFree(this.vtbl.get_EventType)
        CallbackFree(this.vtbl.get_Message)
        CallbackFree(this.vtbl.get_MessageHeader)
        CallbackFree(this.vtbl.get_UserStatus)
    }
}
