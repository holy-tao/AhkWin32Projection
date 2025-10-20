#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationContactCollection extends IUnknown{
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
     * 
     * @param {Pointer<IContactAggregationContact>} ppItem 
     * @returns {HRESULT} 
     */
    FindFirst(ppItem) {
        result := ComCall(3, this, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IContactAggregationContact>} ppItem 
     * @returns {HRESULT} 
     */
    FindNext(ppItem) {
        result := ComCall(4, this, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(5, this, "ptr", pSourceType, "ptr", pAccountId, "ptr", pIdentityHash, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    get_Count(pCount) {
        result := ComCall(6, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(7, this, "ptr", pSourceType, "ptr", pAccountId, "ptr", pRemoteObjectId, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
