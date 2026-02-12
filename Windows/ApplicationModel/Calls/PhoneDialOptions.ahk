#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneDialOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents options for dialing a call.
 * @remarks
 * If you are supplying an [IContact](/previous-versions/aa912125(v=msdn.10)) as the [Contact](phonedialoptions_contact.md), then you need to make sure it is a component contact and not an aggregate contact. This will make sure that the correct contact is reached when you attempt to place a call using these PhoneDialOptions. Otherwise, the additional information in the contact will be lost and a lookup will be performed using only the number. This might result in the incorrect contact being selected if multiple contacts share the same number but have different metadata.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonedialoptions
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneDialOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneDialOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneDialOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the phone number to dial.
     * @remarks
     * If no number is specified in this property, the system will attempt to get the number automatically from the associated [ContactPhone](phonedialoptions_contactphone.md) instance. Otherwise, this Number will take precedence.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonedialoptions.number
     * @type {HSTRING} 
     */
    Number {
        get => this.get_Number()
        set => this.put_Number(value)
    }

    /**
     * Gets or sets the name of the party being dialed. This value is displayed if the number being dialed does not have a party name with a matching number in the user's address book.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonedialoptions.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets the address book contact associated with a dial request.
     * @remarks
     * If you are supplying an [IContact](/previous-versions/aa912125(v=msdn.10)) as the Contact, then you need to make sure it is a component contact and not an aggregate contact. This will make sure that the correct contact is reached when you attempt to place a call using these [PhoneDialOptions](phonedialoptions.md). Otherwise, the additional information in the contact will be lost and a lookup will be performed using only the number. This might result in the incorrect contact being selected if multiple contacts share the same number but have different metadata.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonedialoptions.contact
     * @type {Contact} 
     */
    Contact {
        get => this.get_Contact()
        set => this.put_Contact(value)
    }

    /**
     * Gets or sets the phone number property of the address book contact that is associated with the dial request.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonedialoptions.contactphone
     * @type {ContactPhone} 
     */
    ContactPhone {
        get => this.get_ContactPhone()
        set => this.put_ContactPhone(value)
    }

    /**
     * Gets or Sets the type or types of media requested for a dial.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonedialoptions.media
     * @type {Integer} 
     */
    Media {
        get => this.get_Media()
        set => this.put_Media(value)
    }

    /**
     * Gets or sets the audio endpoint requested for a dial.
     * @remarks
     * The audio endpoint specified by the application is provided as a hint to the system. The system might ignore this information if, for example, the current audio routing policies don't support the specified endpoint.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonedialoptions.audioendpoint
     * @type {Integer} 
     */
    AudioEndpoint {
        get => this.get_AudioEndpoint()
        set => this.put_AudioEndpoint(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the  class
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneDialOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Number() {
        if (!this.HasProp("__IPhoneDialOptions")) {
            if ((queryResult := this.QueryInterface(IPhoneDialOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneDialOptions := IPhoneDialOptions(outPtr)
        }

        return this.__IPhoneDialOptions.get_Number()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Number(value) {
        if (!this.HasProp("__IPhoneDialOptions")) {
            if ((queryResult := this.QueryInterface(IPhoneDialOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneDialOptions := IPhoneDialOptions(outPtr)
        }

        return this.__IPhoneDialOptions.put_Number(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPhoneDialOptions")) {
            if ((queryResult := this.QueryInterface(IPhoneDialOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneDialOptions := IPhoneDialOptions(outPtr)
        }

        return this.__IPhoneDialOptions.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IPhoneDialOptions")) {
            if ((queryResult := this.QueryInterface(IPhoneDialOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneDialOptions := IPhoneDialOptions(outPtr)
        }

        return this.__IPhoneDialOptions.put_DisplayName(value)
    }

    /**
     * 
     * @returns {Contact} 
     */
    get_Contact() {
        if (!this.HasProp("__IPhoneDialOptions")) {
            if ((queryResult := this.QueryInterface(IPhoneDialOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneDialOptions := IPhoneDialOptions(outPtr)
        }

        return this.__IPhoneDialOptions.get_Contact()
    }

    /**
     * 
     * @param {Contact} value 
     * @returns {HRESULT} 
     */
    put_Contact(value) {
        if (!this.HasProp("__IPhoneDialOptions")) {
            if ((queryResult := this.QueryInterface(IPhoneDialOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneDialOptions := IPhoneDialOptions(outPtr)
        }

        return this.__IPhoneDialOptions.put_Contact(value)
    }

    /**
     * 
     * @returns {ContactPhone} 
     */
    get_ContactPhone() {
        if (!this.HasProp("__IPhoneDialOptions")) {
            if ((queryResult := this.QueryInterface(IPhoneDialOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneDialOptions := IPhoneDialOptions(outPtr)
        }

        return this.__IPhoneDialOptions.get_ContactPhone()
    }

    /**
     * 
     * @param {ContactPhone} value 
     * @returns {HRESULT} 
     */
    put_ContactPhone(value) {
        if (!this.HasProp("__IPhoneDialOptions")) {
            if ((queryResult := this.QueryInterface(IPhoneDialOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneDialOptions := IPhoneDialOptions(outPtr)
        }

        return this.__IPhoneDialOptions.put_ContactPhone(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Media() {
        if (!this.HasProp("__IPhoneDialOptions")) {
            if ((queryResult := this.QueryInterface(IPhoneDialOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneDialOptions := IPhoneDialOptions(outPtr)
        }

        return this.__IPhoneDialOptions.get_Media()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Media(value) {
        if (!this.HasProp("__IPhoneDialOptions")) {
            if ((queryResult := this.QueryInterface(IPhoneDialOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneDialOptions := IPhoneDialOptions(outPtr)
        }

        return this.__IPhoneDialOptions.put_Media(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioEndpoint() {
        if (!this.HasProp("__IPhoneDialOptions")) {
            if ((queryResult := this.QueryInterface(IPhoneDialOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneDialOptions := IPhoneDialOptions(outPtr)
        }

        return this.__IPhoneDialOptions.get_AudioEndpoint()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AudioEndpoint(value) {
        if (!this.HasProp("__IPhoneDialOptions")) {
            if ((queryResult := this.QueryInterface(IPhoneDialOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneDialOptions := IPhoneDialOptions(outPtr)
        }

        return this.__IPhoneDialOptions.put_AudioEndpoint(value)
    }

;@endregion Instance Methods
}
