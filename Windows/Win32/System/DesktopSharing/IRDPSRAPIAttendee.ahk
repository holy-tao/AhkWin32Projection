#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Int32>} pId 
     * @returns {HRESULT} 
     */
    get_Id(pId) {
        result := ComCall(7, this, "int*", pId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_RemoteName(pVal) {
        result := ComCall(8, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_ControlLevel(pVal) {
        result := ComCall(9, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pNewVal 
     * @returns {HRESULT} 
     */
    put_ControlLevel(pNewVal) {
        result := ComCall(10, this, "int", pNewVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIInvitation>} ppVal 
     * @returns {HRESULT} 
     */
    get_Invitation(ppVal) {
        result := ComCall(11, this, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    TerminateConnection() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plFlags 
     * @returns {HRESULT} 
     */
    get_Flags(plFlags) {
        result := ComCall(13, this, "int*", plFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppVal 
     * @returns {HRESULT} 
     */
    get_ConnectivityInfo(ppVal) {
        result := ComCall(14, this, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
