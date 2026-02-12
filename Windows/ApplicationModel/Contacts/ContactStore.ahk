#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactStore.ahk
#Include .\IContactStore2.ahk
#Include .\IContactStore3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ContactStore.ahk
#Include .\ContactChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a database that contains contacts.
 * @remarks
 * To get a ContactStore object, call the static utility method [ContactManager.RequestStoreAsync](contactmanager_requeststoreasync_112705385.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactstore
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactStore.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [ContactChangeTracker](contactchangetracker.md) which provides functionality for monitoring changes to [Contact](contact.md) objects in the [ContactStore](contactstore.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactstore.changetracker
     * @type {ContactChangeTracker} 
     */
    ChangeTracker {
        get => this.get_ChangeTracker()
    }

    /**
     * Gets a contact manager that provides functionality for linking individual (raw) contacts across services together into a single aggregate contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactstore.aggregatecontactmanager
     * @type {AggregateContactManager} 
     */
    AggregateContactManager {
        get => this.get_AggregateContactManager()
    }

    /**
     * Occurs when a [Contact](contact.md) in the [ContactStore](contactstore.md) has been changed.
     * @type {TypedEventHandler<ContactStore, ContactChangedEventArgs>}
    */
    OnContactChanged {
        get {
            if(!this.HasProp("__OnContactChanged")){
                this.__OnContactChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5da35e68-7513-5ead-aad4-cdd3de4e5ae7}"),
                    ContactStore,
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
     * Retrieves a list of [Contact](contact.md) objects based on the supplied search text.
     * @returns {IAsyncOperation<IVectorView<Contact>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactstore.findcontactsasync
     */
    FindContactsAsync() {
        if (!this.HasProp("__IContactStore")) {
            if ((queryResult := this.QueryInterface(IContactStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactStore := IContactStore(outPtr)
        }

        return this.__IContactStore.FindContactsAsync()
    }

    /**
     * Retrieves the list of all contacts in the contact store.
     * @param {HSTRING} searchText 
     * @returns {IAsyncOperation<IVectorView<Contact>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactstore.findcontactsasync
     */
    FindContactsWithSearchTextAsync(searchText) {
        if (!this.HasProp("__IContactStore")) {
            if ((queryResult := this.QueryInterface(IContactStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactStore := IContactStore(outPtr)
        }

        return this.__IContactStore.FindContactsWithSearchTextAsync(searchText)
    }

    /**
     * Retrieves a [Contact](contact.md) object representing the contact with the specified [Id](contact_id.md) value.
     * @param {HSTRING} contactId The [Id](contact_id.md) of the contact to be retrieved.
     * @returns {IAsyncOperation<Contact>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactstore.getcontactasync
     */
    GetContactAsync(contactId) {
        if (!this.HasProp("__IContactStore")) {
            if ((queryResult := this.QueryInterface(IContactStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactStore := IContactStore(outPtr)
        }

        return this.__IContactStore.GetContactAsync(contactId)
    }

    /**
     * 
     * @returns {ContactChangeTracker} 
     */
    get_ChangeTracker() {
        if (!this.HasProp("__IContactStore2")) {
            if ((queryResult := this.QueryInterface(IContactStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactStore2 := IContactStore2(outPtr)
        }

        return this.__IContactStore2.get_ChangeTracker()
    }

    /**
     * 
     * @param {TypedEventHandler<ContactStore, ContactChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_ContactChanged(value) {
        if (!this.HasProp("__IContactStore2")) {
            if ((queryResult := this.QueryInterface(IContactStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactStore2 := IContactStore2(outPtr)
        }

        return this.__IContactStore2.add_ContactChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} value 
     * @returns {HRESULT} 
     */
    remove_ContactChanged(value) {
        if (!this.HasProp("__IContactStore2")) {
            if ((queryResult := this.QueryInterface(IContactStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactStore2 := IContactStore2(outPtr)
        }

        return this.__IContactStore2.remove_ContactChanged(value)
    }

    /**
     * 
     * @returns {AggregateContactManager} 
     */
    get_AggregateContactManager() {
        if (!this.HasProp("__IContactStore2")) {
            if ((queryResult := this.QueryInterface(IContactStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactStore2 := IContactStore2(outPtr)
        }

        return this.__IContactStore2.get_AggregateContactManager()
    }

    /**
     * Asynchronously returns the list of [ContactList](contactlist.md) objects.
     * @returns {IAsyncOperation<IVectorView<ContactList>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactstore.findcontactlistsasync
     */
    FindContactListsAsync() {
        if (!this.HasProp("__IContactStore2")) {
            if ((queryResult := this.QueryInterface(IContactStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactStore2 := IContactStore2(outPtr)
        }

        return this.__IContactStore2.FindContactListsAsync()
    }

    /**
     * Asynchronously gets the [ContactList](contactlist.md) with the specified ID.
     * @remarks
     * This method throws an invalid argument exception if the *contactListId* is malformed.
     * @param {HSTRING} contactListId The ID of the [ContactList](contactlist.md) to retrieve.
     * @returns {IAsyncOperation<ContactList>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactstore.getcontactlistasync
     */
    GetContactListAsync(contactListId) {
        if (!this.HasProp("__IContactStore2")) {
            if ((queryResult := this.QueryInterface(IContactStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactStore2 := IContactStore2(outPtr)
        }

        return this.__IContactStore2.GetContactListAsync(contactListId)
    }

    /**
     * Asynchronously creates a [ContactList](contactlist.md) with the specified display name and user account.
     * @param {HSTRING} displayName A name for the new [ContactList](contactlist.md), suitable for displaying in the user interface.
     * @returns {IAsyncOperation<ContactList>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactstore.createcontactlistasync
     */
    CreateContactListAsync(displayName) {
        if (!this.HasProp("__IContactStore2")) {
            if ((queryResult := this.QueryInterface(IContactStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactStore2 := IContactStore2(outPtr)
        }

        return this.__IContactStore2.CreateContactListAsync(displayName)
    }

    /**
     * Asynchronously gets the [Contact](contact.md) object that represents the current user.
     * @remarks
     * If no contact has been designated as representing the current user,
     * the return value is an empty contact.
     * You can detect this case by checking whether the contact's [Id](contact_id.md) property is nonempty.
     * @returns {IAsyncOperation<Contact>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactstore.getmecontactasync
     */
    GetMeContactAsync() {
        if (!this.HasProp("__IContactStore2")) {
            if ((queryResult := this.QueryInterface(IContactStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactStore2 := IContactStore2(outPtr)
        }

        return this.__IContactStore2.GetMeContactAsync()
    }

    /**
     * Creates and returns a [ContactReader](contactreader.md) for the [ContactStore](contactstore.md) with the specified [ContactQueryOptions](contactqueryoptions.md).
     * @returns {ContactReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactstore.getcontactreader
     */
    GetContactReader() {
        if (!this.HasProp("__IContactStore2")) {
            if ((queryResult := this.QueryInterface(IContactStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactStore2 := IContactStore2(outPtr)
        }

        return this.__IContactStore2.GetContactReader()
    }

    /**
     * Creates and returns a [ContactReader](contactreader.md) for the [ContactStore](contactstore.md).
     * @param {ContactQueryOptions} options 
     * @returns {ContactReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactstore.getcontactreader
     */
    GetContactReaderWithOptions(options) {
        if (!this.HasProp("__IContactStore2")) {
            if ((queryResult := this.QueryInterface(IContactStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactStore2 := IContactStore2(outPtr)
        }

        return this.__IContactStore2.GetContactReaderWithOptions(options)
    }

    /**
     * Asynchronously creates a [ContactList](contactlist.md) with the specified display name.
     * @param {HSTRING} displayName A name for the new [ContactList](contactlist.md), suitable for displaying in the user interface.
     * @param {HSTRING} userDataAccountId 
     * @returns {IAsyncOperation<ContactList>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactstore.createcontactlistasync
     */
    CreateContactListInAccountAsync(displayName, userDataAccountId) {
        if (!this.HasProp("__IContactStore2")) {
            if ((queryResult := this.QueryInterface(IContactStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactStore2 := IContactStore2(outPtr)
        }

        return this.__IContactStore2.CreateContactListInAccountAsync(displayName, userDataAccountId)
    }

    /**
     * Gets a [ContactChangeTracker](contactchangetracker.md) that provides functionality for monitoring changes to [Contact](contact.md) objects in the [ContactStore](contactstore.md).
     * @remarks
     * You can create multiple [ContactChangeTracker](contactchangetracker.md) instances by using this method. If you pass in a string that identifies a [ContactChangeTracker](contactchangetracker.md) that already exists in the store, this method returns that instance. If the string that you pass into this method does not identify an existing an existing [ContactChangeTracker](contactchangetracker.md), this method returns a new [ContactChangeTracker](contactchangetracker.md).
     * 
     * You can use the [IsTracking](contactchangetracker_istracking.md) property of the [ContactChangeTracker](contactchangetracker.md) to determine whether change tracking is enabled for the [ContactChangeTracker](contactchangetracker.md).
     * @param {HSTRING} identity A string that identifies the [ContactChangeTracker](contactchangetracker.md) instance in the store.
     * @returns {ContactChangeTracker} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactstore.getchangetracker
     */
    GetChangeTracker(identity) {
        if (!this.HasProp("__IContactStore3")) {
            if ((queryResult := this.QueryInterface(IContactStore3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactStore3 := IContactStore3(outPtr)
        }

        return this.__IContactStore3.GetChangeTracker(identity)
    }

;@endregion Instance Methods
}
