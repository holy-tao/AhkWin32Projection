#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactListDeleteContactRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to delete a contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistdeletecontactrequest
 * @namespace Windows.ApplicationModel.Contacts.DataProvider
 * @version WindowsRuntime 1.4
 */
class ContactListDeleteContactRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactListDeleteContactRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactListDeleteContactRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the contact list that contains the contact that is to be deleted.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistdeletecontactrequest.contactlistid
     * @type {HSTRING} 
     */
    ContactListId {
        get => this.get_ContactListId()
    }

    /**
     * Gets the contact ID of the contact to be deleted.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistdeletecontactrequest.contactid
     * @type {HSTRING} 
     */
    ContactId {
        get => this.get_ContactId()
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
        if (!this.HasProp("__IContactListDeleteContactRequest")) {
            if ((queryResult := this.QueryInterface(IContactListDeleteContactRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListDeleteContactRequest := IContactListDeleteContactRequest(outPtr)
        }

        return this.__IContactListDeleteContactRequest.get_ContactListId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactId() {
        if (!this.HasProp("__IContactListDeleteContactRequest")) {
            if ((queryResult := this.QueryInterface(IContactListDeleteContactRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListDeleteContactRequest := IContactListDeleteContactRequest(outPtr)
        }

        return this.__IContactListDeleteContactRequest.get_ContactId()
    }

    /**
     * Informs the client app that the request was processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistdeletecontactrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IContactListDeleteContactRequest")) {
            if ((queryResult := this.QueryInterface(IContactListDeleteContactRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListDeleteContactRequest := IContactListDeleteContactRequest(outPtr)
        }

        return this.__IContactListDeleteContactRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.dataprovider.contactlistdeletecontactrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IContactListDeleteContactRequest")) {
            if ((queryResult := this.QueryInterface(IContactListDeleteContactRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListDeleteContactRequest := IContactListDeleteContactRequest(outPtr)
        }

        return this.__IContactListDeleteContactRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
