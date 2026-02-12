#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactInstantMessageField.ahk
#Include .\IContactField.ahk
#Include .\IContactInstantMessageFieldFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines a field that is an instant messaging (IM) address.
 * @remarks
 * Your app receives a collection of ContactInstantMessageField objects when a contact provider returns the requested contact information. You can access these objects through the [ContactInformation.InstantMessages](contactinformation_instantmessages.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinstantmessagefield
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactInstantMessageField extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactInstantMessageField

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactInstantMessageField.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [ContactInstantMessageField](contactinstantmessagefield.md)object.
     * 
     * > [!NOTE]
     * > [IContactInstantMessageFieldFactory](icontactinstantmessagefieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactConnectedServiceAccount](contactconnectedserviceaccount.md).
     * @param {HSTRING} userName The user's name.
     * @returns {ContactInstantMessageField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinstantmessagefield.#ctor
     */
    static CreateInstantMessage_Default(userName) {
        if (!ContactInstantMessageField.HasProp("__IContactInstantMessageFieldFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactInstantMessageField")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactInstantMessageFieldFactory.IID)
            ContactInstantMessageField.__IContactInstantMessageFieldFactory := IContactInstantMessageFieldFactory(factoryPtr)
        }

        return ContactInstantMessageField.__IContactInstantMessageFieldFactory.CreateInstantMessage_Default(userName)
    }

    /**
     * Creates a new [ContactInstantMessageField](contactinstantmessagefield.md)object.
     * 
     * > [!NOTE]
     * > [IContactInstantMessageFieldFactory](icontactinstantmessagefieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactConnectedServiceAccount](contactconnectedserviceaccount.md).
     * @param {HSTRING} userName The user's name.
     * @param {Integer} category The category of contact data.
     * @returns {ContactInstantMessageField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinstantmessagefield.#ctor
     */
    static CreateInstantMessage_Category(userName, category) {
        if (!ContactInstantMessageField.HasProp("__IContactInstantMessageFieldFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactInstantMessageField")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactInstantMessageFieldFactory.IID)
            ContactInstantMessageField.__IContactInstantMessageFieldFactory := IContactInstantMessageFieldFactory(factoryPtr)
        }

        return ContactInstantMessageField.__IContactInstantMessageFieldFactory.CreateInstantMessage_Category(userName, category)
    }

    /**
     * Creates a new [ContactInstantMessageField](contactinstantmessagefield.md)object.
     * 
     * > [!NOTE]
     * > [IContactInstantMessageFieldFactory](icontactinstantmessagefieldfactory.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactConnectedServiceAccount](contactconnectedserviceaccount.md).
     * @param {HSTRING} userName The user's name.
     * @param {Integer} category The category of the contact data.
     * @param {HSTRING} service The name of the instant messaging service.
     * @param {HSTRING} displayText The display text used with the instant messaging Uniform Resource Identifier (URI).
     * @param {Uri} verb The Uniform Resource Identifier (URI) that starts an instant message.
     * @returns {ContactInstantMessageField} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinstantmessagefield.#ctor
     */
    static CreateInstantMessage_All(userName, category, service, displayText, verb) {
        if (!ContactInstantMessageField.HasProp("__IContactInstantMessageFieldFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactInstantMessageField")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContactInstantMessageFieldFactory.IID)
            ContactInstantMessageField.__IContactInstantMessageFieldFactory := IContactInstantMessageFieldFactory(factoryPtr)
        }

        return ContactInstantMessageField.__IContactInstantMessageFieldFactory.CreateInstantMessage_All(userName, category, service, displayText, verb)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the user's name.
     * 
     * > [!NOTE]
     * > [ContactInstantMessageField](contactinstantmessagefield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactConnectedServiceAccount](contactconnectedserviceaccount.md).
     * @remarks
     * Remember that the user's name for an instant message account is not always the same as his or her actual name. If you want a user's actual name, use the [ContactInformation.name](contactinformation_name.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinstantmessagefield.username
     * @type {HSTRING} 
     */
    UserName {
        get => this.get_UserName()
    }

    /**
     * Gets the name of the service used for sending instant messages.
     * 
     * > [!NOTE]
     * > [ContactInstantMessageField](contactinstantmessagefield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactConnectedServiceAccount](contactconnectedserviceaccount.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinstantmessagefield.service
     * @type {HSTRING} 
     */
    Service {
        get => this.get_Service()
    }

    /**
     * Gets the display text for the Uniform Resource Identifier (URI)that starts an instant message.
     * 
     * > [!NOTE]
     * > [ContactInstantMessageField](contactinstantmessagefield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactConnectedServiceAccount](contactconnectedserviceaccount.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinstantmessagefield.displaytext
     * @type {HSTRING} 
     */
    DisplayText {
        get => this.get_DisplayText()
    }

    /**
     * Gets the Uniform Resource Identifier (URI)that can start an instant message.
     * 
     * > [!NOTE]
     * > [ContactInstantMessageField](contactinstantmessagefield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactConnectedServiceAccount](contactconnectedserviceaccount.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinstantmessagefield.launchuri
     * @type {Uri} 
     */
    LaunchUri {
        get => this.get_LaunchUri()
    }

    /**
     * Gets the contact field type for the data.
     * 
     * > [!NOTE]
     * > [IContactField](icontactfield.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [ContactAddress](contactaddress.md), [ContactPhone](contactphone.md), [ContactSignificantOther](contactsignificantother.md), [Contact](contact.md), [ContactEmail](contactemail.md), [ContactConnectedServiceAccount](contactconnectedserviceaccount.md), [ContactWebsite](contactwebsite.md), [ContactJobInfo](contactjobinfo.md), or [ContactDate](contactdate.md).
     * @remarks
     * See the [ContactFieldType](contactfieldtype.md) class for more info on the available values for this property.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinstantmessagefield.type
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
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinstantmessagefield.category
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
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinstantmessagefield.name
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
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactinstantmessagefield.value
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
    get_UserName() {
        if (!this.HasProp("__IContactInstantMessageField")) {
            if ((queryResult := this.QueryInterface(IContactInstantMessageField.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactInstantMessageField := IContactInstantMessageField(outPtr)
        }

        return this.__IContactInstantMessageField.get_UserName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Service() {
        if (!this.HasProp("__IContactInstantMessageField")) {
            if ((queryResult := this.QueryInterface(IContactInstantMessageField.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactInstantMessageField := IContactInstantMessageField(outPtr)
        }

        return this.__IContactInstantMessageField.get_Service()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayText() {
        if (!this.HasProp("__IContactInstantMessageField")) {
            if ((queryResult := this.QueryInterface(IContactInstantMessageField.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactInstantMessageField := IContactInstantMessageField(outPtr)
        }

        return this.__IContactInstantMessageField.get_DisplayText()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_LaunchUri() {
        if (!this.HasProp("__IContactInstantMessageField")) {
            if ((queryResult := this.QueryInterface(IContactInstantMessageField.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactInstantMessageField := IContactInstantMessageField(outPtr)
        }

        return this.__IContactInstantMessageField.get_LaunchUri()
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
