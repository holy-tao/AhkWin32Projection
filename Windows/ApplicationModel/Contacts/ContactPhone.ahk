#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactPhone.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents information about the phone for a contact.
 * @remarks
 * For information about how to manage contacts, see [Contacts and calendar](/windows/uwp/contacts-and-calendar/).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactphone
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactPhone extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactPhone

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactPhone.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or setsthe phone number of a phone for a contact. The maximum string length for the phone number is 50 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactphone.number
     * @type {HSTRING} 
     */
    Number {
        get => this.get_Number()
        set => this.put_Number(value)
    }

    /**
     * Gets or sets the kind of phone for a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactphone.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
        set => this.put_Kind(value)
    }

    /**
     * Gets or sets the description of the phone for a contact. The maximum string length for the description is 512 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactphone.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of a [ContactPhone](contactphone.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactPhone")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Number() {
        if (!this.HasProp("__IContactPhone")) {
            if ((queryResult := this.QueryInterface(IContactPhone.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPhone := IContactPhone(outPtr)
        }

        return this.__IContactPhone.get_Number()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Number(value) {
        if (!this.HasProp("__IContactPhone")) {
            if ((queryResult := this.QueryInterface(IContactPhone.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPhone := IContactPhone(outPtr)
        }

        return this.__IContactPhone.put_Number(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IContactPhone")) {
            if ((queryResult := this.QueryInterface(IContactPhone.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPhone := IContactPhone(outPtr)
        }

        return this.__IContactPhone.get_Kind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Kind(value) {
        if (!this.HasProp("__IContactPhone")) {
            if ((queryResult := this.QueryInterface(IContactPhone.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPhone := IContactPhone(outPtr)
        }

        return this.__IContactPhone.put_Kind(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IContactPhone")) {
            if ((queryResult := this.QueryInterface(IContactPhone.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPhone := IContactPhone(outPtr)
        }

        return this.__IContactPhone.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IContactPhone")) {
            if ((queryResult := this.QueryInterface(IContactPhone.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPhone := IContactPhone(outPtr)
        }

        return this.__IContactPhone.put_Description(value)
    }

;@endregion Instance Methods
}
