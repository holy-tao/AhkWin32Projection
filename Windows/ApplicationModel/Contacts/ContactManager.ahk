#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactManagerStatics3.ahk
#Include .\IContactManagerStatics5.ahk
#Include .\IContactManagerStatics4.ahk
#Include .\IContactManagerStatics2.ahk
#Include .\IContactManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a service that source apps can call to access contact data.
 * @remarks
 * All relevant methods of this class are static methods.
 * 
 * For info about how to manage contacts, see [Contacts and calendar](/windows/uwp/contacts-and-calendar/).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactManager extends IInspectable {
;@region Static Properties
    /**
     * Gets or sets the display name order.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.systemdisplaynameorder
     * @type {Integer} 
     */
    static SystemDisplayNameOrder {
        get => ContactManager.get_SystemDisplayNameOrder()
        set => ContactManager.put_SystemDisplayNameOrder(value)
    }

    /**
     * Gets or sets the sort order.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.systemsortorder
     * @type {Integer} 
     */
    static SystemSortOrder {
        get => ContactManager.get_SystemSortOrder()
        set => ContactManager.put_SystemSortOrder(value)
    }

    /**
     * Gets or sets a Boolean that indicates whether the middle name of a contact is included in the [DisplayName](contact_displayname.md) and [SortName](contact_sortname.md) of a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.includemiddlenameinsystemdisplayandsort
     * @type {Boolean} 
     */
    static IncludeMiddleNameInSystemDisplayAndSort {
        get => ContactManager.get_IncludeMiddleNameInSystemDisplayAndSort()
        set => ContactManager.put_IncludeMiddleNameInSystemDisplayAndSort(value)
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Asynchronously converts a [Contact](contact.md) to a vCard.
     * @param {Contact} contact_ The [Contact](contact.md) to convert.
     * @returns {IAsyncOperation<RandomAccessStreamReference>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.convertcontacttovcardasync
     */
    static ConvertContactToVCardAsync(contact_) {
        if (!ContactManager.HasProp("__IContactManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics3.IID)
            ContactManager.__IContactManagerStatics3 := IContactManagerStatics3(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics3.ConvertContactToVCardAsync(contact_)
    }

    /**
     * Asynchronously converts a [Contact](contact.md) to a vCard.
     * @param {Contact} contact_ The [Contact](contact.md) to convert.
     * @param {Integer} maxBytes 
     * @returns {IAsyncOperation<RandomAccessStreamReference>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.convertcontacttovcardasync
     */
    static ConvertContactToVCardAsyncWithMaxBytes(contact_, maxBytes) {
        if (!ContactManager.HasProp("__IContactManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics3.IID)
            ContactManager.__IContactManagerStatics3 := IContactManagerStatics3(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics3.ConvertContactToVCardAsyncWithMaxBytes(contact_, maxBytes)
    }

    /**
     * Asynchronously converts a vCard to a [Contact](contact.md).
     * @param {IRandomAccessStreamReference} vCard A stream containing the vCard data.
     * @returns {IAsyncOperation<Contact>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.convertvcardtocontactasync
     */
    static ConvertVCardToContactAsync(vCard) {
        if (!ContactManager.HasProp("__IContactManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics3.IID)
            ContactManager.__IContactManagerStatics3 := IContactManagerStatics3(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics3.ConvertVCardToContactAsync(vCard)
    }

    /**
     * Retrieves a [ContactStore](contactstore.md) object that enables searching or retrieving contacts on the device.
     * @remarks
     * This method requests [AllContactsReadOnly](contactstoreaccesstype.md) access to the contact store. If you require a different level of access, call the [RequestStoreAsync(ContactStoreAccessType)](contactmanager_requeststoreasync_112705385.md) method instead.
     * @param {Integer} accessType 
     * @returns {IAsyncOperation<ContactStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.requeststoreasync
     */
    static RequestStoreAsyncWithAccessType(accessType) {
        if (!ContactManager.HasProp("__IContactManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics3.IID)
            ContactManager.__IContactManagerStatics3 := IContactManagerStatics3(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics3.RequestStoreAsyncWithAccessType(accessType)
    }

    /**
     * Asynchronously requests access to the [ContactAnnotationStore](contactannotationstore.md).
     * @param {Integer} accessType Specifies the type of access request, app contact annotations or all annotations.
     * @returns {IAsyncOperation<ContactAnnotationStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.requestannotationstoreasync
     */
    static RequestAnnotationStoreAsync(accessType) {
        if (!ContactManager.HasProp("__IContactManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics3.IID)
            ContactManager.__IContactManagerStatics3 := IContactManagerStatics3(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics3.RequestAnnotationStoreAsync(accessType)
    }

    /**
     * Gets a Boolean value that indicates whether the [ShowContactCard](/uwp/api/windows.applicationmodel.contacts.contactmanager.showcontactcard) method is supported on the current platform.
     * @remarks
     * > [!NOTE]
     * > Source apps must be running in the foreground to call this method. An app that runs in the background will get an "Access Denied" exception if it calls this method. The return value of the method should not be cached and should only be called when needed.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.isshowcontactcardsupported
     */
    static IsShowContactCardSupported() {
        if (!ContactManager.HasProp("__IContactManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics3.IID)
            ContactManager.__IContactManagerStatics3 := IContactManagerStatics3(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics3.IsShowContactCardSupported()
    }

    /**
     * Shows a contact card with the specified parameters.
     * @remarks
     * See the remarks section of this overload: [ShowContactCard](contactmanager_showcontactcard_1968125937.md).
     * @param {Contact} contact_ The object that represents the contact that the app wants to display the contact card for.*contact* must contain at least an [Id](contact_id.md), [Emails](contact_emails.md), or a phone number from a [Phones](contact_phones.md) list to query the user’s contact database to retrieve a matching contact to display. [Id](contact_id.md) has higher priority for querying. If an [Id](contact_id.md) matches, the rest of query parameters will be ignored for matching purposes. If an [Id](contact_id.md) does not find a match, the query uses the rest of query parameters. [Emails](contact_emails.md) and [Phones](contact_phones.md) have equal priority for matching. If multiple email addresses, or phone numbers, or both are provided, the query first performs an exact match, requiring all query parameters to match a system contact record. If this results in no matches, the query uses "best effort" match, in which a match of any query parameters is sufficient.
     * 
     * If no matches occur, the data in the input contact displays in the contact card. If a match occurs, only system contact data displays, and the data in the input contact is discarded.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the contact card, not within that rectangular area. For example, if an app uses a button to show the contact card, pass the [Rect](../windows.foundation/rect.md) of the button so the contact card displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement The [Placement](../windows.ui.popups/placement.md) that describes the preferred placement of the contact card.
     * @param {ContactCardOptions} contactCardOptions_ Specifies how to display the contact card, such as which tab to start on when displaying a mini contact card.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.showcontactcard
     */
    static ShowContactCardWithOptions(contact_, selection, preferredPlacement, contactCardOptions_) {
        if (!ContactManager.HasProp("__IContactManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics3.IID)
            ContactManager.__IContactManagerStatics3 := IContactManagerStatics3(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics3.ShowContactCardWithOptions(contact_, selection, preferredPlacement, contactCardOptions_)
    }

    /**
     * Gets a Boolean value that indicates whether the [ShowDelayLoadedContactCard](/uwp/api/windows.applicationmodel.contacts.contactmanager.showdelayloadedcontactcard) method is supported on the current platform.
     * @remarks
     * > [!NOTE]
     * > Source apps must be running in the foreground to call this method. An app that runs in the background will get an "Access Denied" exception if it calls this method. The return value of the method should not be cached and should only be called when needed.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.isshowdelayloadedcontactcardsupported
     */
    static IsShowDelayLoadedContactCardSupported() {
        if (!ContactManager.HasProp("__IContactManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics3.IID)
            ContactManager.__IContactManagerStatics3 := IContactManagerStatics3(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics3.IsShowDelayLoadedContactCardSupported()
    }

    /**
     * Shows a contact card that can be updated later if the contact does not exist in the user’s contact database.
     * @param {Contact} contact_ The object that represents the contact that the app wants to display the contact card for.*contact* must contain at least an [Id](contact_id.md), [Emails](contact_emails.md), or a phone number from a [Phones](contact_phones.md) list to query the user’s contact database to retrieve a matching contact to display. [Id](contact_id.md) has higher priority for querying. If an [Id](contact_id.md) matches, the rest of query parameters will be ignored for matching purposes. If an [Id](contact_id.md) does not find a match, the query uses the rest of query parameters. [Emails](contact_emails.md) and [Phones](contact_phones.md) have equal priority for matching. If multiple email addresses, or phone numbers, or both are provided, the query first performs an exact match, requiring all query parameters to match a system contact record. If this results in no matches, the query uses "best effort" match, in which a match of any query parameters is sufficient.
     * 
     * If no matches occur, the data in the input contact displays in the contact card. If a match occurs, only system contact data displays, and the data in the input contact is discarded.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the contact card, not within that rectangular area. For example, if an app uses a button to show the contact card, pass the [Rect](../windows.foundation/rect.md) of the button so the contact card displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement The [Placement](../windows.ui.popups/placement.md) that describes the preferred placement of the contact card.
     * @param {ContactCardOptions} contactCardOptions_ 
     * @returns {ContactCardDelayedDataLoader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.showdelayloadedcontactcard
     */
    static ShowDelayLoadedContactCardWithOptions(contact_, selection, preferredPlacement, contactCardOptions_) {
        if (!ContactManager.HasProp("__IContactManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics3.IID)
            ContactManager.__IContactManagerStatics3 := IContactManagerStatics3(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics3.ShowDelayLoadedContactCardWithOptions(contact_, selection, preferredPlacement, contactCardOptions_)
    }

    /**
     * Queries the operating system for a user’s contact and shows the contact data in a full contact card.
     * @param {Contact} contact_ The object that represents the contact that the app wants to display the contact card for.*contact* must contain at least an [Id](contact_id.md), [Emails](contact_emails.md), or a phone number from a [Phones](contact_phones.md) list to query the user’s contact database to retrieve a matching contact to display. [Id](contact_id.md) has higher priority for querying. If an [Id](contact_id.md) matches, the rest of query parameters will be ignored for matching purposes. If an [Id](contact_id.md) does not find a match, the query uses the rest of query parameters. [Emails](contact_emails.md) and [Phones](contact_phones.md) have equal priority for matching. If multiple email addresses, or phone numbers, or both are provided, the query first performs an exact match, requiring all query parameters to match a system contact record. If this results in no matches, the query uses "best effort" match, in which a match of any query parameters is sufficient.
     * 
     * If no matches occur, the data in the input contact displays in the contact card. If a match occurs, only system contact data displays, and the data in the input contact is discarded.
     * @param {FullContactCardOptions} fullContactCardOptions_ Specifies how to display the full contact card.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.showfullcontactcard
     */
    static ShowFullContactCard(contact_, fullContactCardOptions_) {
        if (!ContactManager.HasProp("__IContactManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics3.IID)
            ContactManager.__IContactManagerStatics3 := IContactManagerStatics3(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics3.ShowFullContactCard(contact_, fullContactCardOptions_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SystemDisplayNameOrder() {
        if (!ContactManager.HasProp("__IContactManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics3.IID)
            ContactManager.__IContactManagerStatics3 := IContactManagerStatics3(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics3.get_SystemDisplayNameOrder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    static put_SystemDisplayNameOrder(value) {
        if (!ContactManager.HasProp("__IContactManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics3.IID)
            ContactManager.__IContactManagerStatics3 := IContactManagerStatics3(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics3.put_SystemDisplayNameOrder(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SystemSortOrder() {
        if (!ContactManager.HasProp("__IContactManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics3.IID)
            ContactManager.__IContactManagerStatics3 := IContactManagerStatics3(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics3.get_SystemSortOrder()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    static put_SystemSortOrder(value) {
        if (!ContactManager.HasProp("__IContactManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics3.IID)
            ContactManager.__IContactManagerStatics3 := IContactManagerStatics3(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics3.put_SystemSortOrder(value)
    }

    /**
     * Gets a Boolean value that indicates whether the [ShowFullContactCard](contactmanagerforuser_showfullcontactcard_2012855989.md) method is supported on the current platform.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.isshowfullcontactcardsupportedasync
     */
    static IsShowFullContactCardSupportedAsync() {
        if (!ContactManager.HasProp("__IContactManagerStatics5")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics5.IID)
            ContactManager.__IContactManagerStatics5 := IContactManagerStatics5(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics5.IsShowFullContactCardSupportedAsync()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IncludeMiddleNameInSystemDisplayAndSort() {
        if (!ContactManager.HasProp("__IContactManagerStatics5")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics5.IID)
            ContactManager.__IContactManagerStatics5 := IContactManagerStatics5(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics5.get_IncludeMiddleNameInSystemDisplayAndSort()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    static put_IncludeMiddleNameInSystemDisplayAndSort(value) {
        if (!ContactManager.HasProp("__IContactManagerStatics5")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics5.IID)
            ContactManager.__IContactManagerStatics5 := IContactManagerStatics5(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics5.put_IncludeMiddleNameInSystemDisplayAndSort(value)
    }

    /**
     * Gets the [ContactManagerForUser](contactmanagerforuser.md) object for the specified user.
     * @param {User} user_ The user account to use to get the [ContactManagerForUser](contactmanagerforuser.md) object.
     * @returns {ContactManagerForUser} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.getforuser
     */
    static GetForUser(user_) {
        if (!ContactManager.HasProp("__IContactManagerStatics4")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics4.IID)
            ContactManager.__IContactManagerStatics4 := IContactManagerStatics4(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics4.GetForUser(user_)
    }

    /**
     * Retrieves a [ContactStore](contactstore.md) object that enables searching or retrieving contacts on the device.
     * @returns {IAsyncOperation<ContactStore>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.requeststoreasync
     */
    static RequestStoreAsync() {
        if (!ContactManager.HasProp("__IContactManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics2.IID)
            ContactManager.__IContactManagerStatics2 := IContactManagerStatics2(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics2.RequestStoreAsync()
    }

    /**
     * Queries the operating system for a user’s contact and shows the contact data in a contact card.
     * @remarks
     * > [!NOTE]
     * > Source apps must be running in the foreground to call this method. An app that runs in the background will get an "Access Denied" exception if it calls this method.
     * 
     * Most typical operations will result in displaying a UI.
     * 
     * + **If there is one exact match for the requested  contact:** Shows the contact card UI with information from the contacts store in the operating system. 
     * + **If there are multiple matches:** Shows the contact card UI for the first matching contact found.
     * + **If there is no match:** Shows the contact card UI, where the contact info comes from the input *contact* object.
     * 
     * 
     * If there's an error, such as an invalid input for the *contact* parameter, no UI is displayed.
     * 
     * For querying purposes, phone numbers support characters 0-9 and a-z/A-Z. If you put any other characters in a phone number, they are ignored when you query the contact.
     * 
     * For info about how to manage contacts, see [Contacts and calendar](/windows/uwp/contacts-and-calendar/).
     * 
     * For querying purposes, phone numbers support characters 0-9 and a-z/A-Z. If you put any other characters in a phone number, they are ignored when you query the contact.
     * @param {Contact} contact_ The object that represents the contact that the app wants to display the contact card for.*contact* must contain at least an [Id](contact_id.md), [Emails](contact_emails.md), or a phone number from a [Phones](contact_phones.md) list to query the user’s contact database to retrieve a matching contact to display. [Id](contact_id.md) has higher priority for querying. If an [Id](contact_id.md) matches, the rest of query parameters will be ignored for matching purposes. If an [Id](contact_id.md) does not find a match, the query uses the rest of query parameters. [Emails](contact_emails.md) and [Phones](contact_phones.md) have equal priority for matching. If multiple email addresses, or phone numbers, or both are provided, the query first performs an exact match, requiring all query parameters to match a system contact record. If this results in no matches, the query uses "best effort" match, in which a match of any query parameters is sufficient.
     * 
     * If no matches occur, the data in the input contact displays in the contact card. If a match occurs, only system contact data displays, and the data in the input contact is discarded.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the contact card, not within that rectangular area. For example, if an app uses a button to show the contact card, pass the [Rect](../windows.foundation/rect.md) of the button so the contact card displays around the button, not overlapping it.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.showcontactcard
     */
    static ShowContactCard(contact_, selection) {
        if (!ContactManager.HasProp("__IContactManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics.IID)
            ContactManager.__IContactManagerStatics := IContactManagerStatics(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics.ShowContactCard(contact_, selection)
    }

    /**
     * Queries the operating system for a user’s contact and shows the contact data in a contact card.
     * @remarks
     * See the remarks section of this overload: [ShowContactCard](contactmanager_showcontactcard_1968125937.md).
     * @param {Contact} contact_ The object that represents the contact that the app wants to display the contact card for.*contact* must contain at least an [Id](contact_id.md), [Emails](contact_emails.md), or a phone number from a [Phones](contact_phones.md) list to query the user’s contact database to retrieve a matching contact to display. [Id](contact_id.md) has higher priority for querying. If an [Id](contact_id.md) matches, the rest of query parameters will be ignored for matching purposes. If an [Id](contact_id.md) does not find a match, the query uses the rest of query parameters. [Emails](contact_emails.md) and [Phones](contact_phones.md) have equal priority for matching. If multiple email addresses, or phone numbers, or both are provided, the query first performs an exact match, requiring all query parameters to match a system contact record. If this results in no matches, the query uses "best effort" match, in which a match of any query parameters is sufficient.
     * 
     * If no matches occur, the data in the input contact displays in the contact card. If a match occurs, only system contact data displays, and the data in the input contact is discarded.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the contact card, not within that rectangular area. For example, if an app uses a button to show the contact card, pass the [Rect](../windows.foundation/rect.md) of the button so the contact card displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement The [Placement](../windows.ui.popups/placement.md) that describes the preferred placement of the contact card.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.showcontactcard
     */
    static ShowContactCardWithPlacement(contact_, selection, preferredPlacement) {
        if (!ContactManager.HasProp("__IContactManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics.IID)
            ContactManager.__IContactManagerStatics := IContactManagerStatics(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics.ShowContactCardWithPlacement(contact_, selection, preferredPlacement)
    }

    /**
     * Shows a contact card that can be updated later if the contact does not exist in the user’s contact database.
     * @param {Contact} contact_ The object that represents the contact that the app wants to display the contact card for.*contact* must contain at least an [Id](contact_id.md), [Emails](contact_emails.md), or a phone number from a [Phones](contact_phones.md) list to query the user’s contact database to retrieve a matching contact to display. [Id](contact_id.md) has higher priority for querying. If an [Id](contact_id.md) matches, the rest of query parameters will be ignored for matching purposes. If an [Id](contact_id.md) does not find a match, the query uses the rest of query parameters. [Emails](contact_emails.md) and [Phones](contact_phones.md) have equal priority for matching. If multiple email addresses, or phone numbers, or both are provided, the query first performs an exact match, requiring all query parameters to match a system contact record. If this results in no matches, the query uses "best effort" match, in which a match of any query parameters is sufficient.
     * 
     * If no matches occur, the data in the input contact displays in the contact card. If a match occurs, only system contact data displays, and the data in the input contact is discarded.
     * @param {RECT} selection The [Rect](../windows.foundation/rect.md) is the rectangular area of user selection (for example, pressing a button), around which the operating system displays the contact card, not within that rectangular area. For example, if an app uses a button to show the contact card, pass the [Rect](../windows.foundation/rect.md) of the button so the contact card displays around the button, not overlapping it.
     * @param {Integer} preferredPlacement The [Placement](../windows.ui.popups/placement.md) that describes the preferred placement of the contact card.
     * @returns {ContactCardDelayedDataLoader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactmanager.showdelayloadedcontactcard
     */
    static ShowDelayLoadedContactCard(contact_, selection, preferredPlacement) {
        if (!ContactManager.HasProp("__IContactManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactManagerStatics.IID)
            ContactManager.__IContactManagerStatics := IContactManagerStatics(factoryPtr)
        }

        return ContactManager.__IContactManagerStatics.ShowDelayLoadedContactCard(contact_, selection, preferredPlacement)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
