#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationAggregate extends IUnknown{
    /**
     * The interface identifier for IContactAggregationAggregate
     * @type {Guid}
     */
    static IID => Guid("{7ed1c814-cd30-43c8-9b8d-2e489e53d54b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IContactAggregationContactCollection>} pComponentItems 
     * @returns {HRESULT} 
     */
    GetComponentItems(pComponentItems) {
        result := ComCall(4, this, "ptr", pComponentItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} 
     */
    Link(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(5, this, "ptr", pAggregateId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @param {Pointer<IContactAggregationGroupCollection>} ppGroups 
     * @returns {HRESULT} 
     */
    get_Groups(options, ppGroups) {
        result := ComCall(6, this, "int", options, "ptr", ppGroups, "int")
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
     * @param {Pointer<UInt32>} pFavoriteOrder 
     * @returns {HRESULT} 
     */
    get_FavoriteOrder(pFavoriteOrder) {
        result := ComCall(9, this, "uint*", pFavoriteOrder, "int")
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
        result := ComCall(10, this, "uint", favoriteOrder, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppItemId 
     * @returns {HRESULT} 
     */
    get_Id(ppItemId) {
        result := ComCall(11, this, "ptr", ppItemId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
