#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationLinkCollection extends IUnknown{
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
     * 
     * @param {Pointer<IContactAggregationLink>} ppServerContactLink 
     * @returns {HRESULT} 
     */
    FindFirst(ppServerContactLink) {
        result := ComCall(3, this, "ptr", ppServerContactLink, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(4, this, "ptr", pSourceType, "ptr", pAccountId, "ptr", pRemoteId, "ptr", ppServerContactLink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IContactAggregationLink>} ppServerContactLink 
     * @returns {HRESULT} 
     */
    FindNext(ppServerContactLink) {
        result := ComCall(5, this, "ptr", ppServerContactLink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    get_Count(pCount) {
        result := ComCall(6, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
