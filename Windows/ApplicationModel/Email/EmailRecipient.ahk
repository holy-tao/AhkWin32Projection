#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEmailRecipient.ahk
#Include .\IEmailRecipientFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an email recipient.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailrecipient
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class EmailRecipient extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEmailRecipient

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEmailRecipient.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes an instance of the [EmailRecipient](emailrecipient.md) class.
     * @param {HSTRING} address_ The address of the recipient.
     * @returns {EmailRecipient} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailrecipient.#ctor
     */
    static Create(address_) {
        if (!EmailRecipient.HasProp("__IEmailRecipientFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailRecipient")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEmailRecipientFactory.IID)
            EmailRecipient.__IEmailRecipientFactory := IEmailRecipientFactory(factoryPtr)
        }

        return EmailRecipient.__IEmailRecipientFactory.Create(address_)
    }

    /**
     * Initializes an instance of the [EmailRecipient](emailrecipient.md) class.
     * @param {HSTRING} address_ The address of the recipient.
     * @param {HSTRING} name The name of the recipient.
     * @returns {EmailRecipient} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailrecipient.#ctor
     */
    static CreateWithName(address_, name) {
        if (!EmailRecipient.HasProp("__IEmailRecipientFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailRecipient")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IEmailRecipientFactory.IID)
            EmailRecipient.__IEmailRecipientFactory := IEmailRecipientFactory(factoryPtr)
        }

        return EmailRecipient.__IEmailRecipientFactory.CreateWithName(address_, name)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the name of the email recipient.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailrecipient.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets the address of the email recipient.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.email.emailrecipient.address
     * @type {HSTRING} 
     */
    Address {
        get => this.get_Address()
        set => this.put_Address(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes an instance of the [EmailRecipient](emailrecipient.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Email.EmailRecipient")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IEmailRecipient")) {
            if ((queryResult := this.QueryInterface(IEmailRecipient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailRecipient := IEmailRecipient(outPtr)
        }

        return this.__IEmailRecipient.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IEmailRecipient")) {
            if ((queryResult := this.QueryInterface(IEmailRecipient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailRecipient := IEmailRecipient(outPtr)
        }

        return this.__IEmailRecipient.put_Name(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Address() {
        if (!this.HasProp("__IEmailRecipient")) {
            if ((queryResult := this.QueryInterface(IEmailRecipient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailRecipient := IEmailRecipient(outPtr)
        }

        return this.__IEmailRecipient.get_Address()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Address(value) {
        if (!this.HasProp("__IEmailRecipient")) {
            if ((queryResult := this.QueryInterface(IEmailRecipient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEmailRecipient := IEmailRecipient(outPtr)
        }

        return this.__IEmailRecipient.put_Address(value)
    }

;@endregion Instance Methods
}
