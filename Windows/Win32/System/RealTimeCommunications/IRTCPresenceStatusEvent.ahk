#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCPresenceStatusEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCPresenceStatusEvent
     * @type {Guid}
     */
    static IID => Guid("{78673f32-4a0f-462c-89aa-ee7706707678}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StatusCode", "get_StatusText", "GetLocalPresenceInfo"]

    /**
     * 
     * @returns {Integer} 
     */
    get_StatusCode() {
        result := ComCall(7, this, "int*", &plStatusCode := 0, "HRESULT")
        return plStatusCode
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StatusText() {
        pbstrStatusText := BSTR()
        result := ComCall(8, this, "ptr", pbstrStatusText, "HRESULT")
        return pbstrStatusText
    }

    /**
     * 
     * @param {Pointer<Integer>} penStatus 
     * @param {Pointer<BSTR>} pbstrNotes 
     * @returns {HRESULT} 
     */
    GetLocalPresenceInfo(penStatus, pbstrNotes) {
        penStatusMarshal := penStatus is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, penStatusMarshal, penStatus, "ptr", pbstrNotes, "HRESULT")
        return result
    }
}
