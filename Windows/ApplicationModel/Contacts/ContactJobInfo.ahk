#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactJobInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents job info for a contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactjobinfo
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactJobInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactJobInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactJobInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the company name of the job info for a contact. The maximum string length for the company name is 64 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactjobinfo.companyname
     * @type {HSTRING} 
     */
    CompanyName {
        get => this.get_CompanyName()
        set => this.put_CompanyName(value)
    }

    /**
     * Gets or sets the company Yomi (phonetic Japanese equivalent) name of the job info for a contact. The maximum string length for the company Yomi name is 200 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactjobinfo.companyyominame
     * @type {HSTRING} 
     */
    CompanyYomiName {
        get => this.get_CompanyYomiName()
        set => this.put_CompanyYomiName(value)
    }

    /**
     * Gets or sets the department of the job info for a contact. The maximum string length for the department is 100 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactjobinfo.department
     * @type {HSTRING} 
     */
    Department {
        get => this.get_Department()
        set => this.put_Department(value)
    }

    /**
     * Gets or sets the title of the job info for a contact. The maximum string length for the title is 1024 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactjobinfo.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets the manager of the job info for a contact. The maximum string length for the manager is 1024 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactjobinfo.manager
     * @type {HSTRING} 
     */
    Manager {
        get => this.get_Manager()
        set => this.put_Manager(value)
    }

    /**
     * Gets or sets the office of the job info for a contact. The maximum string length for the office is 40 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactjobinfo.office
     * @type {HSTRING} 
     */
    Office {
        get => this.get_Office()
        set => this.put_Office(value)
    }

    /**
     * Gets or sets the company address of the job info for a contact. The maximum string length for the company address is 1024 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactjobinfo.companyaddress
     * @type {HSTRING} 
     */
    CompanyAddress {
        get => this.get_CompanyAddress()
        set => this.put_CompanyAddress(value)
    }

    /**
     * Gets or sets the description of the job info for a contact. The maximum string length for the description is 512 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactjobinfo.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of a [ContactJobInfo](contactjobinfo.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactJobInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CompanyName() {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.get_CompanyName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CompanyName(value) {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.put_CompanyName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CompanyYomiName() {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.get_CompanyYomiName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CompanyYomiName(value) {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.put_CompanyYomiName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Department() {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.get_Department()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Department(value) {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.put_Department(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.put_Title(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Manager() {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.get_Manager()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Manager(value) {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.put_Manager(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Office() {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.get_Office()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Office(value) {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.put_Office(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CompanyAddress() {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.get_CompanyAddress()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CompanyAddress(value) {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.put_CompanyAddress(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IContactJobInfo")) {
            if ((queryResult := this.QueryInterface(IContactJobInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactJobInfo := IContactJobInfo(outPtr)
        }

        return this.__IContactJobInfo.put_Description(value)
    }

;@endregion Instance Methods
}
