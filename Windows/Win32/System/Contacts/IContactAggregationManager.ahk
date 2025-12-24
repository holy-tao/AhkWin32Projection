#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IContactAggregationGroup.ahk
#Include .\IContactAggregationContact.ahk
#Include .\IContactAggregationServerPerson.ahk
#Include .\IContactAggregationLink.ahk
#Include .\IContactAggregationAggregate.ahk
#Include .\IContactAggregationContactCollection.ahk
#Include .\IContactAggregationAggregateCollection.ahk
#Include .\IContactAggregationGroupCollection.ahk
#Include .\IContactAggregationServerPersonCollection.ahk
#Include .\IContactAggregationLinkCollection.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationManager extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVersionInfo", "CreateOrOpenGroup", "CreateExternalContact", "CreateServerPerson", "CreateServerContactLink", "Flush", "OpenAggregateContact", "OpenContact", "OpenServerContactLink", "OpenServerPerson", "get_Contacts", "get_AggregateContacts", "get_Groups", "get_ServerPersons", "get_ServerContactLinks"]

    /**
     * @type {IContactAggregationServerPersonCollection} 
     */
    ServerPersons {
        get => this.get_ServerPersons()
    }

    /**
     * 
     * @param {Pointer<Integer>} plMajorVersion 
     * @param {Pointer<Integer>} plMinorVersion 
     * @returns {HRESULT} 
     */
    GetVersionInfo(plMajorVersion, plMinorVersion) {
        plMajorVersionMarshal := plMajorVersion is VarRef ? "int*" : "ptr"
        plMinorVersionMarshal := plMinorVersion is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plMajorVersionMarshal, plMajorVersion, plMinorVersionMarshal, plMinorVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pGroupName 
     * @param {Integer} options 
     * @param {Pointer<BOOL>} pCreatedGroup 
     * @returns {IContactAggregationGroup} 
     */
    CreateOrOpenGroup(pGroupName, options, pCreatedGroup) {
        pGroupName := pGroupName is String ? StrPtr(pGroupName) : pGroupName

        pCreatedGroupMarshal := pCreatedGroup is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pGroupName, "int", options, pCreatedGroupMarshal, pCreatedGroup, "ptr*", &ppGroup := 0, "HRESULT")
        return IContactAggregationGroup(ppGroup)
    }

    /**
     * 
     * @returns {IContactAggregationContact} 
     */
    CreateExternalContact() {
        result := ComCall(5, this, "ptr*", &ppItem := 0, "HRESULT")
        return IContactAggregationContact(ppItem)
    }

    /**
     * 
     * @returns {IContactAggregationServerPerson} 
     */
    CreateServerPerson() {
        result := ComCall(6, this, "ptr*", &ppServerPerson := 0, "HRESULT")
        return IContactAggregationServerPerson(ppServerPerson)
    }

    /**
     * 
     * @returns {IContactAggregationLink} 
     */
    CreateServerContactLink() {
        result := ComCall(7, this, "ptr*", &ppServerContactLink := 0, "HRESULT")
        return IContactAggregationLink(ppServerContactLink)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Flush() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pItemId 
     * @returns {IContactAggregationAggregate} 
     */
    OpenAggregateContact(pItemId) {
        pItemId := pItemId is String ? StrPtr(pItemId) : pItemId

        result := ComCall(9, this, "ptr", pItemId, "ptr*", &ppItem := 0, "HRESULT")
        return IContactAggregationAggregate(ppItem)
    }

    /**
     * 
     * @param {PWSTR} pItemId 
     * @returns {IContactAggregationContact} 
     */
    OpenContact(pItemId) {
        pItemId := pItemId is String ? StrPtr(pItemId) : pItemId

        result := ComCall(10, this, "ptr", pItemId, "ptr*", &ppItem := 0, "HRESULT")
        return IContactAggregationContact(ppItem)
    }

    /**
     * 
     * @param {PWSTR} pItemId 
     * @returns {IContactAggregationLink} 
     */
    OpenServerContactLink(pItemId) {
        pItemId := pItemId is String ? StrPtr(pItemId) : pItemId

        result := ComCall(11, this, "ptr", pItemId, "ptr*", &ppItem := 0, "HRESULT")
        return IContactAggregationLink(ppItem)
    }

    /**
     * 
     * @param {PWSTR} pItemId 
     * @returns {IContactAggregationServerPerson} 
     */
    OpenServerPerson(pItemId) {
        pItemId := pItemId is String ? StrPtr(pItemId) : pItemId

        result := ComCall(12, this, "ptr", pItemId, "ptr*", &ppItem := 0, "HRESULT")
        return IContactAggregationServerPerson(ppItem)
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {IContactAggregationContactCollection} 
     */
    get_Contacts(options) {
        result := ComCall(13, this, "int", options, "ptr*", &ppItems := 0, "HRESULT")
        return IContactAggregationContactCollection(ppItems)
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {IContactAggregationAggregateCollection} 
     */
    get_AggregateContacts(options) {
        result := ComCall(14, this, "int", options, "ptr*", &ppAggregates := 0, "HRESULT")
        return IContactAggregationAggregateCollection(ppAggregates)
    }

    /**
     * 
     * @param {Integer} options 
     * @returns {IContactAggregationGroupCollection} 
     */
    get_Groups(options) {
        result := ComCall(15, this, "int", options, "ptr*", &ppGroups := 0, "HRESULT")
        return IContactAggregationGroupCollection(ppGroups)
    }

    /**
     * 
     * @returns {IContactAggregationServerPersonCollection} 
     */
    get_ServerPersons() {
        result := ComCall(16, this, "ptr*", &ppServerPersonCollection := 0, "HRESULT")
        return IContactAggregationServerPersonCollection(ppServerPersonCollection)
    }

    /**
     * 
     * @param {PWSTR} pPersonItemId 
     * @returns {IContactAggregationLinkCollection} 
     */
    get_ServerContactLinks(pPersonItemId) {
        pPersonItemId := pPersonItemId is String ? StrPtr(pPersonItemId) : pPersonItemId

        result := ComCall(17, this, "ptr", pPersonItemId, "ptr*", &ppServerContactLinkCollection := 0, "HRESULT")
        return IContactAggregationLinkCollection(ppServerContactLinkCollection)
    }
}
