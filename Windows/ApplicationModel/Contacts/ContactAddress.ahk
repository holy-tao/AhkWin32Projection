#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactAddress.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the address of a contact.
 * @remarks
 * For info about how to handle app activation through contact actions, see [Quickstart: Handling contact actions ](/previous-versions/windows/apps/dn518236(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactaddress
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactAddress extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactAddress

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactAddress.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the street address of a contact address. The maximum string length for the street address is 1024 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactaddress.streetaddress
     * @type {HSTRING} 
     */
    StreetAddress {
        get => this.get_StreetAddress()
        set => this.put_StreetAddress(value)
    }

    /**
     * Gets or sets the locality of a contact address. The maximum string length for the locality is 1024 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactaddress.locality
     * @type {HSTRING} 
     */
    Locality {
        get => this.get_Locality()
        set => this.put_Locality(value)
    }

    /**
     * Gets or sets the region of a contact address. The maximum string length for the region is 1024 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactaddress.region
     * @type {HSTRING} 
     */
    Region {
        get => this.get_Region()
        set => this.put_Region(value)
    }

    /**
     * Gets or sets the country of a contact address. The maximum string length for the country is 1024 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactaddress.country
     * @type {HSTRING} 
     */
    Country {
        get => this.get_Country()
        set => this.put_Country(value)
    }

    /**
     * Gets or sets the postal code of a contact address. The maximum string length for the postal code is 1024 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactaddress.postalcode
     * @type {HSTRING} 
     */
    PostalCode {
        get => this.get_PostalCode()
        set => this.put_PostalCode(value)
    }

    /**
     * Gets or sets the kind of contact address.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactaddress.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
        set => this.put_Kind(value)
    }

    /**
     * Gets or sets the description of a contact address. The maximum string length for the description is 512 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactaddress.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of a [ContactAddress](contactaddress.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactAddress")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_StreetAddress() {
        if (!this.HasProp("__IContactAddress")) {
            if ((queryResult := this.QueryInterface(IContactAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAddress := IContactAddress(outPtr)
        }

        return this.__IContactAddress.get_StreetAddress()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_StreetAddress(value) {
        if (!this.HasProp("__IContactAddress")) {
            if ((queryResult := this.QueryInterface(IContactAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAddress := IContactAddress(outPtr)
        }

        return this.__IContactAddress.put_StreetAddress(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Locality() {
        if (!this.HasProp("__IContactAddress")) {
            if ((queryResult := this.QueryInterface(IContactAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAddress := IContactAddress(outPtr)
        }

        return this.__IContactAddress.get_Locality()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Locality(value) {
        if (!this.HasProp("__IContactAddress")) {
            if ((queryResult := this.QueryInterface(IContactAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAddress := IContactAddress(outPtr)
        }

        return this.__IContactAddress.put_Locality(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Region() {
        if (!this.HasProp("__IContactAddress")) {
            if ((queryResult := this.QueryInterface(IContactAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAddress := IContactAddress(outPtr)
        }

        return this.__IContactAddress.get_Region()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Region(value) {
        if (!this.HasProp("__IContactAddress")) {
            if ((queryResult := this.QueryInterface(IContactAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAddress := IContactAddress(outPtr)
        }

        return this.__IContactAddress.put_Region(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Country() {
        if (!this.HasProp("__IContactAddress")) {
            if ((queryResult := this.QueryInterface(IContactAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAddress := IContactAddress(outPtr)
        }

        return this.__IContactAddress.get_Country()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Country(value) {
        if (!this.HasProp("__IContactAddress")) {
            if ((queryResult := this.QueryInterface(IContactAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAddress := IContactAddress(outPtr)
        }

        return this.__IContactAddress.put_Country(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PostalCode() {
        if (!this.HasProp("__IContactAddress")) {
            if ((queryResult := this.QueryInterface(IContactAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAddress := IContactAddress(outPtr)
        }

        return this.__IContactAddress.get_PostalCode()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PostalCode(value) {
        if (!this.HasProp("__IContactAddress")) {
            if ((queryResult := this.QueryInterface(IContactAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAddress := IContactAddress(outPtr)
        }

        return this.__IContactAddress.put_PostalCode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IContactAddress")) {
            if ((queryResult := this.QueryInterface(IContactAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAddress := IContactAddress(outPtr)
        }

        return this.__IContactAddress.get_Kind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Kind(value) {
        if (!this.HasProp("__IContactAddress")) {
            if ((queryResult := this.QueryInterface(IContactAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAddress := IContactAddress(outPtr)
        }

        return this.__IContactAddress.put_Kind(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IContactAddress")) {
            if ((queryResult := this.QueryInterface(IContactAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAddress := IContactAddress(outPtr)
        }

        return this.__IContactAddress.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IContactAddress")) {
            if ((queryResult := this.QueryInterface(IContactAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactAddress := IContactAddress(outPtr)
        }

        return this.__IContactAddress.put_Description(value)
    }

;@endregion Instance Methods
}
