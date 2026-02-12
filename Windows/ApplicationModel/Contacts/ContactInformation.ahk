#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactInformation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the information about a contact.
  * 
  * > [!NOTE]
  * > ContactInformation may be altered or unavailable for releases after Windows 8.1. Instead, use [Contact](contact.md).
 * @remarks
 * > [!NOTE]
 * > Because you don't use [PickSingleContactAsync](contactpicker_picksinglecontactasync_2033050338.md) and [PickMultipleContactsAsync](contactpicker_pickmultiplecontactsasync_1630502573.md) in your Windows 8.1 and later apps, you don't instantiate ContactInformation objects in your Windows 8.1 and later apps.This table shows existing Windows 8 ContactInformation properties and their equivalent Windows 8.1 [Contact](contact.md) properties.
 * 
 * <table>
 *    <tr><th>Windows 8 ContactInformation property</th><th>Windows 8.1 Contact property</th></tr>
 *    <tr><td>Contact.Name</td><td>Contact.Name</td></tr>
 *    <tr><td>Contact.Thumbnail</td><td>Contact.Thumbnail</td></tr>
 *    <tr><td>Contact.Fields</td><td>Contact.Emails</td></tr>
 *    <tr><td>Contact.Fields where ContactField.Value = Address and ContactField.Category = ContactFieldCategory.Home or ContactFieldCategory.Other</td><td>Contact.Addresses</td></tr>
 *    <tr><td>Contact.Fields</td><td>Contact.Phones</td></tr>
 *    <tr><td>ContactField.Value</td><td>ContactEmail.Address</td></tr>
 *    <tr><td>ContactField.Category(Home,Work,Other)</td><td>ContactEmail.Kind(Personal,Work,Other)</td></tr>
 *    <tr><td>ContactField.Value</td><td>ContactPhone.Number</td></tr>
 *    <tr><td>ContactField.Category(Home, Work, Mobile, Other)</td><td>ContactPhone.Kind(Home,Work,Mobile,Other)</td></tr>
 *    <tr><td>Contact.Fields where ContactField.Value = CompanyAddress and ContactField.Category = ContactFieldCategory.Work</td><td>ContactJobInfo.CompanyAddress</td></tr>
 * </table>
 * 
 * Typically, you access ContactInformation objects as the result of asynchronous method and/or function calls. For example, both of the static methods [PickSingleContactAsync](contactpicker_picksinglecontactasync_2033050338.md) and [PickMultipleContactsAsync](contactpicker_pickmultiplecontactsasync_1630502573.md) return ContactInformation objects that represent the selected contact.
 * 
 * When your app receives contact information from a contact provider, the data for each contact is returned in a ContactInformation object.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinformation
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The name of the contact.
     * 
     * > [!NOTE]
     * > [ContactInformation](contactinformation.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [Contact](contact.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinformation.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * A read-only list of email addresses stored with the contact.
     * 
     * > [!NOTE]
     * > [ContactInformation](contactinformation.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [Contact](contact.md).
     * @remarks
     * Use the Emails property to access a contact's email addresses from a [ContactInformation](contactinformation.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinformation.emails
     * @type {IVectorView<ContactField>} 
     */
    Emails {
        get => this.get_Emails()
    }

    /**
     * A read-only list of phone numbers stored with the contact.
     * 
     * > [!NOTE]
     * > [ContactInformation](contactinformation.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [Contact](contact.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinformation.phonenumbers
     * @type {IVectorView<ContactField>} 
     */
    PhoneNumbers {
        get => this.get_PhoneNumbers()
    }

    /**
     * A read-only list of locations stored with the contact.
     * 
     * > [!NOTE]
     * > [ContactInformation](contactinformation.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [Contact](contact.md).
     * @remarks
     * Use the Locations property to access a contact's address and other information from a [ContactInformation](contactinformation.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinformation.locations
     * @type {IVectorView<ContactLocationField>} 
     */
    Locations {
        get => this.get_Locations()
    }

    /**
     * A read-only list of instant messaging accounts stored with the contact.
     * 
     * > [!NOTE]
     * > [ContactInformation](contactinformation.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [Contact](contact.md).
     * @remarks
     * Use the InstantMessages property to access a contact's instant messaging user names from a [ContactInformation](contactinformation.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinformation.instantmessages
     * @type {IVectorView<ContactInstantMessageField>} 
     */
    InstantMessages {
        get => this.get_InstantMessages()
    }

    /**
     * A read-only list of the custom fields stored with the contact.
     * 
     * > [!NOTE]
     * > [ContactInformation](contactinformation.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [Contact](contact.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinformation.customfields
     * @type {IVectorView<ContactField>} 
     */
    CustomFields {
        get => this.get_CustomFields()
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
    get_Name() {
        if (!this.HasProp("__IContactInformation")) {
            if ((queryResult := this.QueryInterface(IContactInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactInformation := IContactInformation(outPtr)
        }

        return this.__IContactInformation.get_Name()
    }

    /**
     * Gets the thumbnail image for the contact.
     * 
     * > [!NOTE]
     * > [ContactInformation](contactinformation.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [Contact](contact.md).
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinformation.getthumbnailasync
     */
    GetThumbnailAsync() {
        if (!this.HasProp("__IContactInformation")) {
            if ((queryResult := this.QueryInterface(IContactInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactInformation := IContactInformation(outPtr)
        }

        return this.__IContactInformation.GetThumbnailAsync()
    }

    /**
     * 
     * @returns {IVectorView<ContactField>} 
     */
    get_Emails() {
        if (!this.HasProp("__IContactInformation")) {
            if ((queryResult := this.QueryInterface(IContactInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactInformation := IContactInformation(outPtr)
        }

        return this.__IContactInformation.get_Emails()
    }

    /**
     * 
     * @returns {IVectorView<ContactField>} 
     */
    get_PhoneNumbers() {
        if (!this.HasProp("__IContactInformation")) {
            if ((queryResult := this.QueryInterface(IContactInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactInformation := IContactInformation(outPtr)
        }

        return this.__IContactInformation.get_PhoneNumbers()
    }

    /**
     * 
     * @returns {IVectorView<ContactLocationField>} 
     */
    get_Locations() {
        if (!this.HasProp("__IContactInformation")) {
            if ((queryResult := this.QueryInterface(IContactInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactInformation := IContactInformation(outPtr)
        }

        return this.__IContactInformation.get_Locations()
    }

    /**
     * 
     * @returns {IVectorView<ContactInstantMessageField>} 
     */
    get_InstantMessages() {
        if (!this.HasProp("__IContactInformation")) {
            if ((queryResult := this.QueryInterface(IContactInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactInformation := IContactInformation(outPtr)
        }

        return this.__IContactInformation.get_InstantMessages()
    }

    /**
     * 
     * @returns {IVectorView<ContactField>} 
     */
    get_CustomFields() {
        if (!this.HasProp("__IContactInformation")) {
            if ((queryResult := this.QueryInterface(IContactInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactInformation := IContactInformation(outPtr)
        }

        return this.__IContactInformation.get_CustomFields()
    }

    /**
     * Enables you to get the value for a custom field that is stored with a contact.
     * 
     * > [!NOTE]
     * > [ContactInformation](contactinformation.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [Contact](contact.md).
     * @param {HSTRING} customName The name of the field.
     * @returns {IVectorView<ContactField>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinformation.querycustomfields
     */
    QueryCustomFields(customName) {
        if (!this.HasProp("__IContactInformation")) {
            if ((queryResult := this.QueryInterface(IContactInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactInformation := IContactInformation(outPtr)
        }

        return this.__IContactInformation.QueryCustomFields(customName)
    }

;@endregion Instance Methods
}
