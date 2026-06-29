#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Invitations enable a person or group of persons to connect to a session. When an attendee connects to a session, the client sends a ticket and a password. These two pieces of information are used to authenticate an attendee.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapiinvitation
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIInvitation extends IDispatch {
    /**
     * The interface identifier for IRDPSRAPIInvitation
     * @type {Guid}
     */
    static IID := Guid("{4fac1d43-fc51-45bb-b1b4-2b53aa562fa3}")

    /**
     * The class identifier for RDPSRAPIInvitation
     * @type {Guid}
     */
    static CLSID := Guid("{49174dc6-0731-4b5e-8ee1-83a63d3868fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIInvitation interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ConnectionString : IntPtr
        get_GroupName        : IntPtr
        get_Password         : IntPtr
        get_AttendeeLimit    : IntPtr
        put_AttendeeLimit    : IntPtr
        get_Revoked          : IntPtr
        put_Revoked          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIInvitation.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ConnectionString {
        get => this.get_ConnectionString()
    }

    /**
     * @type {BSTR} 
     */
    GroupName {
        get => this.get_GroupName()
    }

    /**
     * @type {BSTR} 
     */
    Password {
        get => this.get_Password()
    }

    /**
     * @type {Integer} 
     */
    AttendeeLimit {
        get => this.get_AttendeeLimit()
        set => this.put_AttendeeLimit(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Revoked {
        get => this.get_Revoked()
        set => this.put_Revoked(value)
    }

    /**
     * The ticket string.
     * @remarks
     * The ticket string is set when calling the <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitationmanager-createinvitation">IRDPSRAPIInvitationManager::CreateInvitation</a> method.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-get_connectionstring
     */
    get_ConnectionString() {
        pbstrVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrVal, "HRESULT")
        return pbstrVal
    }

    /**
     * The group name.
     * @remarks
     * The group name is set when calling the <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitationmanager-createinvitation">IRDPSRAPIInvitationManager::CreateInvitation</a> method. Applications typically use this property to separate attendees into groups that can be granted different authorization levels.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-get_groupname
     */
    get_GroupName() {
        pbstrVal := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrVal, "HRESULT")
        return pbstrVal
    }

    /**
     * The password string.
     * @remarks
     * The password is set when calling the <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitationmanager-createinvitation">IRDPSRAPIInvitationManager::CreateInvitation</a> method.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-get_password
     */
    get_Password() {
        pbstrVal := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrVal, "HRESULT")
        return pbstrVal
    }

    /**
     * The maximum number of attendees that can connect to the session. (Get)
     * @remarks
     * The password is set when the invitation is created and can be modified using <b>put_AttendeeLimit</b>.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-get_attendeelimit
     */
    get_AttendeeLimit() {
        result := ComCall(10, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * The maximum number of attendees that can connect to the session. (Put)
     * @remarks
     * The password is set when the invitation is created and can be modified using <b>put_AttendeeLimit</b>.
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-put_attendeelimit
     */
    put_AttendeeLimit(NewVal) {
        result := ComCall(11, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * The revoked state of the invitation. (Get)
     * @remarks
     * There is no way to delete an invitation, only to revoke it. This enables the application to check whether a ticket was issued before to ensure that each invitation has a unique ticket. If an invitation state is revoked,  no new attendees can connect by using that invitation.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-get_revoked
     */
    get_Revoked() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * The revoked state of the invitation. (Put)
     * @remarks
     * There is no way to delete an invitation, only to revoke it. This enables the application to check whether a ticket was issued before to ensure that each invitation has a unique ticket. If an invitation state is revoked,  no new attendees can connect by using that invitation.
     * @param {VARIANT_BOOL} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-put_revoked
     */
    put_Revoked(NewVal) {
        result := ComCall(13, this, VARIANT_BOOL, NewVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRDPSRAPIInvitation.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ConnectionString := CallbackCreate(GetMethod(implObj, "get_ConnectionString"), flags, 2)
        this.vtbl.get_GroupName := CallbackCreate(GetMethod(implObj, "get_GroupName"), flags, 2)
        this.vtbl.get_Password := CallbackCreate(GetMethod(implObj, "get_Password"), flags, 2)
        this.vtbl.get_AttendeeLimit := CallbackCreate(GetMethod(implObj, "get_AttendeeLimit"), flags, 2)
        this.vtbl.put_AttendeeLimit := CallbackCreate(GetMethod(implObj, "put_AttendeeLimit"), flags, 2)
        this.vtbl.get_Revoked := CallbackCreate(GetMethod(implObj, "get_Revoked"), flags, 2)
        this.vtbl.put_Revoked := CallbackCreate(GetMethod(implObj, "put_Revoked"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ConnectionString)
        CallbackFree(this.vtbl.get_GroupName)
        CallbackFree(this.vtbl.get_Password)
        CallbackFree(this.vtbl.get_AttendeeLimit)
        CallbackFree(this.vtbl.put_AttendeeLimit)
        CallbackFree(this.vtbl.get_Revoked)
        CallbackFree(this.vtbl.put_Revoked)
    }
}
