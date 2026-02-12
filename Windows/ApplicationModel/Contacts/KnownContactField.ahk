#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IKnownContactFieldStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * A static class that contains the names of contact fields for storing commonly requested information like email address and phone numbers.
  * 
  * > [!NOTE]
  * > KnownContactField may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), or [ContactEmail](contactemail.md).
 * @remarks
 * The KnownContactField class is designed for use as a parameter with the [DesiredFields](contactpicker_desiredfields.md) property of the [ContactPicker](contactpicker.md). It allows apps to clearly specify what fields to retrieve from contact providers.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.knowncontactfield
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class KnownContactField extends IInspectable {
;@region Static Properties
    /**
     * Contains the name of the field used for email addresses.
     * 
     * > [!NOTE]
     * > [KnownContactField](knowncontactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), or [ContactEmail](contactemail.md).
     * @remarks
     * Use this property with the [ContactPicker.DesiredFields](contactpicker_desiredfields.md) property to specify that you want to get the email addresses of a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.knowncontactfield.email
     * @type {HSTRING} 
     */
    static Email {
        get => KnownContactField.get_Email()
    }

    /**
     * Contains the name of the field used for phone numbers.
     * 
     * > [!NOTE]
     * > [KnownContactField](knowncontactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), or [ContactEmail](contactemail.md).
     * @remarks
     * Use this property with the [ContactPicker.DesiredFields](contactpicker_desiredfields.md) property to specify that you want to get the phone numbers of a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.knowncontactfield.phonenumber
     * @type {HSTRING} 
     */
    static PhoneNumber {
        get => KnownContactField.get_PhoneNumber()
    }

    /**
     * Contains the name of the field used for the contact's location.
     * 
     * > [!NOTE]
     * > [KnownContactField](knowncontactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), or [ContactEmail](contactemail.md).
     * @remarks
     * Use this property with the [ContactPicker.DesiredFields](contactpicker_desiredfields.md) property to specify that you want to get the location of a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.knowncontactfield.location
     * @type {HSTRING} 
     */
    static Location {
        get => KnownContactField.get_Location()
    }

    /**
     * Contains the name of the field used for instant messaging accounts.
     * 
     * > [!NOTE]
     * > [KnownContactField](knowncontactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), or [ContactEmail](contactemail.md).
     * @remarks
     * Use this property with the [ContactPicker.DesiredFields](contactpicker_desiredfields.md) property to specify that you want to get the instant messaging names that a contact uses.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.knowncontactfield.instantmessage
     * @type {HSTRING} 
     */
    static InstantMessage {
        get => KnownContactField.get_InstantMessage()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Email() {
        if (!KnownContactField.HasProp("__IKnownContactFieldStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.KnownContactField")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownContactFieldStatics.IID)
            KnownContactField.__IKnownContactFieldStatics := IKnownContactFieldStatics(factoryPtr)
        }

        return KnownContactField.__IKnownContactFieldStatics.get_Email()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_PhoneNumber() {
        if (!KnownContactField.HasProp("__IKnownContactFieldStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.KnownContactField")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownContactFieldStatics.IID)
            KnownContactField.__IKnownContactFieldStatics := IKnownContactFieldStatics(factoryPtr)
        }

        return KnownContactField.__IKnownContactFieldStatics.get_PhoneNumber()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Location() {
        if (!KnownContactField.HasProp("__IKnownContactFieldStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.KnownContactField")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownContactFieldStatics.IID)
            KnownContactField.__IKnownContactFieldStatics := IKnownContactFieldStatics(factoryPtr)
        }

        return KnownContactField.__IKnownContactFieldStatics.get_Location()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_InstantMessage() {
        if (!KnownContactField.HasProp("__IKnownContactFieldStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.KnownContactField")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownContactFieldStatics.IID)
            KnownContactField.__IKnownContactFieldStatics := IKnownContactFieldStatics(factoryPtr)
        }

        return KnownContactField.__IKnownContactFieldStatics.get_InstantMessage()
    }

    /**
     * Converts a string representing the name of a field to its corresponding type.
     * 
     * > [!NOTE]
     * > [KnownContactField](knowncontactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), or [ContactEmail](contactemail.md).
     * @param {HSTRING} name The name of the field.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.knowncontactfield.convertnametotype
     */
    static ConvertNameToType(name) {
        if (!KnownContactField.HasProp("__IKnownContactFieldStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.KnownContactField")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownContactFieldStatics.IID)
            KnownContactField.__IKnownContactFieldStatics := IKnownContactFieldStatics(factoryPtr)
        }

        return KnownContactField.__IKnownContactFieldStatics.ConvertNameToType(name)
    }

    /**
     * Converts the type of a field to its corresponding string name.
     * 
     * > [!NOTE]
     * > [KnownContactField](knowncontactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), or [ContactEmail](contactemail.md).
     * @param {Integer} type The type of field.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.knowncontactfield.converttypetoname
     */
    static ConvertTypeToName(type) {
        if (!KnownContactField.HasProp("__IKnownContactFieldStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.KnownContactField")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IKnownContactFieldStatics.IID)
            KnownContactField.__IKnownContactFieldStatics := IKnownContactFieldStatics(factoryPtr)
        }

        return KnownContactField.__IKnownContactFieldStatics.ConvertTypeToName(type)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
