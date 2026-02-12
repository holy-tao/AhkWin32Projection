#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactListCreateOrUpdateContactRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to create or update a contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistcreateorupdatecontactrequest
 * @namespace Windows.ApplicationModel.Contacts.DataProvider
 * @version WindowsRuntime 1.4
 */
class ContactListCreateOrUpdateContactRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactListCreateOrUpdateContactRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactListCreateOrUpdateContactRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the contact list that contains the task that is to created or updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistcreateorupdatecontactrequest.contactlistid
     * @type {HSTRING} 
     */
    ContactListId {
        get => this.get_ContactListId()
    }

    /**
     * Gets the [Contact](../windows.applicationmodel.contacts/contact.md) of the task to be created or updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistcreateorupdatecontactrequest.contact
     * @type {Contact} 
     */
    Contact {
        get => this.get_Contact()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactListId() {
        if (!this.HasProp("__IContactListCreateOrUpdateContactRequest")) {
            if ((queryResult := this.QueryInterface(IContactListCreateOrUpdateContactRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListCreateOrUpdateContactRequest := IContactListCreateOrUpdateContactRequest(outPtr)
        }

        return this.__IContactListCreateOrUpdateContactRequest.get_ContactListId()
    }

    /**
     * 
     * @returns {Contact} 
     */
    get_Contact() {
        if (!this.HasProp("__IContactListCreateOrUpdateContactRequest")) {
            if ((queryResult := this.QueryInterface(IContactListCreateOrUpdateContactRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListCreateOrUpdateContactRequest := IContactListCreateOrUpdateContactRequest(outPtr)
        }

        return this.__IContactListCreateOrUpdateContactRequest.get_Contact()
    }

    /**
     * Informs the client app that the request was processed successfully.
     * @param {Contact} createdOrUpdatedContact The [Contact](../windows.applicationmodel.contacts/contact.md) of the contact that was created or updated.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistcreateorupdatecontactrequest.reportcompletedasync
     */
    ReportCompletedAsync(createdOrUpdatedContact) {
        if (!this.HasProp("__IContactListCreateOrUpdateContactRequest")) {
            if ((queryResult := this.QueryInterface(IContactListCreateOrUpdateContactRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListCreateOrUpdateContactRequest := IContactListCreateOrUpdateContactRequest(outPtr)
        }

        return this.__IContactListCreateOrUpdateContactRequest.ReportCompletedAsync(createdOrUpdatedContact)
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistcreateorupdatecontactrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IContactListCreateOrUpdateContactRequest")) {
            if ((queryResult := this.QueryInterface(IContactListCreateOrUpdateContactRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListCreateOrUpdateContactRequest := IContactListCreateOrUpdateContactRequest(outPtr)
        }

        return this.__IContactListCreateOrUpdateContactRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
