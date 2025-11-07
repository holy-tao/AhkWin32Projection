#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITRequestEvent interface contains methods that allow an application to receive and process Assisted Telephony request events.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itrequestevent
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITRequestEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITRequestEvent
     * @type {Guid}
     */
    static IID => Guid("{ac48ffde-f8c4-11d1-a030-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RegistrationInstance", "get_RequestMode", "get_DestAddress", "get_AppName", "get_CalledParty", "get_Comment"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itrequestevent-get_registrationinstance
     */
    get_RegistrationInstance() {
        result := ComCall(7, this, "int*", &plRegistrationInstance := 0, "HRESULT")
        return plRegistrationInstance
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itrequestevent-get_requestmode
     */
    get_RequestMode() {
        result := ComCall(8, this, "int*", &plRequestMode := 0, "HRESULT")
        return plRequestMode
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itrequestevent-get_destaddress
     */
    get_DestAddress() {
        ppDestAddress := BSTR()
        result := ComCall(9, this, "ptr", ppDestAddress, "HRESULT")
        return ppDestAddress
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itrequestevent-get_appname
     */
    get_AppName() {
        ppAppName := BSTR()
        result := ComCall(10, this, "ptr", ppAppName, "HRESULT")
        return ppAppName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itrequestevent-get_calledparty
     */
    get_CalledParty() {
        ppCalledParty := BSTR()
        result := ComCall(11, this, "ptr", ppCalledParty, "HRESULT")
        return ppCalledParty
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itrequestevent-get_comment
     */
    get_Comment() {
        ppComment := BSTR()
        result := ComCall(12, this, "ptr", ppComment, "HRESULT")
        return ppComment
    }
}
