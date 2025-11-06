#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IRDPSRAPIInvitation.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Attendee objects are created as a result of clients connecting to the session and being authenticated. After an attendee object is created, it is automatically added to the attendees list.
 * @remarks
 * 
  * Applications should not save pointers to attendee objects. The lifetime of the attendee object depends on the lifetime of the <b>RDPSession</b> object. It also depends if the session is still in the opened state and if the client corresponding to the attendee object is still connected to the session. Applications can keep references to attendee objects but calling some methods on it after the client disconnected or after the session is destroyed will return <b>E_UNEXPECTED</b> failures.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiattendee
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIAttendee extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIAttendee
     * @type {Guid}
     */
    static IID => Guid("{ec0671b3-1b78-4b80-a464-9132247543e3}")

    /**
     * The class identifier for RDPSRAPIAttendee
     * @type {Guid}
     */
    static CLSID => Guid("{74f93bb5-755f-488e-8a29-2390108aef55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_RemoteName", "get_ControlLevel", "put_ControlLevel", "get_Invitation", "TerminateConnection", "get_Flags", "get_ConnectivityInfo"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-get_id
     */
    get_Id() {
        result := ComCall(7, this, "int*", &pId := 0, "HRESULT")
        return pId
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-get_remotename
     */
    get_RemoteName() {
        pVal := BSTR()
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-get_controllevel
     */
    get_ControlLevel() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} pNewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-put_controllevel
     */
    put_ControlLevel(pNewVal) {
        result := ComCall(10, this, "int", pNewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IRDPSRAPIInvitation} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-get_invitation
     */
    get_Invitation() {
        result := ComCall(11, this, "ptr*", &ppVal := 0, "HRESULT")
        return IRDPSRAPIInvitation(ppVal)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-terminateconnection
     */
    TerminateConnection() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-get_flags
     */
    get_Flags() {
        result := ComCall(13, this, "int*", &plFlags := 0, "HRESULT")
        return plFlags
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiattendee-get_connectivityinfo
     */
    get_ConnectivityInfo() {
        result := ComCall(14, this, "ptr*", &ppVal := 0, "HRESULT")
        return IUnknown(ppVal)
    }
}
