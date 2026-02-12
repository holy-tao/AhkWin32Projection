#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactAnnotationStore.ahk
#Include .\IContactAnnotationStore2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a data store that contains contact annotations.
 * @remarks
 * Call [ContactManager.RequestAnnotationStoreAsync](contactmanager_requestannotationstoreasync_2147083254.md) to get an instance of ContactAnnotationStore.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationstore
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactAnnotationStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactAnnotationStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactAnnotationStore.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets a list of [Id](contact_id.md) values based on [Contact](contact.md) objects with a specified email address.
     * @param {HSTRING} emailAddress The email address used to find the contact [Id](contact_id.md) values.
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationstore.findcontactidsbyemailasync
     */
    FindContactIdsByEmailAsync(emailAddress) {
        if (!this.HasProp("__IContactAnnotationStore")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationStore := IContactAnnotationStore(outPtr)
        }

        return this.__IContactAnnotationStore.FindContactIdsByEmailAsync(emailAddress)
    }

    /**
     * Gets a list of [Id](contact_id.md) values based on [Contact](contact.md) objects with a specified phone number.
     * @param {HSTRING} phoneNumber The phone number used to find the contact [Id](contact_id.md) values.
     * @returns {IAsyncOperation<IVectorView<HSTRING>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationstore.findcontactidsbyphonenumberasync
     */
    FindContactIdsByPhoneNumberAsync(phoneNumber) {
        if (!this.HasProp("__IContactAnnotationStore")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationStore := IContactAnnotationStore(outPtr)
        }

        return this.__IContactAnnotationStore.FindContactIdsByPhoneNumberAsync(phoneNumber)
    }

    /**
     * Get the annotations for the specified [Contact](contact.md).
     * @param {Contact} contact_ The [Contact](contact.md) for which to retrieve annotations.
     * @returns {IAsyncOperation<IVectorView<ContactAnnotation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationstore.findannotationsforcontactasync
     */
    FindAnnotationsForContactAsync(contact_) {
        if (!this.HasProp("__IContactAnnotationStore")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationStore := IContactAnnotationStore(outPtr)
        }

        return this.__IContactAnnotationStore.FindAnnotationsForContactAsync(contact_)
    }

    /**
     * Asynchronously disables the specified [ContactAnnotation](contactannotation.md), usually as a result of user input.
     * @param {ContactAnnotation} annotation The annotation to disable.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationstore.disableannotationasync
     */
    DisableAnnotationAsync(annotation) {
        if (!this.HasProp("__IContactAnnotationStore")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationStore := IContactAnnotationStore(outPtr)
        }

        return this.__IContactAnnotationStore.DisableAnnotationAsync(annotation)
    }

    /**
     * Asynchronously creates a [ContactAnnotationList](contactannotationlist.md) and associates it with the specified user data account ID.
     * @remarks
     * The user data account specified in *userDataAccountId* must be owned this app.
     * @returns {IAsyncOperation<ContactAnnotationList>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationstore.createannotationlistasync
     */
    CreateAnnotationListAsync() {
        if (!this.HasProp("__IContactAnnotationStore")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationStore := IContactAnnotationStore(outPtr)
        }

        return this.__IContactAnnotationStore.CreateAnnotationListAsync()
    }

    /**
     * Asynchronously creates a [ContactAnnotationList](contactannotationlist.md).
     * @param {HSTRING} userDataAccountId 
     * @returns {IAsyncOperation<ContactAnnotationList>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationstore.createannotationlistasync
     */
    CreateAnnotationListInAccountAsync(userDataAccountId) {
        if (!this.HasProp("__IContactAnnotationStore")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationStore := IContactAnnotationStore(outPtr)
        }

        return this.__IContactAnnotationStore.CreateAnnotationListInAccountAsync(userDataAccountId)
    }

    /**
     * Asynchronously gets the [ContactAnnotationList](contactannotationlist.md) with the specified ID.
     * @param {HSTRING} annotationListId The ID of the [ContactAnnotationList](contactannotationlist.md) to get.
     * @returns {IAsyncOperation<ContactAnnotationList>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationstore.getannotationlistasync
     */
    GetAnnotationListAsync(annotationListId) {
        if (!this.HasProp("__IContactAnnotationStore")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationStore := IContactAnnotationStore(outPtr)
        }

        return this.__IContactAnnotationStore.GetAnnotationListAsync(annotationListId)
    }

    /**
     * Asynchronously gets the list of [ContactAnnotationList](contactannotationlist.md) objects for the app.
     * @returns {IAsyncOperation<IVectorView<ContactAnnotationList>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationstore.findannotationlistsasync
     */
    FindAnnotationListsAsync() {
        if (!this.HasProp("__IContactAnnotationStore")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationStore := IContactAnnotationStore(outPtr)
        }

        return this.__IContactAnnotationStore.FindAnnotationListsAsync()
    }

    /**
     * Gets the annotations for the specified [ContactList](contactlist.md).
     * @param {HSTRING} contactListId The ID of the [ContactList](contactlist.md) for which to retrieve annotations.
     * @returns {IAsyncOperation<IVectorView<ContactAnnotation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactannotationstore.findannotationsforcontactlistasync
     */
    FindAnnotationsForContactListAsync(contactListId) {
        if (!this.HasProp("__IContactAnnotationStore2")) {
            if ((queryResult := this.QueryInterface(IContactAnnotationStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAnnotationStore2 := IContactAnnotationStore2(outPtr)
        }

        return this.__IContactAnnotationStore2.FindAnnotationsForContactListAsync(contactListId)
    }

;@endregion Instance Methods
}
