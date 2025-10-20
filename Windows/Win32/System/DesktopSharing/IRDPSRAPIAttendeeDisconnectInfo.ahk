#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains information about the reason an attendee disconnected.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiattendeedisconnectinfo
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIAttendeeDisconnectInfo extends IDispatch{
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
     * 
     * @param {Pointer<IRDPSRAPIAttendee>} retval 
     * @returns {HRESULT} 
     */
    get_Attendee(retval) {
        result := ComCall(7, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pReason 
     * @returns {HRESULT} 
     */
    get_Reason(pReason) {
        result := ComCall(8, this, "int*", pReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_Code(pVal) {
        result := ComCall(9, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
