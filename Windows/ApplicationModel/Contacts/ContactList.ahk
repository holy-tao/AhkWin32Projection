#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactList.ahk
#Include .\IContactList2.ahk
#Include .\IContactList3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ContactList.ahk
#Include .\ContactChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a list of [Contact](contact.md) objects.
 * @remarks
 * Call [ContactStore.CreateContactListAsync](contactstore_createcontactlistasync_1732290999.md) to create a new instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactList extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactList

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactList.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the locally unique identifier for this [ContactList](contactlist.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets or sets the name of the [ContactList](contactlist.md), suitable for display in the user interface.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets the name of the source of the [ContactList](contactlist.md), suitable for display in the user interface.
     * @remarks
     * This is usually the name of the app or service from which the contacts originate.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.sourcedisplayname
     * @type {HSTRING} 
     */
    SourceDisplayName {
        get => this.get_SourceDisplayName()
    }

    /**
     * Gets or sets a Boolean value that indicates whether the [ContactList](contactlist.md) is hidden in the user interface.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.ishidden
     * @type {Boolean} 
     */
    IsHidden {
        get => this.get_IsHidden()
        set => this.put_IsHidden(value)
    }

    /**
     * Gets or sets a value indicating the read access level to this [ContactList](contactlist.md) for other apps on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.otherappreadaccess
     * @type {Integer} 
     */
    OtherAppReadAccess {
        get => this.get_OtherAppReadAccess()
        set => this.put_OtherAppReadAccess(value)
    }

    /**
     * Gets or sets a value that indicates the write access level to this [ContactList](contactlist.md) for other apps on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.otherappwriteaccess
     * @type {Integer} 
     */
    OtherAppWriteAccess {
        get => this.get_OtherAppWriteAccess()
        set => this.put_OtherAppWriteAccess(value)
    }

    /**
     * Gets the app's [ContactChangeTracker](contactchangetracker.md) for this [ContactList](contactlist.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.changetracker
     * @type {ContactChangeTracker} 
     */
    ChangeTracker {
        get => this.get_ChangeTracker()
    }

    /**
     * Gets the [ContactListSyncManager](contactlistsyncmanager.md) used to communicate with the server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.syncmanager
     * @type {ContactListSyncManager} 
     */
    SyncManager {
        get => this.get_SyncManager()
    }

    /**
     * Gets or sets a Boolean value that indicates whether you can search the remote server with this [ContactList](contactlist.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.supportsserversearch
     * @type {Boolean} 
     */
    SupportsServerSearch {
        get => this.get_SupportsServerSearch()
        set => this.put_SupportsServerSearch(value)
    }

    /**
     * Gets a string that represents the ID of the user data account for this [ContactList](contactlist.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.userdataaccountid
     * @type {HSTRING} 
     */
    UserDataAccountId {
        get => this.get_UserDataAccountId()
    }

    /**
     * Gets the [ContactListSyncConstraints](contactlistsyncconstraints.md) which indicates the maximum amount of contact list data that can be synchronized.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.syncconstraints
     * @type {ContactListSyncConstraints} 
     */
    SyncConstraints {
        get => this.get_SyncConstraints()
    }

    /**
     * Gets an object that provides operations that an app can perform on a contact list that it has not created.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.limitedwriteoperations
     * @type {ContactListLimitedWriteOperations} 
     */
    LimitedWriteOperations {
        get => this.get_LimitedWriteOperations()
    }

    /**
     * Occurs when a [Contact](contact.md) in this [ContactList](contactlist.md) has been changed.
     * @type {TypedEventHandler<ContactList, ContactChangedEventArgs>}
    */
    OnContactChanged {
        get {
            if(!this.HasProp("__OnContactChanged")){
                this.__OnContactChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c953dc00-30be-5379-bcac-435c6bad3ce6}"),
                    ContactList,
                    ContactChangedEventArgs
                )
                this.__OnContactChangedToken := this.add_ContactChanged(this.__OnContactChanged.iface)
            }
            return this.__OnContactChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnContactChangedToken")) {
            this.remove_ContactChanged(this.__OnContactChangedToken)
            this.__OnContactChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceDisplayName() {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.get_SourceDisplayName()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHidden() {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.get_IsHidden()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHidden(value) {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.put_IsHidden(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppReadAccess() {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.get_OtherAppReadAccess()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppReadAccess(value) {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.put_OtherAppReadAccess(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppWriteAccess() {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.get_OtherAppWriteAccess()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppWriteAccess(value) {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.put_OtherAppWriteAccess(value)
    }

    /**
     * 
     * @returns {ContactChangeTracker} 
     */
    get_ChangeTracker() {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.get_ChangeTracker()
    }

    /**
     * 
     * @returns {ContactListSyncManager} 
     */
    get_SyncManager() {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.get_SyncManager()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SupportsServerSearch() {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.get_SupportsServerSearch()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDataAccountId() {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.get_UserDataAccountId()
    }

    /**
     * 
     * @param {TypedEventHandler<ContactList, ContactChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_ContactChanged(value) {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.add_ContactChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} value 
     * @returns {HRESULT} 
     */
    remove_ContactChanged(value) {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.remove_ContactChanged(value)
    }

    /**
     * Asynchronously saves this [ContactList](contactlist.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.saveasync
     */
    SaveAsync() {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.SaveAsync()
    }

    /**
     * Asynchronously deletes this [ContactList](contactlist.md), including all [Contact](contact.md) objects in the [ContactStore](contactstore.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.deleteasync
     */
    DeleteAsync() {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.DeleteAsync()
    }

    /**
     * Asynchronously gets the [Contact](contact.md) identified by the specified [RemoteId](contact_remoteid.md).
     * @param {HSTRING} remoteId An ID that can be used by a service provider to access the [Contact](contact.md) in their remote system.
     * @returns {IAsyncOperation<Contact>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.getcontactfromremoteidasync
     */
    GetContactFromRemoteIdAsync(remoteId) {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.GetContactFromRemoteIdAsync(remoteId)
    }

    /**
     * Asynchronously gets the [Contact](contact.md) object that represents the current user.
     * @remarks
     * If no contact has been designated as representing the current user,
     * the return value is an empty contact.
     * You can detect this case by checking whether the contact's [Id](contact_id.md) property is nonempty.
     * @returns {IAsyncOperation<Contact>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.getmecontactasync
     */
    GetMeContactAsync() {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.GetMeContactAsync()
    }

    /**
     * Gets a [ContactReader](contactreader.md) object associated with this [ContactList](contactlist.md) and using the specified [ContactQueryOptions](contactqueryoptions.md).
     * @returns {ContactReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.getcontactreader
     */
    GetContactReader() {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.GetContactReader()
    }

    /**
     * Gets a [ContactReader](contactreader.md) object associated with this [ContactList](contactlist.md).
     * @param {ContactQueryOptions} options 
     * @returns {ContactReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.getcontactreader
     */
    GetContactReaderWithOptions(options) {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.GetContactReaderWithOptions(options)
    }

    /**
     * Asynchronously saves the specified [Contact](contact.md) to the [ContactStore](contactstore.md).
     * @remarks
     * Throws a System.ArgumentException: 'Value does not fall within the expected range.' when the contact passed as parameter has a RemoteID set which is identical to a contacts RemoteID already saved on this device.
     * @param {Contact} contact_ The contact to save.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.savecontactasync
     */
    SaveContactAsync(contact_) {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.SaveContactAsync(contact_)
    }

    /**
     * Asynchronously deletes and individual [Contact](contact.md) from this [ContactList](contactlist.md) and the [ContactStore](contactstore.md).
     * @param {Contact} contact_ The [Contact](contact.md) to delete.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.deletecontactasync
     */
    DeleteContactAsync(contact_) {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.DeleteContactAsync(contact_)
    }

    /**
     * Asynchronously retrieves the specified [Contact](contact.md) object from the [ContactList](contactlist.md).
     * @param {HSTRING} contactId The string that identifies the [Contact](contact.md) to return.
     * @returns {IAsyncOperation<Contact>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.getcontactasync
     */
    GetContactAsync(contactId) {
        if (!this.HasProp("__IContactList")) {
            if ((queryResult := this.QueryInterface(IContactList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList := IContactList(outPtr)
        }

        return this.__IContactList.GetContactAsync(contactId)
    }

    /**
     * Adds a [SyncManager](contactlistsyncmanager.md) to the [ContactList](contactlist.md).
     * @remarks
     * The [SyncManager](contactlistsyncmanager.md) provides an entry point for other apps to call [ContactList.SyncManager.SyncAsync](contactlistsyncmanager_syncasync_2144191352.md). Calling [ContactList.SyncManager.SyncAsync](contactlistsyncmanager_syncasync_2144191352.md) will launch the provider app as a background task and fire a [IContactDataProviderConnection.SyncRequested](../windows.applicationmodel.contacts.dataprovider/contactdataproviderconnection_syncrequested.md) event. An app should only call this method if they are set up as contact provider.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.registersyncmanagerasync
     */
    RegisterSyncManagerAsync() {
        if (!this.HasProp("__IContactList2")) {
            if ((queryResult := this.QueryInterface(IContactList2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList2 := IContactList2(outPtr)
        }

        return this.__IContactList2.RegisterSyncManagerAsync()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SupportsServerSearch(value) {
        if (!this.HasProp("__IContactList2")) {
            if ((queryResult := this.QueryInterface(IContactList2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList2 := IContactList2(outPtr)
        }

        return this.__IContactList2.put_SupportsServerSearch(value)
    }

    /**
     * 
     * @returns {ContactListSyncConstraints} 
     */
    get_SyncConstraints() {
        if (!this.HasProp("__IContactList2")) {
            if ((queryResult := this.QueryInterface(IContactList2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList2 := IContactList2(outPtr)
        }

        return this.__IContactList2.get_SyncConstraints()
    }

    /**
     * 
     * @returns {ContactListLimitedWriteOperations} 
     */
    get_LimitedWriteOperations() {
        if (!this.HasProp("__IContactList3")) {
            if ((queryResult := this.QueryInterface(IContactList3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList3 := IContactList3(outPtr)
        }

        return this.__IContactList3.get_LimitedWriteOperations()
    }

    /**
     * Gets a [ContactChangeTracker](contactchangetracker.md) that provides functionality for monitoring changes to [Contact](contact.md) objects in the [ContactList](contactlist.md).
     * @remarks
     * You can create multiple [ContactChangeTracker](contactchangetracker.md) instances by using this method. If you pass in a string that identifies a [ContactChangeTracker](contactchangetracker.md) that already exists in the [ContactList](contactlist.md), this method returns that instance. If the string that you pass into this method does not identify an existing an existing [ContactChangeTracker](contactchangetracker.md), this method returns a new [ContactChangeTracker](contactchangetracker.md).
     * 
     * You can use the [IsTracking](contactchangetracker_istracking.md) property of the [ContactChangeTracker](contactchangetracker.md) to determine whether change tracking is enabled for the [ContactChangeTracker](contactchangetracker.md).
     * @param {HSTRING} identity A string that identifies the [ContactChangeTracker](contactchangetracker.md) instance in the [ContactList](contactlist.md).
     * @returns {ContactChangeTracker} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlist.getchangetracker
     */
    GetChangeTracker(identity) {
        if (!this.HasProp("__IContactList3")) {
            if ((queryResult := this.QueryInterface(IContactList3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactList3 := IContactList3(outPtr)
        }

        return this.__IContactList3.GetChangeTracker(identity)
    }

;@endregion Instance Methods
}
