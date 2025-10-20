#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationManager extends IUnknown{
    /**
     * The interface identifier for IContactAggregationManager
     * @type {Guid}
     */
    static IID => Guid("{1d865989-4b1f-4b60-8f34-c2ad468b2b50}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} plMajorVersion 
     * @param {Pointer<Int32>} plMinorVersion 
     * @returns {HRESULT} 
     */
    GetVersionInfo(plMajorVersion, plMinorVersion) {
        result := ComCall(3, this, "int*", plMajorVersion, "int*", plMinorVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pGroupName 
     * @param {Integer} options 
     * @param {Pointer<BOOL>} pCreatedGroup 
     * @param {Pointer<IContactAggregationGroup>} ppGroup 
     * @returns {HRESULT} 
     */
    CreateOrOpenGroup(pGroupName, options, pCreatedGroup, ppGroup) {
        pGroupName := pGroupName is String ? StrPtr(pGroupName) : pGroupName

        result := ComCall(4, this, "ptr", pGroupName, "int", options, "ptr", pCreatedGroup, "ptr", ppGroup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IContactAggregationContact>} ppItem 
     * @returns {HRESULT} 
     */
    CreateExternalContact(ppItem) {
        result := ComCall(5, this, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IContactAggregationServerPerson>} ppServerPerson 
     * @returns {HRESULT} 
     */
    CreateServerPerson(ppServerPerson) {
        result := ComCall(6, this, "ptr", ppServerPerson, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IContactAggregationLink>} ppServerContactLink 
     * @returns {HRESULT} 
     */
    CreateServerContactLink(ppServerContactLink) {
        result := ComCall(7, this, "ptr", ppServerContactLink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Flush() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pItemId 
     * @param {Pointer<IContactAggregationAggregate>} ppItem 
     * @returns {HRESULT} 
     */
    OpenAggregateContact(pItemId, ppItem) {
        pItemId := pItemId is String ? StrPtr(pItemId) : pItemId

        result := ComCall(9, this, "ptr", pItemId, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pItemId 
     * @param {Pointer<IContactAggregationContact>} ppItem 
     * @returns {HRESULT} 
     */
    OpenContact(pItemId, ppItem) {
        pItemId := pItemId is String ? StrPtr(pItemId) : pItemId

        result := ComCall(10, this, "ptr", pItemId, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pItemId 
     * @param {Pointer<IContactAggregationLink>} ppItem 
     * @returns {HRESULT} 
     */
    OpenServerContactLink(pItemId, ppItem) {
        pItemId := pItemId is String ? StrPtr(pItemId) : pItemId

        result := ComCall(11, this, "ptr", pItemId, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pItemId 
     * @param {Pointer<IContactAggregationServerPerson>} ppItem 
     * @returns {HRESULT} 
     */
    OpenServerPerson(pItemId, ppItem) {
        pItemId := pItemId is String ? StrPtr(pItemId) : pItemId

        result := ComCall(12, this, "ptr", pItemId, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @param {Pointer<IContactAggregationContactCollection>} ppItems 
     * @returns {HRESULT} 
     */
    get_Contacts(options, ppItems) {
        result := ComCall(13, this, "int", options, "ptr", ppItems, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @param {Pointer<IContactAggregationAggregateCollection>} ppAggregates 
     * @returns {HRESULT} 
     */
    get_AggregateContacts(options, ppAggregates) {
        result := ComCall(14, this, "int", options, "ptr", ppAggregates, "int")
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
        result := ComCall(15, this, "int", options, "ptr", ppGroups, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IContactAggregationServerPersonCollection>} ppServerPersonCollection 
     * @returns {HRESULT} 
     */
    get_ServerPersons(ppServerPersonCollection) {
        result := ComCall(16, this, "ptr", ppServerPersonCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pPersonItemId 
     * @param {Pointer<IContactAggregationLinkCollection>} ppServerContactLinkCollection 
     * @returns {HRESULT} 
     */
    get_ServerContactLinks(pPersonItemId, ppServerContactLinkCollection) {
        pPersonItemId := pPersonItemId is String ? StrPtr(pPersonItemId) : pPersonItemId

        result := ComCall(17, this, "ptr", pPersonItemId, "ptr", ppServerContactLinkCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
