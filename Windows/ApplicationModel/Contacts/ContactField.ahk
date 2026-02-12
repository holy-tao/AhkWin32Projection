#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactField.ahk
#Include .\IContactFieldFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Describes a piece of contact data.
 * @remarks
 * Each time you create a [Contact](contact.md) object, you get a [Fields](contact_fields.md) property. This property contains the data that relates to the contact. To populate a [Contact](contact.md) object with data, you append the [Fields](contact_fields.md) object with one or more instances of **ContactField**.
 * 
 * At a minimum, a **ContactField** object must contain a string value and a [ContactFieldType](contactfieldtype.md), which specifies whether the data is a phone number, email address, physical address, or something else. You can also add a [ContactFieldCategory](contactfieldcategory.md) to differentiate between home, work, personal, or other data. You can also use a **ContactField** object to add custom fields to a [Contact](contact.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfield
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactField extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactField

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactField.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!NOTE]
     * > [IContactFieldFactory](icontactfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactPhone](contactphone.md) or [ContactEmail](contactemail.md).
     * 
     * Creates a new [ContactField](contactfield.md)object.
     * @param {HSTRING} value The value that the field contains.
     * @param {Integer} type The type of contact data.
     * @returns {ContactField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfield.#ctor
     */
    static CreateField_Default(value, type) {
        if (!ContactField.HasProp("__IContactFieldFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactField")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactFieldFactory.IID)
            ContactField.__IContactFieldFactory := IContactFieldFactory(factoryPtr)
        }

        return ContactField.__IContactFieldFactory.CreateField_Default(value, type)
    }

    /**
     * > [!NOTE]
     * > [IContactFieldFactory](icontactfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactPhone](contactphone.md) or [ContactEmail](contactemail.md).
     * 
     * Creates a new [ContactField](contactfield.md)object.
     * @param {HSTRING} value The value for the contact field.
     * @param {Integer} type The type of contact data.
     * @param {Integer} category The category that the contact belongs to.
     * @returns {ContactField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfield.#ctor
     */
    static CreateField_Category(value, type, category) {
        if (!ContactField.HasProp("__IContactFieldFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactField")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactFieldFactory.IID)
            ContactField.__IContactFieldFactory := IContactFieldFactory(factoryPtr)
        }

        return ContactField.__IContactFieldFactory.CreateField_Category(value, type, category)
    }

    /**
     * > [!NOTE]
     * > [IContactFieldFactory](icontactfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactPhone](contactphone.md) or [ContactEmail](contactemail.md).
     * 
     * Creates a new [ContactField](contactfield.md)object.
     * @param {HSTRING} name The name of the field.
     * @param {HSTRING} value The value the field contains.
     * @param {Integer} type The type of field.
     * @param {Integer} category The category the field belongs to.
     * @returns {ContactField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfield.#ctor
     */
    static CreateField_Custom(name, value, type, category) {
        if (!ContactField.HasProp("__IContactFieldFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactField")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactFieldFactory.IID)
            ContactField.__IContactFieldFactory := IContactFieldFactory(factoryPtr)
        }

        return ContactField.__IContactFieldFactory.CreateField_Custom(name, value, type, category)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!NOTE]
     * > [ContactField](contactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactSignificantOther](contactsignificantother.md), [Contact](contact.md), [ContactEmail](contactemail.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), [ContactWebsite](contactwebsite.md), [ContactJobInfo](contactjobinfo.md), or [ContactDate](contactdate.md).
     * 
     * Gets the contact field type for the data.
     * <!--Changed for consistency with the other property pages in this class, which use common nouns after "Gets.."-->
     * @remarks
     * To see what types you can assign to a [ContactField](contactfield.md), see [ContactFieldType](contactfieldtype.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfield.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets the category for the contact data.
     * 
     * > [!NOTE]
     * > [ContactField](contactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactSignificantOther](contactsignificantother.md), [Contact](contact.md), [ContactEmail](contactemail.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), [ContactWebsite](contactwebsite.md), [ContactJobInfo](contactjobinfo.md), or [ContactDate](contactdate.md).
     * @remarks
     * To see what types of categories you can assign to a [ContactField](contactfield.md), see [ContactFieldCategory](contactfieldcategory.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfield.category
     * @type {Integer} 
     */
    Category {
        get => this.get_Category()
    }

    /**
     * > [!NOTE]
     * > [ContactField](contactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactSignificantOther](contactsignificantother.md), [Contact](contact.md), [ContactEmail](contactemail.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), [ContactWebsite](contactwebsite.md), [ContactJobInfo](contactjobinfo.md), or [ContactDate](contactdate.md).
     * 
     * Gets the name of the field.
     * @remarks
     * If the [ContactField](contactfield.md) was created using a [ContactFieldType](contactfieldtype.md) enumeration, then the Name property is the same as the [ContactFieldType](contactfieldtype.md) value (such as Email or PhoneNumber). If the [ContactField](contactfield.md) contains a custom field, the Name property is the name of the field.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfield.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * > [!NOTE]
     * > [ContactField](contactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactSignificantOther](contactsignificantother.md), [Contact](contact.md), [ContactEmail](contactemail.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), [ContactWebsite](contactwebsite.md), [ContactJobInfo](contactjobinfo.md), or [ContactDate](contactdate.md).
     * 
     * Gets the value of the contact data.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfield.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IContactField")) {
            if ((queryResult := this.QueryInterface(IContactField.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactField := IContactField(outPtr)
        }

        return this.__IContactField.get_Type()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Category() {
        if (!this.HasProp("__IContactField")) {
            if ((queryResult := this.QueryInterface(IContactField.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactField := IContactField(outPtr)
        }

        return this.__IContactField.get_Category()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IContactField")) {
            if ((queryResult := this.QueryInterface(IContactField.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactField := IContactField(outPtr)
        }

        return this.__IContactField.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IContactField")) {
            if ((queryResult := this.QueryInterface(IContactField.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactField := IContactField(outPtr)
        }

        return this.__IContactField.get_Value()
    }

;@endregion Instance Methods
}
