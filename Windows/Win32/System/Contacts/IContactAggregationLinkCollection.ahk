#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationLinkCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAggregationLinkCollection
     * @type {Guid}
     */
    static IID => Guid("{f8bc0e93-fb55-4f28-b9fa-b1c274153292}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindFirst", "FindFirstByRemoteId", "FindNext", "get_Count"]

    /**
     * 
     * @param {Pointer<IContactAggregationLink>} ppServerContactLink 
     * @returns {HRESULT} 
     */
    FindFirst(ppServerContactLink) {
        result := ComCall(3, this, "ptr*", ppServerContactLink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pSourceType 
     * @param {PWSTR} pAccountId 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pRemoteId 
     * @param {Pointer<IContactAggregationLink>} ppServerContactLink 
     * @returns {HRESULT} 
     */
    FindFirstByRemoteId(pSourceType, pAccountId, pRemoteId, ppServerContactLink) {
        pSourceType := pSourceType is String ? StrPtr(pSourceType) : pSourceType
        pAccountId := pAccountId is String ? StrPtr(pAccountId) : pAccountId

        result := ComCall(4, this, "ptr", pSourceType, "ptr", pAccountId, "ptr", pRemoteId, "ptr*", ppServerContactLink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IContactAggregationLink>} ppServerContactLink 
     * @returns {HRESULT} 
     */
    FindNext(ppServerContactLink) {
        result := ComCall(5, this, "ptr*", ppServerContactLink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    get_Count(pCount) {
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, pCountMarshal, pCount, "HRESULT")
        return result
    }
}
