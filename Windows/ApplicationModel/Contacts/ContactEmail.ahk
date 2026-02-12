#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactEmail.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an email address of a contact.
 * @remarks
 * For info about how to manage contacts, see [Contacts and calendar](/windows/uwp/contacts-and-calendar/).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactemail
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactEmail extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactEmail

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactEmail.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the email address of a contact. The maximum string length for the description is 321 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactemail.address
     * @type {HSTRING} 
     */
    Address {
        get => this.get_Address()
        set => this.put_Address(value)
    }

    /**
     * Gets or sets the kind of email address of a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactemail.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
        set => this.put_Kind(value)
    }

    /**
     * Gets or sets the description of an email address of a contact. The maximum string length for the description is 512 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactemail.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of a [ContactEmail](contactemail.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactEmail")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Address() {
        if (!this.HasProp("__IContactEmail")) {
            if ((queryResult := this.QueryInterface(IContactEmail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactEmail := IContactEmail(outPtr)
        }

        return this.__IContactEmail.get_Address()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Address(value) {
        if (!this.HasProp("__IContactEmail")) {
            if ((queryResult := this.QueryInterface(IContactEmail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactEmail := IContactEmail(outPtr)
        }

        return this.__IContactEmail.put_Address(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IContactEmail")) {
            if ((queryResult := this.QueryInterface(IContactEmail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactEmail := IContactEmail(outPtr)
        }

        return this.__IContactEmail.get_Kind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Kind(value) {
        if (!this.HasProp("__IContactEmail")) {
            if ((queryResult := this.QueryInterface(IContactEmail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactEmail := IContactEmail(outPtr)
        }

        return this.__IContactEmail.put_Kind(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IContactEmail")) {
            if ((queryResult := this.QueryInterface(IContactEmail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactEmail := IContactEmail(outPtr)
        }

        return this.__IContactEmail.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IContactEmail")) {
            if ((queryResult := this.QueryInterface(IContactEmail.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactEmail := IContactEmail(outPtr)
        }

        return this.__IContactEmail.put_Description(value)
    }

;@endregion Instance Methods
}
