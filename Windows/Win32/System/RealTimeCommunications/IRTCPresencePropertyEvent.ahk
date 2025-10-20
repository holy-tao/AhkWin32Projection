#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCPresencePropertyEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCPresencePropertyEvent
     * @type {Guid}
     */
    static IID => Guid("{f777f570-a820-49d5-86bd-e099493f1518}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StatusCode", "get_StatusText", "get_PresenceProperty", "get_Value"]

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
     * @param {Pointer<Integer>} penPresProp 
     * @returns {HRESULT} 
     */
    get_PresenceProperty(penPresProp) {
        result := ComCall(9, this, "int*", penPresProp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrValue 
     * @returns {HRESULT} 
     */
    get_Value(pbstrValue) {
        result := ComCall(10, this, "ptr", pbstrValue, "HRESULT")
        return result
    }
}
