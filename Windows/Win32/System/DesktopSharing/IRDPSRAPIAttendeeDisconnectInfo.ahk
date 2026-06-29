#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IRDPSRAPIAttendee.ahk" { IRDPSRAPIAttendee }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import ".\ATTENDEE_DISCONNECT_REASON.ahk" { ATTENDEE_DISCONNECT_REASON }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Contains information about the reason an attendee disconnected.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapiattendeedisconnectinfo
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIAttendeeDisconnectInfo extends IDispatch {
    /**
     * The interface identifier for IRDPSRAPIAttendeeDisconnectInfo
     * @type {Guid}
     */
    static IID := Guid("{c187689f-447c-44a1-9c14-fffbb3b7ec17}")

    /**
     * The class identifier for RDPSRAPIAttendeeDisconnectInfo
     * @type {Guid}
     */
    static CLSID := Guid("{b47d7250-5bdb-405d-b487-caad9c56f4f8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIAttendeeDisconnectInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Attendee : IntPtr
        get_Reason   : IntPtr
        get_Code     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIAttendeeDisconnectInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRDPSRAPIAttendee} 
     */
    Attendee {
        get => this.get_Attendee()
    }

    /**
     * @type {ATTENDEE_DISCONNECT_REASON} 
     */
    Reason {
        get => this.get_Reason()
    }

    /**
     * @type {Integer} 
     */
    Code {
        get => this.get_Code()
    }

    /**
     * The attendee that was disconnected.
     * @remarks
     * Applications can query properties, but any attempt to modify properties fails with <b>E_UNEXPECTED</b>.
     * @returns {IRDPSRAPIAttendee} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendeedisconnectinfo-get_attendee
     */
    get_Attendee() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IRDPSRAPIAttendee(retval)
    }

    /**
     * The reason the attendee was disconnected.
     * @returns {ATTENDEE_DISCONNECT_REASON} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendeedisconnectinfo-get_reason
     */
    get_Reason() {
        result := ComCall(8, this, "int*", &pReason := 0, "HRESULT")
        return pReason
    }

    /**
     * The status of the disconnect operation.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendeedisconnectinfo-get_code
     */
    get_Code() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    Query(iid) {
        if (IRDPSRAPIAttendeeDisconnectInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Attendee := CallbackCreate(GetMethod(implObj, "get_Attendee"), flags, 2)
        this.vtbl.get_Reason := CallbackCreate(GetMethod(implObj, "get_Reason"), flags, 2)
        this.vtbl.get_Code := CallbackCreate(GetMethod(implObj, "get_Code"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Attendee)
        CallbackFree(this.vtbl.get_Reason)
        CallbackFree(this.vtbl.get_Code)
    }
}
