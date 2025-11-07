#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IContactAggregationServerPerson.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationServerPersonCollection extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindFirst", "FindFirstByServerId", "FindFirstByAggregateId", "FindFirstByLinkedAggregateId", "FindNext", "get_Count"]

    /**
     * 
     * @returns {IContactAggregationServerPerson} 
     */
    FindFirst() {
        result := ComCall(3, this, "ptr*", &ppServerPerson := 0, "HRESULT")
        return IContactAggregationServerPerson(ppServerPerson)
    }

    /**
     * 
     * @param {PWSTR} pServerId 
     * @returns {IContactAggregationServerPerson} 
     */
    FindFirstByServerId(pServerId) {
        pServerId := pServerId is String ? StrPtr(pServerId) : pServerId

        result := ComCall(4, this, "ptr", pServerId, "ptr*", &ppServerPerson := 0, "HRESULT")
        return IContactAggregationServerPerson(ppServerPerson)
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {IContactAggregationServerPerson} 
     */
    FindFirstByAggregateId(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(5, this, "ptr", pAggregateId, "ptr*", &ppServerPerson := 0, "HRESULT")
        return IContactAggregationServerPerson(ppServerPerson)
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {IContactAggregationServerPerson} 
     */
    FindFirstByLinkedAggregateId(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(6, this, "ptr", pAggregateId, "ptr*", &ppServerPerson := 0, "HRESULT")
        return IContactAggregationServerPerson(ppServerPerson)
    }

    /**
     * 
     * @returns {IContactAggregationServerPerson} 
     */
    FindNext() {
        result := ComCall(7, this, "ptr*", &ppServerPerson := 0, "HRESULT")
        return IContactAggregationServerPerson(ppServerPerson)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(8, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }
}
