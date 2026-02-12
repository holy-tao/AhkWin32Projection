#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactManagerForUser.ahk
#Include .\IContactManagerForUser2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a service that source apps can call to access contact data for a specific user.
 * @remarks
 * Call the [ContactManager.GetForUser](contactmanager_getforuser_2058550280.md) method to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanagerforuser
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactManagerForUser extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactManagerForUser

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactManagerForUser.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the display name order for contacts.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanagerforuser.systemdisplaynameorder
     * @type {Integer} 
     */
    SystemDisplayNameOrder {
        get => this.get_SystemDisplayNameOrder()
        set => this.put_SystemDisplayNameOrder(value)
    }

    /**
     * Gets or sets the sort order for contacts. For example, sort by last name or first name.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanagerforuser.systemsortorder
     * @type {Integer} 
     */
    SystemSortOrder {
        get => this.get_SystemSortOrder()
        set => this.put_SystemSortOrder(value)
    }

    /**
     * Gets the [User](../windows.system/user.md) represented by this contact manager.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanagerforuser.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously converts a [Contact](contact.md) to a vCard.
     * @param {Contact} contact_ The [Contact](contact.md) to convert.
     * @returns {IAsyncOperation<RandomAccessStreamReference>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanagerforuser.convertcontacttovcardasync
     */
    ConvertContactToVCardAsync(contact_) {
        if (!this.HasProp("__IContactManagerForUser")) {
            if ((queryResult := this.QueryInterface(IContactManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactManagerForUser := IContactManagerForUser(outPtr)
        }

        return this.__IContactManagerForUser.ConvertContactToVCardAsync(contact_)
    }

    /**
     * Asynchronously converts a [Contact](contact.md) to a vCard.
     * @param {Contact} contact_ The [Contact](contact.md) to convert.
     * @param {Integer} maxBytes 
     * @returns {IAsyncOperation<RandomAccessStreamReference>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanagerforuser.convertcontacttovcardasync
     */
    ConvertContactToVCardAsyncWithMaxBytes(contact_, maxBytes) {
        if (!this.HasProp("__IContactManagerForUser")) {
            if ((queryResult := this.QueryInterface(IContactManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactManagerForUser := IContactManagerForUser(outPtr)
        }

        return this.__IContactManagerForUser.ConvertContactToVCardAsyncWithMaxBytes(contact_, maxBytes)
    }

    /**
     * Asynchronously converts a vCard to a [Contact](contact.md).
     * @param {IRandomAccessStreamReference} vCard A stream containing the vCard data.
     * @returns {IAsyncOperation<Contact>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanagerforuser.convertvcardtocontactasync
     */
    ConvertVCardToContactAsync(vCard) {
        if (!this.HasProp("__IContactManagerForUser")) {
            if ((queryResult := this.QueryInterface(IContactManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactManagerForUser := IContactManagerForUser(outPtr)
        }

        return this.__IContactManagerForUser.ConvertVCardToContactAsync(vCard)
    }

    /**
     * Asynchronously returns the [ContactStore](contactstore.md) from the system.
     * @param {Integer} accessType Specifies the access type, such as **AllContactsReadOnly** for all accounts or **AppContactsReadWrite** for the calling app's accounts.
     * @returns {IAsyncOperation<ContactStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanagerforuser.requeststoreasync
     */
    RequestStoreAsync(accessType) {
        if (!this.HasProp("__IContactManagerForUser")) {
            if ((queryResult := this.QueryInterface(IContactManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactManagerForUser := IContactManagerForUser(outPtr)
        }

        return this.__IContactManagerForUser.RequestStoreAsync(accessType)
    }

    /**
     * Asynchronously returns the [ContactAnnotationStore](contactannotationstore.md) from the system.
     * @param {Integer} accessType Specifies the access type, such as **AllAnnotationsReadWrite** for all annotations or **AppAnnotationsReadWrite** for the calling app's annotations.
     * @returns {IAsyncOperation<ContactAnnotationStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanagerforuser.requestannotationstoreasync
     */
    RequestAnnotationStoreAsync(accessType) {
        if (!this.HasProp("__IContactManagerForUser")) {
            if ((queryResult := this.QueryInterface(IContactManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactManagerForUser := IContactManagerForUser(outPtr)
        }

        return this.__IContactManagerForUser.RequestAnnotationStoreAsync(accessType)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SystemDisplayNameOrder() {
        if (!this.HasProp("__IContactManagerForUser")) {
            if ((queryResult := this.QueryInterface(IContactManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactManagerForUser := IContactManagerForUser(outPtr)
        }

        return this.__IContactManagerForUser.get_SystemDisplayNameOrder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SystemDisplayNameOrder(value) {
        if (!this.HasProp("__IContactManagerForUser")) {
            if ((queryResult := this.QueryInterface(IContactManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactManagerForUser := IContactManagerForUser(outPtr)
        }

        return this.__IContactManagerForUser.put_SystemDisplayNameOrder(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SystemSortOrder() {
        if (!this.HasProp("__IContactManagerForUser")) {
            if ((queryResult := this.QueryInterface(IContactManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactManagerForUser := IContactManagerForUser(outPtr)
        }

        return this.__IContactManagerForUser.get_SystemSortOrder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SystemSortOrder(value) {
        if (!this.HasProp("__IContactManagerForUser")) {
            if ((queryResult := this.QueryInterface(IContactManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactManagerForUser := IContactManagerForUser(outPtr)
        }

        return this.__IContactManagerForUser.put_SystemSortOrder(value)
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IContactManagerForUser")) {
            if ((queryResult := this.QueryInterface(IContactManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactManagerForUser := IContactManagerForUser(outPtr)
        }

        return this.__IContactManagerForUser.get_User()
    }

    /**
     * Queries the operating system for a user’s contact and shows the contact data in a full contact card.
     * @remarks
     * This method must be called from the main UI thread.
     * @param {Contact} contact_ The object that represents the contact that the app wants to display the contact card for.*contact* must contain at least an [Id](contact_id.md), [Emails](contact_emails.md), or a phone number from a [Phones](contact_phones.md) list to query the user’s contact database to retrieve a matching contact to display. [Id](contact_id.md) has higher priority for querying. If an [Id](contact_id.md) matches, the rest of query parameters will be ignored for matching purposes. If an [Id](contact_id.md) does not find a match, the query uses the rest of query parameters. [Emails](contact_emails.md) and [Phones](contact_phones.md) have equal priority for matching. If multiple email addresses, or phone numbers, or both are provided, the query first performs an exact match, requiring all query parameters to match a system contact record. If this results in no matches, the query uses "best effort" match, in which a match of any query parameters is sufficient.
     * 
     * If no matches occur, the data in the input contact displays in the contact card. If a match occurs, only system contact data displays, and the data in the input contact is discarded.
     * @param {FullContactCardOptions} fullContactCardOptions_ Specifies how to display the full contact card.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanagerforuser.showfullcontactcard
     */
    ShowFullContactCard(contact_, fullContactCardOptions_) {
        if (!this.HasProp("__IContactManagerForUser2")) {
            if ((queryResult := this.QueryInterface(IContactManagerForUser2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactManagerForUser2 := IContactManagerForUser2(outPtr)
        }

        return this.__IContactManagerForUser2.ShowFullContactCard(contact_, fullContactCardOptions_)
    }

;@endregion Instance Methods
}
