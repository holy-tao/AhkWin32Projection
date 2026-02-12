#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactWebsite.ahk
#Include .\IContactWebsite2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the info about a Web site for a contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactwebsite
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactWebsite extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactWebsite

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactWebsite.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the Uniform Resource Identifier (URI) of a Web site for a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactwebsite.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
        set => this.put_Uri(value)
    }

    /**
     * Gets or sets the description of a Web site for a contact. The maximum string length for the description is 512 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactwebsite.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Gets or sets the raw website address for the contact. This address is not checked for valid URI formatti.ng
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactwebsite.rawvalue
     * @type {HSTRING} 
     */
    RawValue {
        get => this.get_RawValue()
        set => this.put_RawValue(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of a [ContactWebsite](contactwebsite.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactWebsite")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IContactWebsite")) {
            if ((queryResult := this.QueryInterface(IContactWebsite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactWebsite := IContactWebsite(outPtr)
        }

        return this.__IContactWebsite.get_Uri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Uri(value) {
        if (!this.HasProp("__IContactWebsite")) {
            if ((queryResult := this.QueryInterface(IContactWebsite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactWebsite := IContactWebsite(outPtr)
        }

        return this.__IContactWebsite.put_Uri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IContactWebsite")) {
            if ((queryResult := this.QueryInterface(IContactWebsite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactWebsite := IContactWebsite(outPtr)
        }

        return this.__IContactWebsite.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IContactWebsite")) {
            if ((queryResult := this.QueryInterface(IContactWebsite.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactWebsite := IContactWebsite(outPtr)
        }

        return this.__IContactWebsite.put_Description(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RawValue() {
        if (!this.HasProp("__IContactWebsite2")) {
            if ((queryResult := this.QueryInterface(IContactWebsite2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactWebsite2 := IContactWebsite2(outPtr)
        }

        return this.__IContactWebsite2.get_RawValue()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RawValue(value) {
        if (!this.HasProp("__IContactWebsite2")) {
            if ((queryResult := this.QueryInterface(IContactWebsite2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactWebsite2 := IContactWebsite2(outPtr)
        }

        return this.__IContactWebsite2.put_RawValue(value)
    }

;@endregion Instance Methods
}
