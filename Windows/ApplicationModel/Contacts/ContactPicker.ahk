#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactPicker.ahk
#Include .\IContactPicker2.ahk
#Include .\IContactPicker3.ahk
#Include .\IContactPickerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Controls how the Contact Picker user interface opens and what information it shows.
 * @remarks
 * The ContactPicker class enables users to select one or more contacts from any app that supports the Contact Picker contract. You can configure the ContactPicker class to accept only a single contact, or multiple contacts. In addition, you can request that the app providing the contact information return the entire set of data for each contact, or just specific fields.
 * 
 * For more info about how to select contacts, see [Select contacts](/windows/uwp/contacts-and-calendar/selecting-contacts).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpicker
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactPicker extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactPicker

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactPicker.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [ContactPicker](contactpicker.md) for a specific [User](./windows.system/user.md).
     * @param {User} user_ The [User](./windows.system/user.md) for which you want to create the [ContactPicker](contactpicker.md).
     * @returns {ContactPicker} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpicker.createforuser
     */
    static CreateForUser(user_) {
        if (!ContactPicker.HasProp("__IContactPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactPickerStatics.IID)
            ContactPicker.__IContactPickerStatics := IContactPickerStatics(factoryPtr)
        }

        return ContactPicker.__IContactPickerStatics.CreateForUser(user_)
    }

    /**
     * Gets a Boolean value that indicates whether the contact picker is supported on the current platform.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpicker.issupportedasync
     */
    static IsSupportedAsync() {
        if (!ContactPicker.HasProp("__IContactPickerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactPicker")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactPickerStatics.IID)
            ContactPicker.__IContactPickerStatics := IContactPickerStatics(factoryPtr)
        }

        return ContactPicker.__IContactPickerStatics.IsSupportedAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Sets the text for the confirmation button in the Contact Picker user interface.
     * 
     * > [!NOTE]
     * > This property is no longer available starting with Windows 10.
     * @remarks
     * We recommend you set CommitButtonText to provide an indication to the user that they have selected a contact or set of contacts.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpicker.commitbuttontext
     * @type {HSTRING} 
     */
    CommitButtonText {
        get => this.get_CommitButtonText()
        set => this.put_CommitButtonText(value)
    }

    /**
     * Controls whether the Contact Picker shows contacts as a complete entity or as a collection of fields.
     * 
     * > [!NOTE]
     * > This property is no longer available starting with Windows 10.
     * @remarks
     * A contact can contain a lot of information. If you want all of this information, set the SelectionMode property to return the entire contact. If you are only interested in specific fields, set this property to return only a selection of fields, then use the [DesiredFields](contactpicker_desiredfields.md) property to specify which fields you want.
     * 
     * Use the [ContactSelectionMode](contactselectionmode.md) enumeration to set the value of this property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpicker.selectionmode
     * @type {Integer} 
     */
    SelectionMode {
        get => this.get_SelectionMode()
        set => this.put_SelectionMode(value)
    }

    /**
     * Sets the contact fields your app is interested in.
     * 
     * > [!NOTE]
     * > This property is no longer available starting with Windows 10.
     * @remarks
     * If you choose only one field with this method, a contact is considered a match if it has that field. If you choose multiple fields, a contact is considered a match if it has any of the fields.
     * 
     * When selecting fields, list them in order of preference. For example, if you want both phone numbers and email addresses, but prefer phone numbers, put the PhoneNumber field before the Email field.
     * 
     * To specify a specific field, use the [KnownContactField](knowncontactfield.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpicker.desiredfields
     * @type {IVector<HSTRING>} 
     */
    DesiredFields {
        get => this.get_DesiredFields()
    }

    /**
     * Gets the ways to connect with a contact.
     * @remarks
     * For more info about how to select contacts, see [Select contacts](/windows/uwp/contacts-and-calendar/selecting-contacts).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpicker.desiredfieldswithcontactfieldtype
     * @type {IVector<Integer>} 
     */
    DesiredFieldsWithContactFieldType {
        get => this.get_DesiredFieldsWithContactFieldType()
    }

    /**
     * Gets the [User](./windows.system/user.md) associated with the [ContactPicker](contactpicker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpicker.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ContactPicker](contactpicker.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactPicker")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CommitButtonText() {
        if (!this.HasProp("__IContactPicker")) {
            if ((queryResult := this.QueryInterface(IContactPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPicker := IContactPicker(outPtr)
        }

        return this.__IContactPicker.get_CommitButtonText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CommitButtonText(value) {
        if (!this.HasProp("__IContactPicker")) {
            if ((queryResult := this.QueryInterface(IContactPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPicker := IContactPicker(outPtr)
        }

        return this.__IContactPicker.put_CommitButtonText(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectionMode() {
        if (!this.HasProp("__IContactPicker")) {
            if ((queryResult := this.QueryInterface(IContactPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPicker := IContactPicker(outPtr)
        }

        return this.__IContactPicker.get_SelectionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectionMode(value) {
        if (!this.HasProp("__IContactPicker")) {
            if ((queryResult := this.QueryInterface(IContactPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPicker := IContactPicker(outPtr)
        }

        return this.__IContactPicker.put_SelectionMode(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_DesiredFields() {
        if (!this.HasProp("__IContactPicker")) {
            if ((queryResult := this.QueryInterface(IContactPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPicker := IContactPicker(outPtr)
        }

        return this.__IContactPicker.get_DesiredFields()
    }

    /**
     * Launches the Contact Picker for selecting a single contact.
     * 
     * > [!NOTE]
     * > This method is no longer available starting with Windows 10.
     * @remarks
     * To pick multiple contacts at once, use [PickMultipleContactsAsync](contactpicker_pickmultiplecontactsasync_1630502573.md).
     * 
     * Use the [SelectionMode](contactpicker_selectionmode.md) property to control whether your app receives all of a contact's information, or just specific fields.
     * @returns {IAsyncOperation<ContactInformation>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpicker.picksinglecontactasync
     */
    PickSingleContactAsync() {
        if (!this.HasProp("__IContactPicker")) {
            if ((queryResult := this.QueryInterface(IContactPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPicker := IContactPicker(outPtr)
        }

        return this.__IContactPicker.PickSingleContactAsync()
    }

    /**
     * Launches the Contact Picker for selecting multiple contacts.
     * 
     * > [!NOTE]
     * > This method is no longer available starting with Windows 10.
     * @remarks
     * To pick only a single contact, use [PickSingleContactAsync](contactpicker_picksinglecontactasync_2033050338.md).
     * 
     * Use the [SelectionMode](contactpicker_selectionmode.md) property to control whether your app receives all of a contact's information, or just specific fields.
     * @returns {IAsyncOperation<IVectorView<ContactInformation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpicker.pickmultiplecontactsasync
     */
    PickMultipleContactsAsync() {
        if (!this.HasProp("__IContactPicker")) {
            if ((queryResult := this.QueryInterface(IContactPicker.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPicker := IContactPicker(outPtr)
        }

        return this.__IContactPicker.PickMultipleContactsAsync()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_DesiredFieldsWithContactFieldType() {
        if (!this.HasProp("__IContactPicker2")) {
            if ((queryResult := this.QueryInterface(IContactPicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPicker2 := IContactPicker2(outPtr)
        }

        return this.__IContactPicker2.get_DesiredFieldsWithContactFieldType()
    }

    /**
     * Launches the Contact Picker to select a single contact.
     * @remarks
     * To pick multiple contacts at once, use [PickContactsAsync](contactpicker_pickcontactsasync_540067144.md).
     * 
     * For more info about how to select contacts, see [Select contacts](/windows/uwp/contacts-and-calendar/selecting-contacts).
     * @returns {IAsyncOperation<Contact>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpicker.pickcontactasync
     */
    PickContactAsync() {
        if (!this.HasProp("__IContactPicker2")) {
            if ((queryResult := this.QueryInterface(IContactPicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPicker2 := IContactPicker2(outPtr)
        }

        return this.__IContactPicker2.PickContactAsync()
    }

    /**
     * Launches the Contact Picker for selecting multiple contacts.
     * @remarks
     * To pick only a single contact, use [PickContactAsync](contactpicker_pickcontactasync_1323728873.md).
     * 
     * For more info about how to select contacts, see [Select contacts](/windows/uwp/contacts-and-calendar/selecting-contacts).
     * @returns {IAsyncOperation<IVector<Contact>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactpicker.pickcontactsasync
     */
    PickContactsAsync() {
        if (!this.HasProp("__IContactPicker2")) {
            if ((queryResult := this.QueryInterface(IContactPicker2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPicker2 := IContactPicker2(outPtr)
        }

        return this.__IContactPicker2.PickContactsAsync()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IContactPicker3")) {
            if ((queryResult := this.QueryInterface(IContactPicker3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPicker3 := IContactPicker3(outPtr)
        }

        return this.__IContactPicker3.get_User()
    }

;@endregion Instance Methods
}
