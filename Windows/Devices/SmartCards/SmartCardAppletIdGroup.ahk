#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardAppletIdGroup.ahk
#Include .\ISmartCardAppletIdGroup2.ahk
#Include .\ISmartCardAppletIdGroupStatics.ahk
#Include .\ISmartCardAppletIdGroupFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class that represents a digitized card, which may either be self-managed (Host Card Emulation) or backed by a physical embedded secure element (eSE). This class can also be thought of as defining a collection of smart card applet IDs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroup
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardAppletIdGroup extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardAppletIdGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardAppletIdGroup.IID

    /**
     * Gets the maximum number of permitted applet IDs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroup.maxappletids
     * @type {Integer} 
     */
    static MaxAppletIds {
        get => SmartCardAppletIdGroup.get_MaxAppletIds()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_MaxAppletIds() {
        if (!SmartCardAppletIdGroup.HasProp("__ISmartCardAppletIdGroupStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardAppletIdGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardAppletIdGroupStatics.IID)
            SmartCardAppletIdGroup.__ISmartCardAppletIdGroupStatics := ISmartCardAppletIdGroupStatics(factoryPtr)
        }

        return SmartCardAppletIdGroup.__ISmartCardAppletIdGroupStatics.get_MaxAppletIds()
    }

    /**
     * Initializes a new instance of the [SmartCardAppletIdGroup](smartcardappletidgroup.md) class using the specified parameters.
     * @param {HSTRING} displayName The name for this applet ID group.
     * @param {IVector<IBuffer>} appletIds The list of applet IDs.
     * @param {Integer} emulationCategory The category of smart card to which the applet IDs apply, payment card or other.
     * @param {Integer} emulationType_ The type of smart card to which the applet IDs apply, host card or UICC.
     * @returns {SmartCardAppletIdGroup} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroup.#ctor
     */
    static Create(displayName, appletIds, emulationCategory, emulationType_) {
        if (!SmartCardAppletIdGroup.HasProp("__ISmartCardAppletIdGroupFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardAppletIdGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardAppletIdGroupFactory.IID)
            SmartCardAppletIdGroup.__ISmartCardAppletIdGroupFactory := ISmartCardAppletIdGroupFactory(factoryPtr)
        }

        return SmartCardAppletIdGroup.__ISmartCardAppletIdGroupFactory.Create(displayName, appletIds, emulationCategory, emulationType_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Sets or gets the name of this applet ID group.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroup.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets the collection of applet IDs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroup.appletids
     * @type {IVector<IBuffer>} 
     */
    AppletIds {
        get => this.get_AppletIds()
    }

    /**
     * Sets or gets the category of smart card to which the applet IDs apply, payment card or other.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroup.smartcardemulationcategory
     * @type {Integer} 
     */
    SmartCardEmulationCategory {
        get => this.get_SmartCardEmulationCategory()
        set => this.put_SmartCardEmulationCategory(value)
    }

    /**
     * Sets or gets the type of smart card to which the applet IDs apply, host card or UICC.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroup.smartcardemulationtype
     * @type {Integer} 
     */
    SmartCardEmulationType {
        get => this.get_SmartCardEmulationType()
        set => this.put_SmartCardEmulationType(value)
    }

    /**
     * Gets or sets a Boolean value indicating if the operating system is permitted to enable this [AppletIdGroup](smartcardappletidgroup.md).
     * @remarks
     * Set this property to true to allow the OS to enable this [AppletIdGroup](smartcardappletidgroup.md). For example, in the NFC settings panel, a user may select a payment app. If there is only a single payment [AppletIdGroup](smartcardappletidgroup.md), and this property is set to true, the OS will automatically enable the [AppletIdGroup](smartcardappletidgroup.md). If false, the OS will always defer to the application to enable the [AppletIdGroup](smartcardappletidgroup.md). The default value is true.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroup.automaticenablement
     * @type {Boolean} 
     */
    AutomaticEnablement {
        get => this.get_AutomaticEnablement()
        set => this.put_AutomaticEnablement(value)
    }

    /**
     * Gets or sets an image that represents the smartcard. This might, for example, mimic the physical appearance of a credit card.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroup.logo
     * @type {IRandomAccessStreamReference} 
     */
    Logo {
        get => this.get_Logo()
        set => this.put_Logo(value)
    }

    /**
     * Gets or sets an extended description of a smartcard to help make it easier to identify the smartcard. You could, for example, set this to the last four digits of a credit card number.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroup.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Gets a (generic) property bag for a smartcard.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroup.properties
     * @type {ValueSet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets or sets a value indicating whether the smartcard requires the user to authenticate using secure biometrics before the smartcard will process a transaction (for example, the user taps their fingerprint to approve a payment). This property applies only to embedded secure element (eSE)-based applets.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardappletidgroup.secureuserauthenticationrequired
     * @type {Boolean} 
     */
    SecureUserAuthenticationRequired {
        get => this.get_SecureUserAuthenticationRequired()
        set => this.put_SecureUserAuthenticationRequired(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SmartCardAppletIdGroup](smartcardappletidgroup.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardAppletIdGroup")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__ISmartCardAppletIdGroup")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup := ISmartCardAppletIdGroup(outPtr)
        }

        return this.__ISmartCardAppletIdGroup.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__ISmartCardAppletIdGroup")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup := ISmartCardAppletIdGroup(outPtr)
        }

        return this.__ISmartCardAppletIdGroup.put_DisplayName(value)
    }

    /**
     * 
     * @returns {IVector<IBuffer>} 
     */
    get_AppletIds() {
        if (!this.HasProp("__ISmartCardAppletIdGroup")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup := ISmartCardAppletIdGroup(outPtr)
        }

        return this.__ISmartCardAppletIdGroup.get_AppletIds()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SmartCardEmulationCategory() {
        if (!this.HasProp("__ISmartCardAppletIdGroup")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup := ISmartCardAppletIdGroup(outPtr)
        }

        return this.__ISmartCardAppletIdGroup.get_SmartCardEmulationCategory()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SmartCardEmulationCategory(value) {
        if (!this.HasProp("__ISmartCardAppletIdGroup")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup := ISmartCardAppletIdGroup(outPtr)
        }

        return this.__ISmartCardAppletIdGroup.put_SmartCardEmulationCategory(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SmartCardEmulationType() {
        if (!this.HasProp("__ISmartCardAppletIdGroup")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup := ISmartCardAppletIdGroup(outPtr)
        }

        return this.__ISmartCardAppletIdGroup.get_SmartCardEmulationType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SmartCardEmulationType(value) {
        if (!this.HasProp("__ISmartCardAppletIdGroup")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup := ISmartCardAppletIdGroup(outPtr)
        }

        return this.__ISmartCardAppletIdGroup.put_SmartCardEmulationType(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutomaticEnablement() {
        if (!this.HasProp("__ISmartCardAppletIdGroup")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup := ISmartCardAppletIdGroup(outPtr)
        }

        return this.__ISmartCardAppletIdGroup.get_AutomaticEnablement()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutomaticEnablement(value) {
        if (!this.HasProp("__ISmartCardAppletIdGroup")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup := ISmartCardAppletIdGroup(outPtr)
        }

        return this.__ISmartCardAppletIdGroup.put_AutomaticEnablement(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Logo() {
        if (!this.HasProp("__ISmartCardAppletIdGroup2")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup2 := ISmartCardAppletIdGroup2(outPtr)
        }

        return this.__ISmartCardAppletIdGroup2.get_Logo()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Logo(value) {
        if (!this.HasProp("__ISmartCardAppletIdGroup2")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup2 := ISmartCardAppletIdGroup2(outPtr)
        }

        return this.__ISmartCardAppletIdGroup2.put_Logo(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__ISmartCardAppletIdGroup2")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup2 := ISmartCardAppletIdGroup2(outPtr)
        }

        return this.__ISmartCardAppletIdGroup2.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__ISmartCardAppletIdGroup2")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup2 := ISmartCardAppletIdGroup2(outPtr)
        }

        return this.__ISmartCardAppletIdGroup2.put_Description(value)
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Properties() {
        if (!this.HasProp("__ISmartCardAppletIdGroup2")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup2 := ISmartCardAppletIdGroup2(outPtr)
        }

        return this.__ISmartCardAppletIdGroup2.get_Properties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SecureUserAuthenticationRequired() {
        if (!this.HasProp("__ISmartCardAppletIdGroup2")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup2 := ISmartCardAppletIdGroup2(outPtr)
        }

        return this.__ISmartCardAppletIdGroup2.get_SecureUserAuthenticationRequired()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SecureUserAuthenticationRequired(value) {
        if (!this.HasProp("__ISmartCardAppletIdGroup2")) {
            if ((queryResult := this.QueryInterface(ISmartCardAppletIdGroup2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardAppletIdGroup2 := ISmartCardAppletIdGroup2(outPtr)
        }

        return this.__ISmartCardAppletIdGroup2.put_SecureUserAuthenticationRequired(value)
    }

;@endregion Instance Methods
}
