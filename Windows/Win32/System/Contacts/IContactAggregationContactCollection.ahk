#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationContactCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactAggregationContactCollection
     * @type {Guid}
     */
    static IID => Guid("{826e66fa-81de-43ca-a6fb-8c785cd996c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindFirst", "FindNext", "FindFirstByIdentityHash", "get_Count", "FindFirstByRemoteId"]

    /**
     * 
     * @param {Pointer<IContactAggregationContact>} ppItem 
     * @returns {HRESULT} 
     */
    FindFirst(ppItem) {
        result := ComCall(3, this, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IContactAggregationContact>} ppItem 
     * @returns {HRESULT} 
     */
    FindNext(ppItem) {
        result := ComCall(4, this, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pSourceType 
     * @param {PWSTR} pAccountId 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pIdentityHash 
     * @param {Pointer<IContactAggregationContact>} ppItem 
     * @returns {HRESULT} 
     */
    FindFirstByIdentityHash(pSourceType, pAccountId, pIdentityHash, ppItem) {
        pSourceType := pSourceType is String ? StrPtr(pSourceType) : pSourceType
        pAccountId := pAccountId is String ? StrPtr(pAccountId) : pAccountId

        result := ComCall(5, this, "ptr", pSourceType, "ptr", pAccountId, "ptr", pIdentityHash, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    get_Count(pCount) {
        result := ComCall(6, this, "int*", pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pSourceType 
     * @param {PWSTR} pAccountId 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pRemoteObjectId 
     * @param {Pointer<IContactAggregationContact>} ppItem 
     * @returns {HRESULT} 
     */
    FindFirstByRemoteId(pSourceType, pAccountId, pRemoteObjectId, ppItem) {
        pSourceType := pSourceType is String ? StrPtr(pSourceType) : pSourceType
        pAccountId := pAccountId is String ? StrPtr(pAccountId) : pAccountId

        result := ComCall(7, this, "ptr", pSourceType, "ptr", pAccountId, "ptr", pRemoteObjectId, "ptr*", ppItem, "HRESULT")
        return result
    }
}
