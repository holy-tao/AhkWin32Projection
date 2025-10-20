#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCSessionReferStatusEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCSessionReferStatusEvent
     * @type {Guid}
     */
    static IID => Guid("{3d8fc2cd-5d76-44ab-bb68-2a80353b34a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "get_ReferStatus", "get_StatusCode", "get_StatusText"]

    /**
     * 
     * @param {Pointer<IRTCSession2>} ppSession 
     * @returns {HRESULT} 
     */
    get_Session(ppSession) {
        result := ComCall(7, this, "ptr*", ppSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} penReferStatus 
     * @returns {HRESULT} 
     */
    get_ReferStatus(penReferStatus) {
        result := ComCall(8, this, "int*", penReferStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plStatusCode 
     * @returns {HRESULT} 
     */
    get_StatusCode(plStatusCode) {
        result := ComCall(9, this, "int*", plStatusCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrStatusText 
     * @returns {HRESULT} 
     */
    get_StatusText(pbstrStatusText) {
        result := ComCall(10, this, "ptr", pbstrStatusText, "HRESULT")
        return result
    }
}
