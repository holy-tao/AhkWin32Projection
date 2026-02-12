#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactConnectedServiceAccount.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a connected service account for a contact.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactconnectedserviceaccount
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactConnectedServiceAccount extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactConnectedServiceAccount

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactConnectedServiceAccount.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the identifier of a connected service account for a contact. The maximum string length for the identifier is 321 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactconnectedserviceaccount.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * Gets or sets the service name of a connected service account for a contact. The maximum string length for the service name is 256 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactconnectedserviceaccount.servicename
     * @type {HSTRING} 
     */
    ServiceName {
        get => this.get_ServiceName()
        set => this.put_ServiceName(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of a [ContactConnectedServiceAccount](contactconnectedserviceaccount.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactConnectedServiceAccount")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IContactConnectedServiceAccount")) {
            if ((queryResult := this.QueryInterface(IContactConnectedServiceAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactConnectedServiceAccount := IContactConnectedServiceAccount(outPtr)
        }

        return this.__IContactConnectedServiceAccount.get_Id()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IContactConnectedServiceAccount")) {
            if ((queryResult := this.QueryInterface(IContactConnectedServiceAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactConnectedServiceAccount := IContactConnectedServiceAccount(outPtr)
        }

        return this.__IContactConnectedServiceAccount.put_Id(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServiceName() {
        if (!this.HasProp("__IContactConnectedServiceAccount")) {
            if ((queryResult := this.QueryInterface(IContactConnectedServiceAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactConnectedServiceAccount := IContactConnectedServiceAccount(outPtr)
        }

        return this.__IContactConnectedServiceAccount.get_ServiceName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ServiceName(value) {
        if (!this.HasProp("__IContactConnectedServiceAccount")) {
            if ((queryResult := this.QueryInterface(IContactConnectedServiceAccount.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactConnectedServiceAccount := IContactConnectedServiceAccount(outPtr)
        }

        return this.__IContactConnectedServiceAccount.put_ServiceName(value)
    }

;@endregion Instance Methods
}
