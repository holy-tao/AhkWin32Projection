#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCPresenceDataEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCPresenceDataEvent
     * @type {Guid}
     */
    static IID => Guid("{38f0e78c-8b87-4c04-a82d-aedd83c909bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StatusCode", "get_StatusText", "GetPresenceData"]

    /**
     * 
     * @param {Pointer<Integer>} plStatusCode 
     * @returns {HRESULT} 
     */
    get_StatusCode(plStatusCode) {
        result := ComCall(7, this, "int*", plStatusCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrStatusText 
     * @returns {HRESULT} 
     */
    get_StatusText(pbstrStatusText) {
        result := ComCall(8, this, "ptr", pbstrStatusText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrNamespace 
     * @param {Pointer<BSTR>} pbstrData 
     * @returns {HRESULT} 
     */
    GetPresenceData(pbstrNamespace, pbstrData) {
        result := ComCall(9, this, "ptr", pbstrNamespace, "ptr", pbstrData, "HRESULT")
        return result
    }
}
