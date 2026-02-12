#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactLocationField.ahk
#Include .\IContactField.ahk
#Include .\IContactLocationFieldFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a user's location and address.
  * 
  * > [!NOTE]
  * > [ContactLocationField](contactlocationfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
 * @remarks
 * Your app receives a collection of ContactLocationField objects when a contact provider returns the requested contact information. You can access these objects through the ContactInformation.Location property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlocationfield
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactLocationField extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactLocationField

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactLocationField.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [ContactLocationField](contactlocationfield.md)object.
     * 
     * > [!NOTE]
     * > [IContactLocationFieldFactory](icontactlocationfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
     * @param {HSTRING} unstructuredAddress The address of the contact in an unstructured format.
     * @returns {ContactLocationField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlocationfield.#ctor
     */
    static CreateLocation_Default(unstructuredAddress) {
        if (!ContactLocationField.HasProp("__IContactLocationFieldFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactLocationField")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactLocationFieldFactory.IID)
            ContactLocationField.__IContactLocationFieldFactory := IContactLocationFieldFactory(factoryPtr)
        }

        return ContactLocationField.__IContactLocationFieldFactory.CreateLocation_Default(unstructuredAddress)
    }

    /**
     * Creates a new [ContactLocationField](contactlocationfield.md)object.
     * 
     * > [!NOTE]
     * > [IContactLocationFieldFactory](icontactlocationfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
     * @param {HSTRING} unstructuredAddress The address of the contact in an unstructured format.
     * @param {Integer} category The category the field belongs to.
     * @returns {ContactLocationField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlocationfield.#ctor
     */
    static CreateLocation_Category(unstructuredAddress, category) {
        if (!ContactLocationField.HasProp("__IContactLocationFieldFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactLocationField")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactLocationFieldFactory.IID)
            ContactLocationField.__IContactLocationFieldFactory := IContactLocationFieldFactory(factoryPtr)
        }

        return ContactLocationField.__IContactLocationFieldFactory.CreateLocation_Category(unstructuredAddress, category)
    }

    /**
     * Creates a new [ContactLocationField](contactlocationfield.md)object.
     * 
     * > [!NOTE]
     * > [IContactLocationFieldFactory](icontactlocationfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
     * @param {HSTRING} unstructuredAddress The address of the contact in an unstructured format.
     * @param {Integer} category The category for the contact data.
     * @param {HSTRING} street The street address of the contact.
     * @param {HSTRING} city The name of the city for this contact's address.
     * @param {HSTRING} region_ The name of the region for this contact's address.
     * @param {HSTRING} country The name of the country for this contact's address.
     * @param {HSTRING} postalCode The postal code for this contact's address.
     * @returns {ContactLocationField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlocationfield.#ctor
     */
    static CreateLocation_All(unstructuredAddress, category, street, city, region_, country, postalCode) {
        if (!ContactLocationField.HasProp("__IContactLocationFieldFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactLocationField")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactLocationFieldFactory.IID)
            ContactLocationField.__IContactLocationFieldFactory := IContactLocationFieldFactory(factoryPtr)
        }

        return ContactLocationField.__IContactLocationFieldFactory.CreateLocation_All(unstructuredAddress, category, street, city, region_, country, postalCode)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a string that represents an unstructured address.
     * 
     * > [!NOTE]
     * > [ContactLocationField](contactlocationfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
     * @remarks
     * If the contact-providing application includes an address, but doesn't specify elements such as [PostalCode](contactlocationfield_postalcode.md) or [City](contactlocationfield_city.md), the data is put in the UnstructuredAddress property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlocationfield.unstructuredaddress
     * @type {HSTRING} 
     */
    UnstructuredAddress {
        get => this.get_UnstructuredAddress()
    }

    /**
     * Gets the contact's street.
     * 
     * > [!NOTE]
     * > [ContactLocationField](contactlocationfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlocationfield.street
     * @type {HSTRING} 
     */
    Street {
        get => this.get_Street()
    }

    /**
     * Gets the contact's city.
     * 
     * > [!NOTE]
     * > [ContactLocationField](contactlocationfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlocationfield.city
     * @type {HSTRING} 
     */
    City {
        get => this.get_City()
    }

    /**
     * Gets the contact's region.
     * 
     * > [!NOTE]
     * > [ContactLocationField](contactlocationfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlocationfield.region
     * @type {HSTRING} 
     */
    Region {
        get => this.get_Region()
    }

    /**
     * Gets the contact's country.
     * 
     * > [!NOTE]
     * > [ContactLocationField](contactlocationfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlocationfield.country
     * @type {HSTRING} 
     */
    Country {
        get => this.get_Country()
    }

    /**
     * Gets the contact's postal code.
     * 
     * > [!NOTE]
     * > [ContactLocationField](contactlocationfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlocationfield.postalcode
     * @type {HSTRING} 
     */
    PostalCode {
        get => this.get_PostalCode()
    }

    /**
     * Gets the contact field type for the data.
     * 
     * > [!NOTE]
     * > [IContactField](icontactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactSignificantOther](contactsignificantother.md), [Contact](contact.md), [ContactEmail](contactemail.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), [ContactWebsite](contactwebsite.md), [ContactJobInfo](contactjobinfo.md), or [ContactDate](contactdate.md).
     * @remarks
     * See the [ContactFieldType](contactfieldtype.md) class for more info on the available values for this property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlocationfield.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets the category for the contact data.
     * 
     * > [!NOTE]
     * > [IContactField](icontactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactSignificantOther](contactsignificantother.md), [Contact](contact.md), [ContactEmail](contactemail.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), [ContactWebsite](contactwebsite.md), [ContactJobInfo](contactjobinfo.md), or [ContactDate](contactdate.md).
     * @remarks
     * See the [ContactFieldCategory](contactfieldcategory.md) class for more info on the available values for this property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlocationfield.category
     * @type {Integer} 
     */
    Category {
        get => this.get_Category()
    }

    /**
     * Gets the name of the field.
     * 
     * > [!NOTE]
     * > [IContactField](icontactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactSignificantOther](contactsignificantother.md), [Contact](contact.md), [ContactEmail](contactemail.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), [ContactWebsite](contactwebsite.md), [ContactJobInfo](contactjobinfo.md), or [ContactDate](contactdate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlocationfield.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the value of the contact data.
     * 
     * > [!NOTE]
     * > [IContactField](icontactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactSignificantOther](contactsignificantother.md), [Contact](contact.md), [ContactEmail](contactemail.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), [ContactWebsite](contactwebsite.md), [ContactJobInfo](contactjobinfo.md), or [ContactDate](contactdate.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactlocationfield.value
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
     * @returns {HSTRING} 
     */
    get_UnstructuredAddress() {
        if (!this.HasProp("__IContactLocationField")) {
            if ((queryResult := this.QueryInterface(IContactLocationField.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactLocationField := IContactLocationField(outPtr)
        }

        return this.__IContactLocationField.get_UnstructuredAddress()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Street() {
        if (!this.HasProp("__IContactLocationField")) {
            if ((queryResult := this.QueryInterface(IContactLocationField.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactLocationField := IContactLocationField(outPtr)
        }

        return this.__IContactLocationField.get_Street()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_City() {
        if (!this.HasProp("__IContactLocationField")) {
            if ((queryResult := this.QueryInterface(IContactLocationField.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactLocationField := IContactLocationField(outPtr)
        }

        return this.__IContactLocationField.get_City()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Region() {
        if (!this.HasProp("__IContactLocationField")) {
            if ((queryResult := this.QueryInterface(IContactLocationField.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactLocationField := IContactLocationField(outPtr)
        }

        return this.__IContactLocationField.get_Region()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Country() {
        if (!this.HasProp("__IContactLocationField")) {
            if ((queryResult := this.QueryInterface(IContactLocationField.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactLocationField := IContactLocationField(outPtr)
        }

        return this.__IContactLocationField.get_Country()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PostalCode() {
        if (!this.HasProp("__IContactLocationField")) {
            if ((queryResult := this.QueryInterface(IContactLocationField.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactLocationField := IContactLocationField(outPtr)
        }

        return this.__IContactLocationField.get_PostalCode()
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
