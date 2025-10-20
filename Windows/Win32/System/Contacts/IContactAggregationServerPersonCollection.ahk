#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationServerPersonCollection extends IUnknown{
    /**
     * The interface identifier for IContactAggregationServerPersonCollection
     * @type {Guid}
     */
    static IID => Guid("{4f730a4a-6604-47b6-a987-669ecf1e5751}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IContactAggregationServerPerson>} ppServerPerson 
     * @returns {HRESULT} 
     */
    FindFirst(ppServerPerson) {
        result := ComCall(3, this, "ptr", ppServerPerson, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pServerId 
     * @param {Pointer<IContactAggregationServerPerson>} ppServerPerson 
     * @returns {HRESULT} 
     */
    FindFirstByServerId(pServerId, ppServerPerson) {
        pServerId := pServerId is String ? StrPtr(pServerId) : pServerId

        result := ComCall(4, this, "ptr", pServerId, "ptr", ppServerPerson, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @param {Pointer<IContactAggregationServerPerson>} ppServerPerson 
     * @returns {HRESULT} 
     */
    FindFirstByAggregateId(pAggregateId, ppServerPerson) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(5, this, "ptr", pAggregateId, "ptr", ppServerPerson, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @param {Pointer<IContactAggregationServerPerson>} ppServerPerson 
     * @returns {HRESULT} 
     */
    FindFirstByLinkedAggregateId(pAggregateId, ppServerPerson) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(6, this, "ptr", pAggregateId, "ptr", ppServerPerson, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IContactAggregationServerPerson>} ppServerPerson 
     * @returns {HRESULT} 
     */
    FindNext(ppServerPerson) {
        result := ComCall(7, this, "ptr", ppServerPerson, "int")
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
        result := ComCall(8, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
