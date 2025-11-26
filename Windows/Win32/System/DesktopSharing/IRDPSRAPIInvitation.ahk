#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Invitations enable a person or group of persons to connect to a session. When an attendee connects to a session, the client sends a ticket and a password. These two pieces of information are used to authenticate an attendee.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiinvitation
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIInvitation extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIInvitation
     * @type {Guid}
     */
    static IID => Guid("{4fac1d43-fc51-45bb-b1b4-2b53aa562fa3}")

    /**
     * The class identifier for RDPSRAPIInvitation
     * @type {Guid}
     */
    static CLSID => Guid("{49174dc6-0731-4b5e-8ee1-83a63d3868fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConnectionString", "get_GroupName", "get_Password", "get_AttendeeLimit", "put_AttendeeLimit", "get_Revoked", "put_Revoked"]

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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-get_connectionstring
     */
    get_ConnectionString() {
        pbstrVal := BSTR()
        result := ComCall(7, this, "ptr", pbstrVal, "HRESULT")
        return pbstrVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-get_groupname
     */
    get_GroupName() {
        pbstrVal := BSTR()
        result := ComCall(8, this, "ptr", pbstrVal, "HRESULT")
        return pbstrVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-get_password
     */
    get_Password() {
        pbstrVal := BSTR()
        result := ComCall(9, this, "ptr", pbstrVal, "HRESULT")
        return pbstrVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-get_attendeelimit
     */
    get_AttendeeLimit() {
        result := ComCall(10, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @param {Integer} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-put_attendeelimit
     */
    put_AttendeeLimit(NewVal) {
        result := ComCall(11, this, "int", NewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-get_revoked
     */
    get_Revoked() {
        result := ComCall(12, this, "short*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiinvitation-put_revoked
     */
    put_Revoked(NewVal) {
        result := ComCall(13, this, "short", NewVal, "HRESULT")
        return result
    }
}
