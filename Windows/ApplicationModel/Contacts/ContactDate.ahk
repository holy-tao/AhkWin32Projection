#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactDate.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an important date for a contact.
 * @remarks
 * Here is how to use the ContactDate properties to format date strings.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactdate
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactDate extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactDate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactDate.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the day for an important date for a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactdate.day
     * @type {IReference<Integer>} 
     */
    Day {
        get => this.get_Day()
        set => this.put_Day(value)
    }

    /**
     * Gets or sets the month for an important date for a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactdate.month
     * @type {IReference<Integer>} 
     */
    Month {
        get => this.get_Month()
        set => this.put_Month(value)
    }

    /**
     * Gets or sets the year for an important date for a contact. This value must be convertible to a [FILETIME](/windows/desktop/api/minwinbase/ns-minwinbase-filetime) structure.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactdate.year
     * @type {IReference<Integer>} 
     */
    Year {
        get => this.get_Year()
        set => this.put_Year(value)
    }

    /**
     * Gets or sets the kind of important date for a contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactdate.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
        set => this.put_Kind(value)
    }

    /**
     * Gets or sets the description for an important date for a contact. The maximum string length for the description is 512 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactdate.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of a [ContactDate](contactdate.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactDate")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Day() {
        if (!this.HasProp("__IContactDate")) {
            if ((queryResult := this.QueryInterface(IContactDate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDate := IContactDate(outPtr)
        }

        return this.__IContactDate.get_Day()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Day(value) {
        if (!this.HasProp("__IContactDate")) {
            if ((queryResult := this.QueryInterface(IContactDate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDate := IContactDate(outPtr)
        }

        return this.__IContactDate.put_Day(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Month() {
        if (!this.HasProp("__IContactDate")) {
            if ((queryResult := this.QueryInterface(IContactDate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDate := IContactDate(outPtr)
        }

        return this.__IContactDate.get_Month()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Month(value) {
        if (!this.HasProp("__IContactDate")) {
            if ((queryResult := this.QueryInterface(IContactDate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDate := IContactDate(outPtr)
        }

        return this.__IContactDate.put_Month(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_Year() {
        if (!this.HasProp("__IContactDate")) {
            if ((queryResult := this.QueryInterface(IContactDate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDate := IContactDate(outPtr)
        }

        return this.__IContactDate.get_Year()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_Year(value) {
        if (!this.HasProp("__IContactDate")) {
            if ((queryResult := this.QueryInterface(IContactDate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDate := IContactDate(outPtr)
        }

        return this.__IContactDate.put_Year(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IContactDate")) {
            if ((queryResult := this.QueryInterface(IContactDate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDate := IContactDate(outPtr)
        }

        return this.__IContactDate.get_Kind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Kind(value) {
        if (!this.HasProp("__IContactDate")) {
            if ((queryResult := this.QueryInterface(IContactDate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDate := IContactDate(outPtr)
        }

        return this.__IContactDate.put_Kind(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IContactDate")) {
            if ((queryResult := this.QueryInterface(IContactDate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDate := IContactDate(outPtr)
        }

        return this.__IContactDate.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IContactDate")) {
            if ((queryResult := this.QueryInterface(IContactDate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactDate := IContactDate(outPtr)
        }

        return this.__IContactDate.put_Description(value)
    }

;@endregion Instance Methods
}
