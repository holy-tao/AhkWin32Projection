#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWalletItemCustomProperty.ahk
#Include .\IWalletItemCustomPropertyFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!CAUTION]
  * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
  * 
  * Defines a custom property on a wallet item. Apps can show data in the details view or back of card view of the item.
 * @remarks
 * WalletItemCustomProperty values are stored in the [DisplayProperties](walletitem_displayproperties.md) property of a [WalletItem](walletitem.md). In addition to the basic data ([Name](walletitemcustomproperty_name.md) and [Value](walletitemcustomproperty_value.md)) a WalletItemCustomProperty object has other properties that influence how the property appears in the default wallet UI (for example [SummaryViewPosition](walletitemcustomproperty_summaryviewposition.md), [DetailViewPosition](walletitemcustomproperty_detailviewposition.md)).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemcustomproperty
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class WalletItemCustomProperty extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWalletItemCustomProperty

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWalletItemCustomProperty.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Initializes a new instance of the [WalletItemCustomProperty](walletitemcustomproperty.md) class.
     * @param {HSTRING} name The custom property label. Sets the initial [Name](walletitemcustomproperty_name.md) value.
     * @param {HSTRING} value The value of the property. Sets the initial [Value](walletitemcustomproperty_value.md) value.
     * @returns {WalletItemCustomProperty} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemcustomproperty.#ctor
     */
    static CreateWalletItemCustomProperty(name, value) {
        if (!WalletItemCustomProperty.HasProp("__IWalletItemCustomPropertyFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Wallet.WalletItemCustomProperty")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWalletItemCustomPropertyFactory.IID)
            WalletItemCustomProperty.__IWalletItemCustomPropertyFactory := IWalletItemCustomPropertyFactory(factoryPtr)
        }

        return WalletItemCustomProperty.__IWalletItemCustomPropertyFactory.CreateWalletItemCustomProperty(name, value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the custom property label.
     * @remarks
     * Unlike the key for the [DisplayProperties](walletitem_displayproperties.md) collection, the Name value of a [WalletItemCustomProperty](walletitemcustomproperty.md) object is intended for user UI. Setting the value that's reported by Name is a required parameter when you construct a new [WalletItemCustomProperty](walletitemcustomproperty.md) (see [WalletItemCustomProperty constructor](walletitemcustomproperty_walletitemcustomproperty_1571897524.md)). In most cases you won't be setting the Name property of an existing [WalletItemCustomProperty](walletitemcustomproperty.md), as opposed to constructing a new one.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemcustomproperty.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the custom property value.
     * @remarks
     * Setting the value that's reported by Value is a required parameter when you construct a new [WalletItemCustomProperty](walletitemcustomproperty.md) (see [WalletItemCustomProperty constructor](walletitemcustomproperty_walletitemcustomproperty_1571897524.md)). In most cases you won't be setting the Value property of an existing [WalletItemCustomProperty](walletitemcustomproperty.md), as opposed to constructing a new one.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemcustomproperty.value
     * @type {HSTRING} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets whether this [WalletItemCustomProperty](walletitemcustomproperty.md) is entity-extracted and actionable upon display.
     * @remarks
     * *Entity-extracted* is a term for the automatic behavior that can match strings in data to certain patterns, and automatically generate an appropriate action/behavior for that item in the UI. This technique is commonly used in e-mail applications, and is also used here for the UI logic of a wallet item display. For example, a 10-digit string where each character is a number 0-9 can be entity-extracted to represent a phone number, and the action associated is to initiate a call to that number. Because there can be false matches to the patterns, the default value is **false**, but if you know what the data and matching behavior is in your [WalletItemCustomProperty](walletitemcustomproperty.md) and you want entity-extracted behavior, set this property **true**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemcustomproperty.autodetectlinks
     * @type {Boolean} 
     */
    AutoDetectLinks {
        get => this.get_AutoDetectLinks()
        set => this.put_AutoDetectLinks(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the optional position of this property when shown in the wallet item's detail view.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemcustomproperty.detailviewposition
     * @type {Integer} 
     */
    DetailViewPosition {
        get => this.get_DetailViewPosition()
        set => this.put_DetailViewPosition(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the optional position of this property when shown in the summary view for a wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitemcustomproperty.summaryviewposition
     * @type {Integer} 
     */
    SummaryViewPosition {
        get => this.get_SummaryViewPosition()
        set => this.put_SummaryViewPosition(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IWalletItemCustomProperty")) {
            if ((queryResult := this.QueryInterface(IWalletItemCustomProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemCustomProperty := IWalletItemCustomProperty(outPtr)
        }

        return this.__IWalletItemCustomProperty.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IWalletItemCustomProperty")) {
            if ((queryResult := this.QueryInterface(IWalletItemCustomProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemCustomProperty := IWalletItemCustomProperty(outPtr)
        }

        return this.__IWalletItemCustomProperty.put_Name(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Value() {
        if (!this.HasProp("__IWalletItemCustomProperty")) {
            if ((queryResult := this.QueryInterface(IWalletItemCustomProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemCustomProperty := IWalletItemCustomProperty(outPtr)
        }

        return this.__IWalletItemCustomProperty.get_Value()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__IWalletItemCustomProperty")) {
            if ((queryResult := this.QueryInterface(IWalletItemCustomProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemCustomProperty := IWalletItemCustomProperty(outPtr)
        }

        return this.__IWalletItemCustomProperty.put_Value(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutoDetectLinks() {
        if (!this.HasProp("__IWalletItemCustomProperty")) {
            if ((queryResult := this.QueryInterface(IWalletItemCustomProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemCustomProperty := IWalletItemCustomProperty(outPtr)
        }

        return this.__IWalletItemCustomProperty.get_AutoDetectLinks()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutoDetectLinks(value) {
        if (!this.HasProp("__IWalletItemCustomProperty")) {
            if ((queryResult := this.QueryInterface(IWalletItemCustomProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemCustomProperty := IWalletItemCustomProperty(outPtr)
        }

        return this.__IWalletItemCustomProperty.put_AutoDetectLinks(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DetailViewPosition() {
        if (!this.HasProp("__IWalletItemCustomProperty")) {
            if ((queryResult := this.QueryInterface(IWalletItemCustomProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemCustomProperty := IWalletItemCustomProperty(outPtr)
        }

        return this.__IWalletItemCustomProperty.get_DetailViewPosition()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DetailViewPosition(value) {
        if (!this.HasProp("__IWalletItemCustomProperty")) {
            if ((queryResult := this.QueryInterface(IWalletItemCustomProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemCustomProperty := IWalletItemCustomProperty(outPtr)
        }

        return this.__IWalletItemCustomProperty.put_DetailViewPosition(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SummaryViewPosition() {
        if (!this.HasProp("__IWalletItemCustomProperty")) {
            if ((queryResult := this.QueryInterface(IWalletItemCustomProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemCustomProperty := IWalletItemCustomProperty(outPtr)
        }

        return this.__IWalletItemCustomProperty.get_SummaryViewPosition()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SummaryViewPosition(value) {
        if (!this.HasProp("__IWalletItemCustomProperty")) {
            if ((queryResult := this.QueryInterface(IWalletItemCustomProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItemCustomProperty := IWalletItemCustomProperty(outPtr)
        }

        return this.__IWalletItemCustomProperty.put_SummaryViewPosition(value)
    }

;@endregion Instance Methods
}
