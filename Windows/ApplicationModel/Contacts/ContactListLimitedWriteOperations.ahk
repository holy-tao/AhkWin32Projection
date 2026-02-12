#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactListLimitedWriteOperations.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides operations that an app can perform on a contact list that it has not created.
 * @remarks
 * Get an instance of this class by using the [LimitedWriteOperations](contactlist_limitedwriteoperations.md) property of a [ContactList](contactlist.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistlimitedwriteoperations
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactListLimitedWriteOperations extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactListLimitedWriteOperations

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactListLimitedWriteOperations.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously attempts to create or update a contact.
     * @param {Contact} contact_ The contact to create or update.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistlimitedwriteoperations.trycreateorupdatecontactasync
     */
    TryCreateOrUpdateContactAsync(contact_) {
        if (!this.HasProp("__IContactListLimitedWriteOperations")) {
            if ((queryResult := this.QueryInterface(IContactListLimitedWriteOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListLimitedWriteOperations := IContactListLimitedWriteOperations(outPtr)
        }

        return this.__IContactListLimitedWriteOperations.TryCreateOrUpdateContactAsync(contact_)
    }

    /**
     * Asynchronously attempts to delete a contact.
     * @param {HSTRING} contactId The ID of the contact to delete.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlistlimitedwriteoperations.trydeletecontactasync
     */
    TryDeleteContactAsync(contactId) {
        if (!this.HasProp("__IContactListLimitedWriteOperations")) {
            if ((queryResult := this.QueryInterface(IContactListLimitedWriteOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactListLimitedWriteOperations := IContactListLimitedWriteOperations(outPtr)
        }

        return this.__IContactListLimitedWriteOperations.TryDeleteContactAsync(contactId)
    }

;@endregion Instance Methods
}
