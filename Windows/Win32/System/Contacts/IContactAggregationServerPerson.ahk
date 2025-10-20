#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationServerPerson extends IUnknown{
    /**
     * The interface identifier for IContactAggregationServerPerson
     * @type {Guid}
     */
    static IID => Guid("{7fdc3d4b-1b82-4334-85c5-25184ee5a5f2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppAggregateId 
     * @returns {HRESULT} 
     */
    get_AggregateId(ppAggregateId) {
        result := ComCall(5, this, "ptr", ppAggregateId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} 
     */
    put_AggregateId(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(6, this, "ptr", pAggregateId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppAntiLink 
     * @returns {HRESULT} 
     */
    get_AntiLink(ppAntiLink) {
        result := ComCall(7, this, "ptr", ppAntiLink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pAntiLink 
     * @returns {HRESULT} 
     */
    put_AntiLink(pAntiLink) {
        pAntiLink := pAntiLink is String ? StrPtr(pAntiLink) : pAntiLink

        result := ComCall(8, this, "ptr", pAntiLink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppAntiLink 
     * @returns {HRESULT} 
     */
    get_AntiLinkBaseline(ppAntiLink) {
        result := ComCall(9, this, "ptr", ppAntiLink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pAntiLink 
     * @returns {HRESULT} 
     */
    put_AntiLinkBaseline(pAntiLink) {
        pAntiLink := pAntiLink is String ? StrPtr(pAntiLink) : pAntiLink

        result := ComCall(10, this, "ptr", pAntiLink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFavoriteOrder 
     * @returns {HRESULT} 
     */
    get_FavoriteOrder(pFavoriteOrder) {
        result := ComCall(11, this, "uint*", pFavoriteOrder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} favoriteOrder 
     * @returns {HRESULT} 
     */
    put_FavoriteOrder(favoriteOrder) {
        result := ComCall(12, this, "uint", favoriteOrder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pFavoriteOrder 
     * @returns {HRESULT} 
     */
    get_FavoriteOrderBaseline(pFavoriteOrder) {
        result := ComCall(13, this, "uint*", pFavoriteOrder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} favoriteOrder 
     * @returns {HRESULT} 
     */
    put_FavoriteOrderBaseline(favoriteOrder) {
        result := ComCall(14, this, "uint", favoriteOrder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pGroups 
     * @returns {HRESULT} 
     */
    get_Groups(pGroups) {
        result := ComCall(15, this, "ptr", pGroups, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pGroups 
     * @returns {HRESULT} 
     */
    put_Groups(pGroups) {
        result := ComCall(16, this, "ptr", pGroups, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} ppGroups 
     * @returns {HRESULT} 
     */
    get_GroupsBaseline(ppGroups) {
        result := ComCall(17, this, "ptr", ppGroups, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pGroups 
     * @returns {HRESULT} 
     */
    put_GroupsBaseline(pGroups) {
        result := ComCall(18, this, "ptr", pGroups, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppId 
     * @returns {HRESULT} 
     */
    get_Id(ppId) {
        result := ComCall(19, this, "ptr", ppId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsTombstone 
     * @returns {HRESULT} 
     */
    get_IsTombstone(pIsTombstone) {
        result := ComCall(20, this, "ptr", pIsTombstone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} isTombstone 
     * @returns {HRESULT} 
     */
    put_IsTombstone(isTombstone) {
        result := ComCall(21, this, "int", isTombstone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppLinkedAggregateId 
     * @returns {HRESULT} 
     */
    get_LinkedAggregateId(ppLinkedAggregateId) {
        result := ComCall(22, this, "ptr", ppLinkedAggregateId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pLinkedAggregateId 
     * @returns {HRESULT} 
     */
    put_LinkedAggregateId(pLinkedAggregateId) {
        pLinkedAggregateId := pLinkedAggregateId is String ? StrPtr(pLinkedAggregateId) : pLinkedAggregateId

        result := ComCall(23, this, "ptr", pLinkedAggregateId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppObjectId 
     * @returns {HRESULT} 
     */
    get_ObjectId(ppObjectId) {
        result := ComCall(24, this, "ptr", ppObjectId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pObjectId 
     * @returns {HRESULT} 
     */
    put_ObjectId(pObjectId) {
        pObjectId := pObjectId is String ? StrPtr(pObjectId) : pObjectId

        result := ComCall(25, this, "ptr", pObjectId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
