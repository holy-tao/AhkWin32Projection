#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCProfileEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCProfileEvent
     * @type {Guid}
     */
    static IID => Guid("{d6d5ab3b-770e-43e8-800a-79b062395fca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Profile", "get_Cookie", "get_StatusCode"]

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
     * @param {Pointer<Pointer>} plCookie 
     * @returns {HRESULT} 
     */
    get_Cookie(plCookie) {
        plCookieMarshal := plCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, plCookieMarshal, plCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plStatusCode 
     * @returns {HRESULT} 
     */
    get_StatusCode(plStatusCode) {
        plStatusCodeMarshal := plStatusCode is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, plStatusCodeMarshal, plStatusCode, "HRESULT")
        return result
    }
}
