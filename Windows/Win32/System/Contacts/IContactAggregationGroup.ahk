#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationGroup extends IUnknown{
    /**
     * The interface identifier for IContactAggregationGroup
     * @type {Guid}
     */
    static IID => Guid("{c93c545f-1284-499b-96af-07372af473e0}")

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
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} 
     */
    Add(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(5, this, "ptr", pAggregateId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} 
     */
    Remove(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(6, this, "ptr", pAggregateId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IContactAggregationAggregateCollection>} ppAggregateContactCollection 
     * @returns {HRESULT} 
     */
    get_Members(ppAggregateContactCollection) {
        result := ComCall(7, this, "ptr", ppAggregateContactCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGlobalObjectId 
     * @returns {HRESULT} 
     */
    get_GlobalObjectId(pGlobalObjectId) {
        result := ComCall(8, this, "ptr", pGlobalObjectId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGlobalObjectId 
     * @returns {HRESULT} 
     */
    put_GlobalObjectId(pGlobalObjectId) {
        result := ComCall(9, this, "ptr", pGlobalObjectId, "int")
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
        result := ComCall(10, this, "ptr", ppItemId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppName 
     * @returns {HRESULT} 
     */
    get_Name(ppName) {
        result := ComCall(11, this, "ptr", ppName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pName 
     * @returns {HRESULT} 
     */
    put_Name(pName) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(12, this, "ptr", pName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
