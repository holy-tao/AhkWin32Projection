#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactFieldFactory.ahk
#Include .\IContactLocationFieldFactory.ahk
#Include .\IContactInstantMessageFieldFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Creates fields that contain information about a contact. You can then add these fields to a [Contact](contact.md) object to create the contact. This class is available only to apps that support the Contact contract.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfieldfactory
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactFieldFactory extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactFieldFactory

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactFieldFactory.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates an instance of the [ContactFieldFactory](contactfieldfactory.md)class.
     * 
     * > [!NOTE]
     * > [ContactFieldFactory](contactfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactSignificantOther](contactsignificantother.md), [Contact](contact.md), [ContactEmail](contactemail.md), [ContactWebsite](contactwebsite.md), [ContactJobInfo](contactjobinfo.md), or [ContactDate](contactdate.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactFieldFactory")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Creates a field to contain information about a contact.
     * 
     * > [!NOTE]
     * > [IContactFieldFactory](icontactfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactPhone](contactphone.md) or [ContactEmail](contactemail.md).
     * @param {HSTRING} value The value for the field.
     * @param {Integer} type The type of field.
     * @returns {ContactField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfieldfactory.createfield
     */
    CreateField_Default(value, type) {
        if (!this.HasProp("__IContactFieldFactory")) {
            if ((queryResult := this.QueryInterface(IContactFieldFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactFieldFactory := IContactFieldFactory(outPtr)
        }

        return this.__IContactFieldFactory.CreateField_Default(value, type)
    }

    /**
     * Creates a field to contain information about a contact.
     * 
     * > [!NOTE]
     * > [IContactFieldFactory](icontactfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactPhone](contactphone.md) or [ContactEmail](contactemail.md).
     * @param {HSTRING} value The value of the field.
     * @param {Integer} type The type of field.
     * @param {Integer} category The category the field belongs to.
     * @returns {ContactField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfieldfactory.createfield
     */
    CreateField_Category(value, type, category) {
        if (!this.HasProp("__IContactFieldFactory")) {
            if ((queryResult := this.QueryInterface(IContactFieldFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactFieldFactory := IContactFieldFactory(outPtr)
        }

        return this.__IContactFieldFactory.CreateField_Category(value, type, category)
    }

    /**
     * Creates a field to contain information about a contact.
     * 
     * > [!NOTE]
     * > [IContactFieldFactory](icontactfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactPhone](contactphone.md) or [ContactEmail](contactemail.md).
     * @param {HSTRING} name 
     * @param {HSTRING} value The value for the field.
     * @param {Integer} type The type of field.
     * @param {Integer} category 
     * @returns {ContactField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfieldfactory.createfield
     */
    CreateField_Custom(name, value, type, category) {
        if (!this.HasProp("__IContactFieldFactory")) {
            if ((queryResult := this.QueryInterface(IContactFieldFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactFieldFactory := IContactFieldFactory(outPtr)
        }

        return this.__IContactFieldFactory.CreateField_Custom(name, value, type, category)
    }

    /**
     * Creates a field to contain information about a contact's location.
     * 
     * > [!NOTE]
     * > [IContactLocationFieldFactory](icontactlocationfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
     * @param {HSTRING} unstructuredAddress The address of the contact in an unstructured format.
     * @returns {ContactLocationField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfieldfactory.createlocation
     */
    CreateLocation_Default(unstructuredAddress) {
        if (!this.HasProp("__IContactLocationFieldFactory")) {
            if ((queryResult := this.QueryInterface(IContactLocationFieldFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactLocationFieldFactory := IContactLocationFieldFactory(outPtr)
        }

        return this.__IContactLocationFieldFactory.CreateLocation_Default(unstructuredAddress)
    }

    /**
     * Creates a field to contain information about a contact's location.
     * 
     * > [!NOTE]
     * > [IContactLocationFieldFactory](icontactlocationfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
     * @param {HSTRING} unstructuredAddress The address of the contact in an unstructured format.
     * @param {Integer} category 
     * @returns {ContactLocationField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfieldfactory.createlocation
     */
    CreateLocation_Category(unstructuredAddress, category) {
        if (!this.HasProp("__IContactLocationFieldFactory")) {
            if ((queryResult := this.QueryInterface(IContactLocationFieldFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactLocationFieldFactory := IContactLocationFieldFactory(outPtr)
        }

        return this.__IContactLocationFieldFactory.CreateLocation_Category(unstructuredAddress, category)
    }

    /**
     * Creates a field to contain information about a contact's location.
     * 
     * > [!NOTE]
     * > [IContactLocationFieldFactory](icontactlocationfieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md).
     * @param {HSTRING} unstructuredAddress The address of the contact in an unstructured format.
     * @param {Integer} category 
     * @param {HSTRING} street 
     * @param {HSTRING} city 
     * @param {HSTRING} region_ 
     * @param {HSTRING} country 
     * @param {HSTRING} postalCode 
     * @returns {ContactLocationField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfieldfactory.createlocation
     */
    CreateLocation_All(unstructuredAddress, category, street, city, region_, country, postalCode) {
        if (!this.HasProp("__IContactLocationFieldFactory")) {
            if ((queryResult := this.QueryInterface(IContactLocationFieldFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactLocationFieldFactory := IContactLocationFieldFactory(outPtr)
        }

        return this.__IContactLocationFieldFactory.CreateLocation_All(unstructuredAddress, category, street, city, region_, country, postalCode)
    }

    /**
     * Creates a field to contain information about a contact's instant messaging account.
     * 
     * > [!NOTE]
     * > [IContactInstantMessageFieldFactory](icontactinstantmessagefieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactConnectedServiceAccount](contactconnectedserviceaccount.md).
     * @param {HSTRING} userName The user name for the instant messaging account.
     * @returns {ContactInstantMessageField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfieldfactory.createinstantmessage
     */
    CreateInstantMessage_Default(userName) {
        if (!this.HasProp("__IContactInstantMessageFieldFactory")) {
            if ((queryResult := this.QueryInterface(IContactInstantMessageFieldFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactInstantMessageFieldFactory := IContactInstantMessageFieldFactory(outPtr)
        }

        return this.__IContactInstantMessageFieldFactory.CreateInstantMessage_Default(userName)
    }

    /**
     * Creates a field to contain information about a contact's instant messaging account.
     * 
     * > [!NOTE]
     * > [IContactInstantMessageFieldFactory](icontactinstantmessagefieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactConnectedServiceAccount](contactconnectedserviceaccount.md).
     * @param {HSTRING} userName The user name for the instant messaging account.
     * @param {Integer} category 
     * @returns {ContactInstantMessageField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfieldfactory.createinstantmessage
     */
    CreateInstantMessage_Category(userName, category) {
        if (!this.HasProp("__IContactInstantMessageFieldFactory")) {
            if ((queryResult := this.QueryInterface(IContactInstantMessageFieldFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactInstantMessageFieldFactory := IContactInstantMessageFieldFactory(outPtr)
        }

        return this.__IContactInstantMessageFieldFactory.CreateInstantMessage_Category(userName, category)
    }

    /**
     * Creates a field to contain information about a contact's instant messaging account.
     * 
     * > [!NOTE]
     * > [IContactInstantMessageFieldFactory](icontactinstantmessagefieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactConnectedServiceAccount](contactconnectedserviceaccount.md).
     * @param {HSTRING} userName The user name for the instant messaging account.
     * @param {Integer} category 
     * @param {HSTRING} service 
     * @param {HSTRING} displayText 
     * @param {Uri} verb 
     * @returns {ContactInstantMessageField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactfieldfactory.createinstantmessage
     */
    CreateInstantMessage_All(userName, category, service, displayText, verb) {
        if (!this.HasProp("__IContactInstantMessageFieldFactory")) {
            if ((queryResult := this.QueryInterface(IContactInstantMessageFieldFactory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactInstantMessageFieldFactory := IContactInstantMessageFieldFactory(outPtr)
        }

        return this.__IContactInstantMessageFieldFactory.CreateInstantMessage_All(userName, category, service, displayText, verb)
    }

;@endregion Instance Methods
}
