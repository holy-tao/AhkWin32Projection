#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactPickerUI.ahk
#Include .\IContactPickerUI2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\ContactPickerUI.ahk
#Include .\ContactRemovedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Allows you to call the contact picker UI so you can select one or more contacts.
 * @remarks
 * To see an example of how to use this class, check out our [code sample](https://github.com/microsoft/Windows-universal-samples/tree/master/Samples/ContactPicker).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.provider.contactpickerui
 * @namespace Windows.ApplicationModel.Contacts.Provider
 * @version WindowsRuntime 1.4
 */
class ContactPickerUI extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactPickerUI

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactPickerUI.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies the fields that you want returned after the user selects one or more contacts.
     * 
     * > [!NOTE]
     * > DesiredFields may be altered or unavailable for releases after Windows 8.1. Instead, use [DesiredFieldsWithContactFieldType](contactpickerui_desiredfieldswithcontactfieldtype.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.provider.contactpickerui.desiredfields
     * @type {IVectorView<HSTRING>} 
     */
    DesiredFields {
        get => this.get_DesiredFields()
    }

    /**
     * Determines the selection mode for the contact picker. The most common options are [PickSingleContactAsync](../windows.applicationmodel.contacts/contactpicker_picksinglecontactasync_2033050338.md) or [PickMultipleContactsAsync](../windows.applicationmodel.contacts/contactpicker_pickmultiplecontactsasync_1630502573.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.provider.contactpickerui.selectionmode
     * @type {Integer} 
     */
    SelectionMode {
        get => this.get_SelectionMode()
    }

    /**
     * Gets the fields with contact field type that you want returned after the user selects one or more contacts.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.provider.contactpickerui.desiredfieldswithcontactfieldtype
     * @type {IVector<Integer>} 
     */
    DesiredFieldsWithContactFieldType {
        get => this.get_DesiredFieldsWithContactFieldType()
    }

    /**
     * Occurs when the user deselects or removes the contact.
     * @type {TypedEventHandler<ContactPickerUI, ContactRemovedEventArgs>}
    */
    OnContactRemoved {
        get {
            if(!this.HasProp("__OnContactRemoved")){
                this.__OnContactRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a39aeb7e-765c-5e83-b231-84bead98e9a0}"),
                    ContactPickerUI,
                    ContactRemovedEventArgs
                )
                this.__OnContactRemovedToken := this.add_ContactRemoved(this.__OnContactRemoved.iface)
            }
            return this.__OnContactRemoved
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnContactRemovedToken")) {
            this.remove_ContactRemoved(this.__OnContactRemovedToken)
            this.__OnContactRemoved.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Adds a [Contact](../windows.applicationmodel.contacts/contact.md).
     * @remarks
     * > [!NOTE]
     * > The [Contact.Id](../windows.applicationmodel.contacts/contact_id.md) property must be set when you call AddContact. If [Contact.Id](../windows.applicationmodel.contacts/contact_id.md) isn't set, your app will fail.
     * @param {HSTRING} id 
     * @param {Contact} contact_ An object that contains the contact's information.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.provider.contactpickerui.addcontact
     */
    AddContact(id, contact_) {
        if (!this.HasProp("__IContactPickerUI")) {
            if ((queryResult := this.QueryInterface(IContactPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPickerUI := IContactPickerUI(outPtr)
        }

        return this.__IContactPickerUI.AddContact(id, contact_)
    }

    /**
     * Removes a contact.
     * @remarks
     * > [!NOTE]
     * > The [Contact.Id](../windows.applicationmodel.contacts/contact_id.md) property must be set when you call RemoveContact. If [Contact.Id](../windows.applicationmodel.contacts/contact_id.md) isn't set, your app won't be able to remove the contact.
     * @param {HSTRING} id The ID of the contact to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.provider.contactpickerui.removecontact
     */
    RemoveContact(id) {
        if (!this.HasProp("__IContactPickerUI")) {
            if ((queryResult := this.QueryInterface(IContactPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPickerUI := IContactPickerUI(outPtr)
        }

        return this.__IContactPickerUI.RemoveContact(id)
    }

    /**
     * Checks to see whether the contact was already selected by the user.
     * @remarks
     * > [!NOTE]
     * > The [Contact.Id](../windows.applicationmodel.contacts/contact_id.md) property must be set when you call ContainsContact. If [Contact.Id](../windows.applicationmodel.contacts/contact_id.md) isn't set, your app won't be able to find the contact.
     * @param {HSTRING} id The ID of the contact.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.provider.contactpickerui.containscontact
     */
    ContainsContact(id) {
        if (!this.HasProp("__IContactPickerUI")) {
            if ((queryResult := this.QueryInterface(IContactPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPickerUI := IContactPickerUI(outPtr)
        }

        return this.__IContactPickerUI.ContainsContact(id)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_DesiredFields() {
        if (!this.HasProp("__IContactPickerUI")) {
            if ((queryResult := this.QueryInterface(IContactPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPickerUI := IContactPickerUI(outPtr)
        }

        return this.__IContactPickerUI.get_DesiredFields()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionMode() {
        if (!this.HasProp("__IContactPickerUI")) {
            if ((queryResult := this.QueryInterface(IContactPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPickerUI := IContactPickerUI(outPtr)
        }

        return this.__IContactPickerUI.get_SelectionMode()
    }

    /**
     * 
     * @param {TypedEventHandler<ContactPickerUI, ContactRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ContactRemoved(handler) {
        if (!this.HasProp("__IContactPickerUI")) {
            if ((queryResult := this.QueryInterface(IContactPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPickerUI := IContactPickerUI(outPtr)
        }

        return this.__IContactPickerUI.add_ContactRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ContactRemoved(token) {
        if (!this.HasProp("__IContactPickerUI")) {
            if ((queryResult := this.QueryInterface(IContactPickerUI.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPickerUI := IContactPickerUI(outPtr)
        }

        return this.__IContactPickerUI.remove_ContactRemoved(token)
    }

    /**
     * Adds a [Contact](../windows.applicationmodel.contacts/contact.md).
     * 
     * > [!NOTE]
     * > AddContact may be altered or unavailable for releases after Windows 8.1. Instead, use [AddContact](contactpickerui_addcontact_79336216.md) without the ID.
     * @param {Contact} contact_ An object that contains the contact's information.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.provider.contactpickerui.addcontact
     */
    AddContact1(contact_) {
        if (!this.HasProp("__IContactPickerUI2")) {
            if ((queryResult := this.QueryInterface(IContactPickerUI2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPickerUI2 := IContactPickerUI2(outPtr)
        }

        return this.__IContactPickerUI2.AddContact(contact_)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_DesiredFieldsWithContactFieldType() {
        if (!this.HasProp("__IContactPickerUI2")) {
            if ((queryResult := this.QueryInterface(IContactPickerUI2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPickerUI2 := IContactPickerUI2(outPtr)
        }

        return this.__IContactPickerUI2.get_DesiredFieldsWithContactFieldType()
    }

;@endregion Instance Methods
}
