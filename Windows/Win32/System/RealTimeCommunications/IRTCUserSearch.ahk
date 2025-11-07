#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCUserSearchQuery.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCUserSearch extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCUserSearch
     * @type {Guid}
     */
    static IID => Guid("{b619882b-860c-4db4-be1b-693b6505bbe5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateQuery", "ExecuteSearch"]

    /**
     * 
     * @returns {IRTCUserSearchQuery} 
     */
    CreateQuery() {
        result := ComCall(3, this, "ptr*", &ppQuery := 0, "HRESULT")
        return IRTCUserSearchQuery(ppQuery)
    }

    /**
     * 
     * @param {IRTCUserSearchQuery} pQuery 
     * @param {IRTCProfile} pProfile 
     * @param {Pointer} lCookie 
     * @returns {HRESULT} 
     */
    ExecuteSearch(pQuery, pProfile, lCookie) {
        result := ComCall(4, this, "ptr", pQuery, "ptr", pProfile, "ptr", lCookie, "HRESULT")
        return result
    }
}
