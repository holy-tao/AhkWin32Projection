#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCRegistrationStateChangeEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCRegistrationStateChangeEvent
     * @type {Guid}
     */
    static IID => Guid("{62d0991b-50ab-4f02-b948-ca94f26f8f95}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Profile", "get_State", "get_StatusCode", "get_StatusText"]

    /**
     * 
     * @param {Pointer<IRTCProfile>} ppProfile 
     * @returns {HRESULT} 
     */
    get_Profile(ppProfile) {
        result := ComCall(7, this, "ptr*", ppProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} penState 
     * @returns {HRESULT} 
     */
    get_State(penState) {
        result := ComCall(8, this, "int*", penState, "HRESULT")
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
