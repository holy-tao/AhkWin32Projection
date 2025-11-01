#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCUserSearchResultsEvent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCUserSearchResultsEvent
     * @type {Guid}
     */
    static IID => Guid("{d8c8c3cd-7fac-4088-81c5-c24cbc0938e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumerateResults", "get_Results", "get_Profile", "get_Query", "get_Cookie", "get_StatusCode", "get_MoreAvailable"]

    /**
     * 
     * @param {Pointer<IRTCEnumUserSearchResults>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumerateResults(ppEnum) {
        result := ComCall(7, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRTCCollection>} ppCollection 
     * @returns {HRESULT} 
     */
    get_Results(ppCollection) {
        result := ComCall(8, this, "ptr*", ppCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRTCProfile2>} ppProfile 
     * @returns {HRESULT} 
     */
    get_Profile(ppProfile) {
        result := ComCall(9, this, "ptr*", ppProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRTCUserSearchQuery>} ppQuery 
     * @returns {HRESULT} 
     */
    get_Query(ppQuery) {
        result := ComCall(10, this, "ptr*", ppQuery, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} plCookie 
     * @returns {HRESULT} 
     */
    get_Cookie(plCookie) {
        plCookieMarshal := plCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, plCookieMarshal, plCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plStatusCode 
     * @returns {HRESULT} 
     */
    get_StatusCode(plStatusCode) {
        plStatusCodeMarshal := plStatusCode is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, plStatusCodeMarshal, plStatusCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfMoreAvailable 
     * @returns {HRESULT} 
     */
    get_MoreAvailable(pfMoreAvailable) {
        result := ComCall(13, this, "ptr", pfMoreAvailable, "HRESULT")
        return result
    }
}
