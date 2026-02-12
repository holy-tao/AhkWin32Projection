#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactSignificantOther.ahk
#Include .\IContactSignificantOther2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the info about a significant other for a contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactsignificantother
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactSignificantOther extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactSignificantOther

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactSignificantOther.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the name of a significant other for a contact. The maximum string length for the name is 256 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactsignificantother.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets the description of a significant other for a contact. The maximum string length for the description is 512 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactsignificantother.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Gets or sets a value that indicates the nature of the relationship, such as spouse, partner, sibling, parent and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactsignificantother.relationship
     * @type {Integer} 
     */
    Relationship {
        get => this.get_Relationship()
        set => this.put_Relationship(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of a [ContactSignificantOther](contactsignificantother.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactSignificantOther")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IContactSignificantOther")) {
            if ((queryResult := this.QueryInterface(IContactSignificantOther.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactSignificantOther := IContactSignificantOther(outPtr)
        }

        return this.__IContactSignificantOther.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IContactSignificantOther")) {
            if ((queryResult := this.QueryInterface(IContactSignificantOther.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactSignificantOther := IContactSignificantOther(outPtr)
        }

        return this.__IContactSignificantOther.put_Name(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IContactSignificantOther")) {
            if ((queryResult := this.QueryInterface(IContactSignificantOther.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactSignificantOther := IContactSignificantOther(outPtr)
        }

        return this.__IContactSignificantOther.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IContactSignificantOther")) {
            if ((queryResult := this.QueryInterface(IContactSignificantOther.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactSignificantOther := IContactSignificantOther(outPtr)
        }

        return this.__IContactSignificantOther.put_Description(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Relationship() {
        if (!this.HasProp("__IContactSignificantOther2")) {
            if ((queryResult := this.QueryInterface(IContactSignificantOther2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactSignificantOther2 := IContactSignificantOther2(outPtr)
        }

        return this.__IContactSignificantOther2.get_Relationship()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Relationship(value) {
        if (!this.HasProp("__IContactSignificantOther2")) {
            if ((queryResult := this.QueryInterface(IContactSignificantOther2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactSignificantOther2 := IContactSignificantOther2(outPtr)
        }

        return this.__IContactSignificantOther2.put_Relationship(value)
    }

;@endregion Instance Methods
}
