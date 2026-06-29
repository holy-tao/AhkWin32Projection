#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CONTACT_AGGREGATION_COLLECTION_OPTIONS.ahk" { CONTACT_AGGREGATION_COLLECTION_OPTIONS }
#Import ".\IContactAggregationContactCollection.ahk" { IContactAggregationContactCollection }
#Import ".\IContactAggregationServerPerson.ahk" { IContactAggregationServerPerson }
#Import ".\CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS.ahk" { CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS }
#Import ".\IContactAggregationGroupCollection.ahk" { IContactAggregationGroupCollection }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IContactAggregationLink.ahk" { IContactAggregationLink }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IContactAggregationGroup.ahk" { IContactAggregationGroup }
#Import ".\IContactAggregationServerPersonCollection.ahk" { IContactAggregationServerPersonCollection }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IContactAggregationAggregate.ahk" { IContactAggregationAggregate }
#Import ".\IContactAggregationLinkCollection.ahk" { IContactAggregationLinkCollection }
#Import ".\IContactAggregationAggregateCollection.ahk" { IContactAggregationAggregateCollection }
#Import ".\IContactAggregationContact.ahk" { IContactAggregationContact }

/**
 * @namespace Windows.Win32.System.Contacts
 */
export default struct IContactAggregationManager extends IUnknown {
    /**
     * The interface identifier for IContactAggregationManager
     * @type {Guid}
     */
    static IID := Guid("{1d865989-4b1f-4b60-8f34-c2ad468b2b50}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContactAggregationManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetVersionInfo          : IntPtr
        CreateOrOpenGroup       : IntPtr
        CreateExternalContact   : IntPtr
        CreateServerPerson      : IntPtr
        CreateServerContactLink : IntPtr
        Flush                   : IntPtr
        OpenAggregateContact    : IntPtr
        OpenContact             : IntPtr
        OpenServerContactLink   : IntPtr
        OpenServerPerson        : IntPtr
        get_Contacts            : IntPtr
        get_AggregateContacts   : IntPtr
        get_Groups              : IntPtr
        get_ServerPersons       : IntPtr
        get_ServerContactLinks  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContactAggregationManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @param {CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS} options 
     * @param {Pointer<BOOL>} pCreatedGroup 
     * @returns {IContactAggregationGroup} 
     */
    CreateOrOpenGroup(pGroupName, options, pCreatedGroup) {
        pGroupName := pGroupName is String ? StrPtr(pGroupName) : pGroupName

        pCreatedGroupMarshal := pCreatedGroup is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pGroupName, CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS, options, pCreatedGroupMarshal, pCreatedGroup, "ptr*", &ppGroup := 0, "HRESULT")
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
     * Clears the forward buffers for the stream and writes any buffered data to the configuration file.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * This method does not return a value.
     * @see https://learn.microsoft.com/windows/win32/BEvtColProv/control-flush
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
     * @param {CONTACT_AGGREGATION_COLLECTION_OPTIONS} options 
     * @returns {IContactAggregationContactCollection} 
     */
    get_Contacts(options) {
        result := ComCall(13, this, CONTACT_AGGREGATION_COLLECTION_OPTIONS, options, "ptr*", &ppItems := 0, "HRESULT")
        return IContactAggregationContactCollection(ppItems)
    }

    /**
     * 
     * @param {CONTACT_AGGREGATION_COLLECTION_OPTIONS} options 
     * @returns {IContactAggregationAggregateCollection} 
     */
    get_AggregateContacts(options) {
        result := ComCall(14, this, CONTACT_AGGREGATION_COLLECTION_OPTIONS, options, "ptr*", &ppAggregates := 0, "HRESULT")
        return IContactAggregationAggregateCollection(ppAggregates)
    }

    /**
     * 
     * @param {CONTACT_AGGREGATION_COLLECTION_OPTIONS} options 
     * @returns {IContactAggregationGroupCollection} 
     */
    get_Groups(options) {
        result := ComCall(15, this, CONTACT_AGGREGATION_COLLECTION_OPTIONS, options, "ptr*", &ppGroups := 0, "HRESULT")
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

    Query(iid) {
        if (IContactAggregationManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetVersionInfo := CallbackCreate(GetMethod(implObj, "GetVersionInfo"), flags, 3)
        this.vtbl.CreateOrOpenGroup := CallbackCreate(GetMethod(implObj, "CreateOrOpenGroup"), flags, 5)
        this.vtbl.CreateExternalContact := CallbackCreate(GetMethod(implObj, "CreateExternalContact"), flags, 2)
        this.vtbl.CreateServerPerson := CallbackCreate(GetMethod(implObj, "CreateServerPerson"), flags, 2)
        this.vtbl.CreateServerContactLink := CallbackCreate(GetMethod(implObj, "CreateServerContactLink"), flags, 2)
        this.vtbl.Flush := CallbackCreate(GetMethod(implObj, "Flush"), flags, 1)
        this.vtbl.OpenAggregateContact := CallbackCreate(GetMethod(implObj, "OpenAggregateContact"), flags, 3)
        this.vtbl.OpenContact := CallbackCreate(GetMethod(implObj, "OpenContact"), flags, 3)
        this.vtbl.OpenServerContactLink := CallbackCreate(GetMethod(implObj, "OpenServerContactLink"), flags, 3)
        this.vtbl.OpenServerPerson := CallbackCreate(GetMethod(implObj, "OpenServerPerson"), flags, 3)
        this.vtbl.get_Contacts := CallbackCreate(GetMethod(implObj, "get_Contacts"), flags, 3)
        this.vtbl.get_AggregateContacts := CallbackCreate(GetMethod(implObj, "get_AggregateContacts"), flags, 3)
        this.vtbl.get_Groups := CallbackCreate(GetMethod(implObj, "get_Groups"), flags, 3)
        this.vtbl.get_ServerPersons := CallbackCreate(GetMethod(implObj, "get_ServerPersons"), flags, 2)
        this.vtbl.get_ServerContactLinks := CallbackCreate(GetMethod(implObj, "get_ServerContactLinks"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetVersionInfo)
        CallbackFree(this.vtbl.CreateOrOpenGroup)
        CallbackFree(this.vtbl.CreateExternalContact)
        CallbackFree(this.vtbl.CreateServerPerson)
        CallbackFree(this.vtbl.CreateServerContactLink)
        CallbackFree(this.vtbl.Flush)
        CallbackFree(this.vtbl.OpenAggregateContact)
        CallbackFree(this.vtbl.OpenContact)
        CallbackFree(this.vtbl.OpenServerContactLink)
        CallbackFree(this.vtbl.OpenServerPerson)
        CallbackFree(this.vtbl.get_Contacts)
        CallbackFree(this.vtbl.get_AggregateContacts)
        CallbackFree(this.vtbl.get_Groups)
        CallbackFree(this.vtbl.get_ServerPersons)
        CallbackFree(this.vtbl.get_ServerContactLinks)
    }
}
