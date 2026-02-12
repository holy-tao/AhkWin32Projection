#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWalletItem.ahk
#Include .\IWalletItemFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!CAUTION]
  * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
  * 
  * Represents an item (data) that is stored in the wallet.
 * @remarks
 * Use the [WalletItem constructor](walletitem_walletitem_1121193137.md) if you're defining a new item to insert into the wallet. Use methods of [WalletItemStore](walletitemstore.md) such as [GetWalletItemAsync](walletitemstore_getwalletitemasync_998830941.md) or [GetItemsAsync](walletitemstore_getitemsasync_1518547059.md) if you're retrieving existing items from the wallet.
 * 
 * If you modify/set any of the properties in an existing WalletItem (including the [WalletItemCustomProperty](walletitemcustomproperty.md) values in [DisplayProperties](walletitem_displayproperties.md)), call [WalletItemStore.UpdateAsync](walletitemstore_updateasync_1403447975.md) to commit these changes to the backing store. You can see example code for this in [Quickstart: Using the   APIs](/previous-versions/windows/apps/dn631257(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem
 * @namespace Windows.ApplicationModel.Wallet
 * @version WindowsRuntime 1.4
 */
class WalletItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWalletItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWalletItem.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Initializes a new instance of the [WalletItem](walletitem.md) class.
     * @param {Integer} kind The type of wallet item.
     * @param {HSTRING} displayName The display name of the item.
     * @returns {WalletItem} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.#ctor
     */
    static CreateWalletItem(kind, displayName) {
        if (!WalletItem.HasProp("__IWalletItemFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Wallet.WalletItem")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWalletItemFactory.IID)
            WalletItem.__IWalletItemFactory := IWalletItemFactory(factoryPtr)
        }

        return WalletItem.__IWalletItemFactory.CreateWalletItem(kind, displayName)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the name or title to be displayed to the user.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets the unique identifier of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets whether this item is acknowledged by the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.isacknowledged
     * @type {Boolean} 
     */
    IsAcknowledged {
        get => this.get_IsAcknowledged()
        set => this.put_IsAcknowledged(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the issuer name of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.issuerdisplayname
     * @type {HSTRING} 
     */
    IssuerDisplayName {
        get => this.get_IssuerDisplayName()
        set => this.put_IssuerDisplayName(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the date and time the data for this item was last updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.lastupdated
     * @type {IReference<DateTime>} 
     */
    LastUpdated {
        get => this.get_LastUpdated()
        set => this.put_LastUpdated(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets the type of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the barcode that's representative of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.barcode
     * @type {WalletBarcode} 
     */
    Barcode {
        get => this.get_Barcode()
        set => this.put_Barcode(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the expiration date of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.expirationdate
     * @type {IReference<DateTime>} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
        set => this.put_ExpirationDate(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the medium (159 x 159) logo image of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.logo159x159
     * @type {IRandomAccessStreamReference} 
     */
    Logo159x159 {
        get => this.get_Logo159x159()
        set => this.put_Logo159x159(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the large (336 x 336) logo image of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.logo336x336
     * @type {IRandomAccessStreamReference} 
     */
    Logo336x336 {
        get => this.get_Logo336x336()
        set => this.put_Logo336x336(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the small (99 x 99) logo image of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.logo99x99
     * @type {IRandomAccessStreamReference} 
     */
    Logo99x99 {
        get => this.get_Logo99x99()
        set => this.put_Logo99x99(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets a string that appears next to the app name in **About** info.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.displaymessage
     * @type {HSTRING} 
     */
    DisplayMessage {
        get => this.get_DisplayMessage()
        set => this.put_DisplayMessage(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets whether to launch your app when the user taps on the [DisplayMessage](walletitem_displaymessage.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.isdisplaymessagelaunchable
     * @type {Boolean} 
     */
    IsDisplayMessageLaunchable {
        get => this.get_IsDisplayMessageLaunchable()
        set => this.put_IsDisplayMessageLaunchable(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the logo text of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.logotext
     * @type {HSTRING} 
     */
    LogoText {
        get => this.get_LogoText()
        set => this.put_LogoText(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the header color of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.headercolor
     * @type {Color} 
     */
    HeaderColor {
        get => this.get_HeaderColor()
        set => this.put_HeaderColor(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the body color of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.bodycolor
     * @type {Color} 
     */
    BodyColor {
        get => this.get_BodyColor()
        set => this.put_BodyColor(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the header font color of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.headerfontcolor
     * @type {Color} 
     */
    HeaderFontColor {
        get => this.get_HeaderFontColor()
        set => this.put_HeaderFontColor(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the body font color of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.bodyfontcolor
     * @type {Color} 
     */
    BodyFontColor {
        get => this.get_BodyFontColor()
        set => this.put_BodyFontColor(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the header background image of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.headerbackgroundimage
     * @type {IRandomAccessStreamReference} 
     */
    HeaderBackgroundImage {
        get => this.get_HeaderBackgroundImage()
        set => this.put_HeaderBackgroundImage(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the background image of the body of the wallet item (uses a stream).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.bodybackgroundimage
     * @type {IRandomAccessStreamReference} 
     */
    BodyBackgroundImage {
        get => this.get_BodyBackgroundImage()
        set => this.put_BodyBackgroundImage(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the logo image of the wallet item. Use this property for a logo that doesn't have a specified size.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.logoimage
     * @type {IRandomAccessStreamReference} 
     */
    LogoImage {
        get => this.get_LogoImage()
        set => this.put_LogoImage(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the promotional image of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.promotionalimage
     * @type {IRandomAccessStreamReference} 
     */
    PromotionalImage {
        get => this.get_PromotionalImage()
        set => this.put_PromotionalImage(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the date on which the item is valid.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.relevantdate
     * @type {IReference<DateTime>} 
     */
    RelevantDate {
        get => this.get_RelevantDate()
        set => this.put_RelevantDate(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets the description of the relevant date of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.relevantdatedisplaymessage
     * @type {HSTRING} 
     */
    RelevantDateDisplayMessage {
        get => this.get_RelevantDateDisplayMessage()
        set => this.put_RelevantDateDisplayMessage(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets the transaction history collection of the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.transactionhistory
     * @type {IMap<HSTRING, WalletTransaction>} 
     */
    TransactionHistory {
        get => this.get_TransactionHistory()
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets a collection of all relevant locations for the wallet item.
     * @remarks
     * The string key for items in this collection is usually a programmatic identifier that isn't intended for user UI. Data within a [WalletRelevantLocation](walletrelevantlocation.md) value is sometimes intended for UI.
     * 
     * Each [WalletRelevantLocation](walletrelevantlocation.md) value has a [Position](walletrelevantlocation_position.md) property to capture a [BasicGeoposition](../windows.devices.geolocation/basicgeoposition.md) value, and associates each position with a position-specific display message. You can see example code for this in [Quickstart: Using the   APIs](/previous-versions/windows/apps/dn631257(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.relevantlocations
     * @type {IMap<HSTRING, WalletRelevantLocation>} 
     */
    RelevantLocations {
        get => this.get_RelevantLocations()
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets or sets whether your app should be launched when the user taps "see more transaction history".
     * @remarks
     * For more info on using **Wallet** activation, see the "Handling app activation by Wallet " section of [Quickstart: Using the   APIs](/previous-versions/windows/apps/dn631257(v=win.10)).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.ismoretransactionhistorylaunchable
     * @type {Boolean} 
     */
    IsMoreTransactionHistoryLaunchable {
        get => this.get_IsMoreTransactionHistoryLaunchable()
        set => this.put_IsMoreTransactionHistoryLaunchable(value)
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets the collection of [WalletItemCustomProperty](walletitemcustomproperty.md) objects associated with the wallet item.
     * @remarks
     * The key for the DisplayProperties map is typically not used for the user UI. It's a programming identifier that you use to distinguish the individual custom properties. That identifier isn't part of the construction of a [WalletItemCustomProperty](walletitemcustomproperty.md); you choose it when you add one of the custom properties to the DisplayProperties collection.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.displayproperties
     * @type {IMap<HSTRING, WalletItemCustomProperty>} 
     */
    DisplayProperties {
        get => this.get_DisplayProperties()
    }

    /**
     * > [!CAUTION]
     * > The ApplicationModel.Wallet namespace is no longer supported, and will soon be deprecated. Developers are encouraged to avoid using this namespace.
     * 
     * Gets the collection of [WalletVerb](walletverb.md) objects associated with the wallet item.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.wallet.walletitem.verbs
     * @type {IMap<HSTRING, WalletVerb>} 
     */
    Verbs {
        get => this.get_Verbs()
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
    get_DisplayName() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_Id()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAcknowledged() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_IsAcknowledged()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAcknowledged(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_IsAcknowledged(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_IssuerDisplayName() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_IssuerDisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_IssuerDisplayName(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_IssuerDisplayName(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_LastUpdated() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_LastUpdated()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_LastUpdated(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_LastUpdated(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_Kind()
    }

    /**
     * 
     * @returns {WalletBarcode} 
     */
    get_Barcode() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_Barcode()
    }

    /**
     * 
     * @param {WalletBarcode} value 
     * @returns {HRESULT} 
     */
    put_Barcode(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_Barcode(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ExpirationDate() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_ExpirationDate()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_ExpirationDate(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_ExpirationDate(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Logo159x159() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_Logo159x159()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Logo159x159(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_Logo159x159(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Logo336x336() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_Logo336x336()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Logo336x336(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_Logo336x336(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_Logo99x99() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_Logo99x99()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_Logo99x99(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_Logo99x99(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayMessage() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_DisplayMessage()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayMessage(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_DisplayMessage(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisplayMessageLaunchable() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_IsDisplayMessageLaunchable()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDisplayMessageLaunchable(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_IsDisplayMessageLaunchable(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LogoText() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_LogoText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_LogoText(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_LogoText(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_HeaderColor() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_HeaderColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_HeaderColor(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_HeaderColor(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BodyColor() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_BodyColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_BodyColor(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_BodyColor(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_HeaderFontColor() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_HeaderFontColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_HeaderFontColor(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_HeaderFontColor(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BodyFontColor() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_BodyFontColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_BodyFontColor(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_BodyFontColor(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_HeaderBackgroundImage() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_HeaderBackgroundImage()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_HeaderBackgroundImage(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_HeaderBackgroundImage(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_BodyBackgroundImage() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_BodyBackgroundImage()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_BodyBackgroundImage(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_BodyBackgroundImage(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_LogoImage() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_LogoImage()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_LogoImage(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_LogoImage(value)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_PromotionalImage() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_PromotionalImage()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_PromotionalImage(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_PromotionalImage(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_RelevantDate() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_RelevantDate()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_RelevantDate(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_RelevantDate(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RelevantDateDisplayMessage() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_RelevantDateDisplayMessage()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RelevantDateDisplayMessage(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_RelevantDateDisplayMessage(value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, WalletTransaction>} 
     */
    get_TransactionHistory() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_TransactionHistory()
    }

    /**
     * 
     * @returns {IMap<HSTRING, WalletRelevantLocation>} 
     */
    get_RelevantLocations() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_RelevantLocations()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMoreTransactionHistoryLaunchable() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_IsMoreTransactionHistoryLaunchable()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsMoreTransactionHistoryLaunchable(value) {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.put_IsMoreTransactionHistoryLaunchable(value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, WalletItemCustomProperty>} 
     */
    get_DisplayProperties() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_DisplayProperties()
    }

    /**
     * 
     * @returns {IMap<HSTRING, WalletVerb>} 
     */
    get_Verbs() {
        if (!this.HasProp("__IWalletItem")) {
            if ((queryResult := this.QueryInterface(IWalletItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWalletItem := IWalletItem(outPtr)
        }

        return this.__IWalletItem.get_Verbs()
    }

;@endregion Instance Methods
}
