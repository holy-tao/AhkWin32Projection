#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallHistoryEntryAddress.ahk
#Include .\IPhoneCallHistoryEntryAddressFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Address book information for a contact used by [PhoneCallHistoryEntry](phonecallhistoryentry.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentryaddress
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallHistoryEntryAddress extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneCallHistoryEntryAddress

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneCallHistoryEntryAddress.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [PhoneCallHistoryEntryAddress](phonecallhistoryentryaddress.md) object with an initial address.
     * @param {HSTRING} rawAddress The address to initiailize to the [RawAddress](phonecallhistoryentryaddress_rawaddress.md) property.
     * @param {Integer} rawAddressKind The type of address represented by *rawAddress*.
     * @returns {PhoneCallHistoryEntryAddress} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentryaddress.#ctor
     */
    static Create(rawAddress, rawAddressKind) {
        if (!PhoneCallHistoryEntryAddress.HasProp("__IPhoneCallHistoryEntryAddressFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallHistoryEntryAddress")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPhoneCallHistoryEntryAddressFactory.IID)
            PhoneCallHistoryEntryAddress.__IPhoneCallHistoryEntryAddressFactory := IPhoneCallHistoryEntryAddressFactory(factoryPtr)
        }

        return PhoneCallHistoryEntryAddress.__IPhoneCallHistoryEntryAddressFactory.Create(rawAddress, rawAddressKind)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the unique identifier for this contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentryaddress.contactid
     * @type {HSTRING} 
     */
    ContactId {
        get => this.get_ContactId()
        set => this.put_ContactId(value)
    }

    /**
     * Get or sets the display name for this entry.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentryaddress.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets the address information for this contact.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentryaddress.rawaddress
     * @type {HSTRING} 
     */
    RawAddress {
        get => this.get_RawAddress()
        set => this.put_RawAddress(value)
    }

    /**
     * Gets or sets the type of address indicated by [RawAddress](phonecallhistoryentryaddress_rawaddress.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallhistoryentryaddress.rawaddresskind
     * @type {Integer} 
     */
    RawAddressKind {
        get => this.get_RawAddressKind()
        set => this.put_RawAddressKind(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new empty [PhoneCallHistoryEntryAddress](phonecallhistoryentryaddress.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Calls.PhoneCallHistoryEntryAddress")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ContactId() {
        if (!this.HasProp("__IPhoneCallHistoryEntryAddress")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntryAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntryAddress := IPhoneCallHistoryEntryAddress(outPtr)
        }

        return this.__IPhoneCallHistoryEntryAddress.get_ContactId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ContactId(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntryAddress")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntryAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntryAddress := IPhoneCallHistoryEntryAddress(outPtr)
        }

        return this.__IPhoneCallHistoryEntryAddress.put_ContactId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPhoneCallHistoryEntryAddress")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntryAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntryAddress := IPhoneCallHistoryEntryAddress(outPtr)
        }

        return this.__IPhoneCallHistoryEntryAddress.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntryAddress")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntryAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntryAddress := IPhoneCallHistoryEntryAddress(outPtr)
        }

        return this.__IPhoneCallHistoryEntryAddress.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RawAddress() {
        if (!this.HasProp("__IPhoneCallHistoryEntryAddress")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntryAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntryAddress := IPhoneCallHistoryEntryAddress(outPtr)
        }

        return this.__IPhoneCallHistoryEntryAddress.get_RawAddress()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RawAddress(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntryAddress")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntryAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntryAddress := IPhoneCallHistoryEntryAddress(outPtr)
        }

        return this.__IPhoneCallHistoryEntryAddress.put_RawAddress(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RawAddressKind() {
        if (!this.HasProp("__IPhoneCallHistoryEntryAddress")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntryAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntryAddress := IPhoneCallHistoryEntryAddress(outPtr)
        }

        return this.__IPhoneCallHistoryEntryAddress.get_RawAddressKind()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RawAddressKind(value) {
        if (!this.HasProp("__IPhoneCallHistoryEntryAddress")) {
            if ((queryResult := this.QueryInterface(IPhoneCallHistoryEntryAddress.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallHistoryEntryAddress := IPhoneCallHistoryEntryAddress(outPtr)
        }

        return this.__IPhoneCallHistoryEntryAddress.put_RawAddressKind(value)
    }

;@endregion Instance Methods
}
