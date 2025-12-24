#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRDPSRAPIAttendee.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains information about the reason an attendee disconnected.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiattendeedisconnectinfo
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIAttendeeDisconnectInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIAttendeeDisconnectInfo
     * @type {Guid}
     */
    static IID => Guid("{c187689f-447c-44a1-9c14-fffbb3b7ec17}")

    /**
     * The class identifier for RDPSRAPIAttendeeDisconnectInfo
     * @type {Guid}
     */
    static CLSID => Guid("{b47d7250-5bdb-405d-b487-caad9c56f4f8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Attendee", "get_Reason", "get_Code"]

    /**
     * @type {IRDPSRAPIAttendee} 
     */
    Attendee {
        get => this.get_Attendee()
    }

    /**
     * @type {Integer} 
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
     * 
     * Applications can query properties, but any attempt to modify properties fails with <b>E_UNEXPECTED</b>.
     * 
     * 
     * @returns {IRDPSRAPIAttendee} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiattendeedisconnectinfo-get_attendee
     */
    get_Attendee() {
        result := ComCall(7, this, "ptr*", &retval := 0, "HRESULT")
        return IRDPSRAPIAttendee(retval)
    }

    /**
     * The reason the attendee was disconnected.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiattendeedisconnectinfo-get_reason
     */
    get_Reason() {
        result := ComCall(8, this, "int*", &pReason := 0, "HRESULT")
        return pReason
    }

    /**
     * The status of the disconnect operation.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapiattendeedisconnectinfo-get_code
     */
    get_Code() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }
}
