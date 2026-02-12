#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactCardOptions.ahk
#Include .\IContactCardOptions2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents data about how to display a mini contact card.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactcardoptions
 * @namespace Windows.ApplicationModel.Contacts
 * @version WindowsRuntime 1.4
 */
class ContactCardOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactCardOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactCardOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that specifies the type of header to display on the contact card.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactcardoptions.headerkind
     * @type {Integer} 
     */
    HeaderKind {
        get => this.get_HeaderKind()
        set => this.put_HeaderKind(value)
    }

    /**
     * Gets or sets a value that indicates which tab to display first on a mini contact card.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactcardoptions.initialtabkind
     * @type {Integer} 
     */
    InitialTabKind {
        get => this.get_InitialTabKind()
        set => this.put_InitialTabKind(value)
    }

    /**
     * Gets a list to which you can add [ContactList.Id](contactlist_id.md) values to search for on the server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.contacts.contactcardoptions.serversearchcontactlistids
     * @type {IVector<HSTRING>} 
     */
    ServerSearchContactListIds {
        get => this.get_ServerSearchContactListIds()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ContactCardOptions](contactcardoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Contacts.ContactCardOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HeaderKind() {
        if (!this.HasProp("__IContactCardOptions")) {
            if ((queryResult := this.QueryInterface(IContactCardOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactCardOptions := IContactCardOptions(outPtr)
        }

        return this.__IContactCardOptions.get_HeaderKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HeaderKind(value) {
        if (!this.HasProp("__IContactCardOptions")) {
            if ((queryResult := this.QueryInterface(IContactCardOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactCardOptions := IContactCardOptions(outPtr)
        }

        return this.__IContactCardOptions.put_HeaderKind(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InitialTabKind() {
        if (!this.HasProp("__IContactCardOptions")) {
            if ((queryResult := this.QueryInterface(IContactCardOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactCardOptions := IContactCardOptions(outPtr)
        }

        return this.__IContactCardOptions.get_InitialTabKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InitialTabKind(value) {
        if (!this.HasProp("__IContactCardOptions")) {
            if ((queryResult := this.QueryInterface(IContactCardOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactCardOptions := IContactCardOptions(outPtr)
        }

        return this.__IContactCardOptions.put_InitialTabKind(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ServerSearchContactListIds() {
        if (!this.HasProp("__IContactCardOptions2")) {
            if ((queryResult := this.QueryInterface(IContactCardOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactCardOptions2 := IContactCardOptions2(outPtr)
        }

        return this.__IContactCardOptions2.get_ServerSearchContactListIds()
    }

;@endregion Instance Methods
}
