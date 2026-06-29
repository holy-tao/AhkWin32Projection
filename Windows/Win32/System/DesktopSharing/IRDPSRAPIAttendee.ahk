#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\CTRL_LEVEL.ahk" { CTRL_LEVEL }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IRDPSRAPIInvitation.ahk" { IRDPSRAPIInvitation }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Attendee objects are created as a result of clients connecting to the session and being authenticated. After an attendee object is created, it is automatically added to the attendees list.
 * @remarks
 * Applications should not save pointers to attendee objects. The lifetime of the attendee object depends on the lifetime of the <b>RDPSession</b> object. It also depends if the session is still in the opened state and if the client corresponding to the attendee object is still connected to the session. Applications can keep references to attendee objects but calling some methods on it after the client disconnected or after the session is destroyed will return <b>E_UNEXPECTED</b> failures.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapiattendee
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIAttendee extends IDispatch {
    /**
     * The interface identifier for IRDPSRAPIAttendee
     * @type {Guid}
     */
    static IID := Guid("{ec0671b3-1b78-4b80-a464-9132247543e3}")

    /**
     * The class identifier for RDPSRAPIAttendee
     * @type {Guid}
     */
    static CLSID := Guid("{74f93bb5-755f-488e-8a29-2390108aef55}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIAttendee interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Id               : IntPtr
        get_RemoteName       : IntPtr
        get_ControlLevel     : IntPtr
        put_ControlLevel     : IntPtr
        get_Invitation       : IntPtr
        TerminateConnection  : IntPtr
        get_Flags            : IntPtr
        get_ConnectivityInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIAttendee.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {BSTR} 
     */
    RemoteName {
        get => this.get_RemoteName()
    }

    /**
     * @type {CTRL_LEVEL} 
     */
    ControlLevel {
        get => this.get_ControlLevel()
        set => this.put_ControlLevel(value)
    }

    /**
     * @type {IRDPSRAPIInvitation} 
     */
    Invitation {
        get => this.get_Invitation()
    }

    /**
     * @type {Integer} 
     */
    Flags {
        get => this.get_Flags()
    }

    /**
     * @type {IUnknown} 
     */
    ConnectivityInfo {
        get => this.get_ConnectivityInfo()
    }

    /**
     * The unique identifier for the attendee.
     * @remarks
     * If an attendee disconnects, the attendee object will be destroyed. If the attendee reconnects, a new object will be created with a new identifier.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-get_id
     */
    get_Id() {
        result := ComCall(7, this, "int*", &pId := 0, "HRESULT")
        return pId
    }

    /**
     * The name of the remote client. This is usually the attendee's friendly name.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-get_remotename
     */
    get_RemoteName() {
        pVal := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * The level of control the attendee has over the session. (Get)
     * @returns {CTRL_LEVEL} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-get_controllevel
     */
    get_ControlLevel() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The level of control the attendee has over the session. (Put)
     * @param {CTRL_LEVEL} pNewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-put_controllevel
     */
    put_ControlLevel(pNewVal) {
        result := ComCall(10, this, CTRL_LEVEL, pNewVal, "HRESULT")
        return result
    }

    /**
     * The invitation used to grant the attendee access to the conference.
     * @remarks
     * An application can have multiple groups of attendees. For example, an application can define a "Moderators" group and a "Spectators" group. Attendees that belong to the "Moderators" group are granted interactive control, while attendees in the "Spectators" group are  only granted access to view the session.  The application achieves this  implementation by creating two invitation objects, one for each group. When an attendee connects, the application can verify which group the attendee belongs to by checking the <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-get_groupname">GroupName</a> property of the invitation object used for authentication.  If the group name is "Spectators," the application sets the <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-get_controllevel">ControlLevel</a> property for the attendee to CTRL_LEVEL_VIEW. If the group name is "Moderators," it sets the <b>ControlLevel</b> property to CTRL_LEVEL_INTERACTIVE.
     * 
     * If this property is accessed on the viewer side, it returns a dummy invitation.
     * @returns {IRDPSRAPIInvitation} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-get_invitation
     */
    get_Invitation() {
        result := ComCall(11, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIInvitation(ppVal)
    }

    /**
     * Disconnects the client represented by the attendee.
     * @remarks
     * This method disconnects clients from the session. The clients can reconnect because the authentication is based on the invitation. To provide stricter access control to the session, an application can create one invitation object per attendee and revoke the invitation at the same time it calls this method.
     * 
     * This call is not blocking. However, termination is not immediate and can be delayed by a send operation. If the thread that is managing connections is in the middle of sending a buffer, it must wait for the buffer to be sent. The caller should consider the attendee disconnected only after the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/rdp/onattendeedisconnected">_IRDPSessionEvents::OnAttendeeDisconnected</a> event is fired.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the method succeeds, the return value is <b>S_OK</b>. Otherwise, the return value is an error code. The following is a possible value.
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-terminateconnection
     */
    TerminateConnection() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the attendee specific flags that are defined in the RDPENCOMAPI_ATTENDEE_FLAGS enumeration type.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-get_flags
     */
    get_Flags() {
        result := ComCall(13, this, "int*", &plFlags := 0, "HRESULT")
        return plFlags
    }

    /**
     * Retrieves the connectivity information for the attendee.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-get_connectivityinfo
     */
    get_ConnectivityInfo() {
        result := ComCall(14, this, "ptr*", &ppVal := 0, "HRESULT")
        return IUnknown(ppVal)
    }

    Query(iid) {
        if (IRDPSRAPIAttendee.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_RemoteName := CallbackCreate(GetMethod(implObj, "get_RemoteName"), flags, 2)
        this.vtbl.get_ControlLevel := CallbackCreate(GetMethod(implObj, "get_ControlLevel"), flags, 2)
        this.vtbl.put_ControlLevel := CallbackCreate(GetMethod(implObj, "put_ControlLevel"), flags, 2)
        this.vtbl.get_Invitation := CallbackCreate(GetMethod(implObj, "get_Invitation"), flags, 2)
        this.vtbl.TerminateConnection := CallbackCreate(GetMethod(implObj, "TerminateConnection"), flags, 1)
        this.vtbl.get_Flags := CallbackCreate(GetMethod(implObj, "get_Flags"), flags, 2)
        this.vtbl.get_ConnectivityInfo := CallbackCreate(GetMethod(implObj, "get_ConnectivityInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_RemoteName)
        CallbackFree(this.vtbl.get_ControlLevel)
        CallbackFree(this.vtbl.put_ControlLevel)
        CallbackFree(this.vtbl.get_Invitation)
        CallbackFree(this.vtbl.TerminateConnection)
        CallbackFree(this.vtbl.get_Flags)
        CallbackFree(this.vtbl.get_ConnectivityInfo)
    }
}
