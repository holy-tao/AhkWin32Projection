#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreSku.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides info for a stock keeping unit (SKU) of a product in the Microsoft Store.
 * @remarks
 * A SKU is a code that uniquely identifies a particular version of a product or service. It is a very common term used in the field of inventory management. Products in the Store are organized in a hierarcy of *product*, *SKU*, and *availability* objects. Products are represented by [StoreProduct](storeproduct.md) objects. The SKUs for each product are represented by **StoreSku** objects, and the availabilities for each SKU are represented by [StoreAvailability](storeavailability.md) objects. For more information, see [In-app purchases and trials](/windows/uwp/monetize/in-app-purchases-and-trials).
 * 
 * To access the SKUs for a product, use the [Skus](storeproduct_skus.md) property of the [StoreProduct](storeproduct.md) for the product in which you are interested.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreSku extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreSku

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreSku.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Store ID of this product SKU.
     * @remarks
     * The Store ID returned by this property has the format *&lt;product Store ID&gt;/&lt;SKU Store ID&gt;*, where: 
     * + *&lt;product Store ID&gt;* is a 12-character alpha-numeric string, such as 9NBLGGH69M0B. This Store ID is available in [Partner Center](https://partner.microsoft.com/dashboard), and it is returned by the [StoreId](storeproduct_storeid.md) property of the related [StoreProduct](storeproduct.md) object.
     * + *&lt;SKU Store ID&gt;* is a 4-character alpha-numeric string that identifies the SKU.
     * An example complete Store ID returned by this property is 9NBLGGH69M0B/000N.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.storeid
     * @type {HSTRING} 
     */
    StoreId {
        get => this.get_StoreId()
    }

    /**
     * Gets the language for the data in the Microsoft Store listing for the product SKU.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * Gets the product SKU title from the Microsoft Store listing.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * Gets the product SKU description from the Microsoft Store listing.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets a value that indicates whether the current product SKU is a trial SKU.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.istrial
     * @type {Boolean} 
     */
    IsTrial {
        get => this.get_IsTrial()
    }

    /**
     * Gets the custom developer data string (also called a tag) that contains custom information about the add-on that this product SKU represents. This string corresponds to the value of the **Custom developer data** field in the properties page for the add-on in [Partner Center](https://partner.microsoft.com/dashboard).
     * @remarks
     * The custom developer data provides a way for developers to associate custom contextual information with an add-on. For more information about setting this value for an add-on, see [Enter add-on properties](/windows/uwp/publish/enter-add-on-properties).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.customdeveloperdata
     * @type {HSTRING} 
     */
    CustomDeveloperData {
        get => this.get_CustomDeveloperData()
    }

    /**
     * Gets the images from the Microsoft Store listing for the product SKU.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.images
     * @type {IVectorView<StoreImage>} 
     */
    Images {
        get => this.get_Images()
    }

    /**
     * Gets the videos from the Microsoft Store listing for the product SKU.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.videos
     * @type {IVectorView<StoreVideo>} 
     */
    Videos {
        get => this.get_Videos()
    }

    /**
     * Gets the availabilities for the current product SKU. Each product SKU can have one or more availabilities that have different prices.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.availabilities
     * @type {IVectorView<StoreAvailability>} 
     */
    Availabilities {
        get => this.get_Availabilities()
    }

    /**
     * Gets the price of the default availability for this product SKU.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.price
     * @type {StorePrice} 
     */
    Price {
        get => this.get_Price()
    }

    /**
     * Gets complete data for the current product SKU from the Store in JSON format.
     * @remarks
     * Use the **ExtendedJsonData** property to access the complete data for the [StoreSku](storesku.md) object as a JSON-formatted string in your code. For more information about the structure of the data, see [Data schemas for Store products](/windows/uwp/monetize/data-schemas-for-store-products).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.extendedjsondata
     * @type {HSTRING} 
     */
    ExtendedJsonData {
        get => this.get_ExtendedJsonData()
    }

    /**
     * Gets a value that indicates whether the current user has an entitlement to use the current product SKU.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.isinusercollection
     * @type {Boolean} 
     */
    IsInUserCollection {
        get => this.get_IsInUserCollection()
    }

    /**
     * Gets the list of Store IDs for the apps or add-ons that are bundled with this product SKU.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.bundledskus
     * @type {IVectorView<HSTRING>} 
     */
    BundledSkus {
        get => this.get_BundledSkus()
    }

    /**
     * Gets additional data for the current product SKU, if the user has an entitlement to use the SKU.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.collectiondata
     * @type {StoreCollectionData} 
     */
    CollectionData {
        get => this.get_CollectionData()
    }

    /**
     * Gets a value that indicates whether the current product SKU is a subscription with recurring billing. For more information about the subscription, see the [SubscriptionInfo](storesku_subscriptioninfo.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.issubscription
     * @type {Boolean} 
     */
    IsSubscription {
        get => this.get_IsSubscription()
    }

    /**
     * Gets subscription information for this product SKU, if this product SKU is a subscription with recurring billing. To determine whether this product SKU is a subscription, use the [IsSubscription](storesku_issubscription.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.subscriptioninfo
     * @type {StoreSubscriptionInfo} 
     */
    SubscriptionInfo {
        get => this.get_SubscriptionInfo()
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
    get_StoreId() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_StoreId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_Language()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_Title()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_Description()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTrial() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_IsTrial()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CustomDeveloperData() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_CustomDeveloperData()
    }

    /**
     * 
     * @returns {IVectorView<StoreImage>} 
     */
    get_Images() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_Images()
    }

    /**
     * 
     * @returns {IVectorView<StoreVideo>} 
     */
    get_Videos() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_Videos()
    }

    /**
     * 
     * @returns {IVectorView<StoreAvailability>} 
     */
    get_Availabilities() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_Availabilities()
    }

    /**
     * 
     * @returns {StorePrice} 
     */
    get_Price() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_Price()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExtendedJsonData() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_ExtendedJsonData()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInUserCollection() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_IsInUserCollection()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_BundledSkus() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_BundledSkus()
    }

    /**
     * 
     * @returns {StoreCollectionData} 
     */
    get_CollectionData() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_CollectionData()
    }

    /**
     * Indicates whether this product SKU is installed on the current device.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.getisinstalledasync
     */
    GetIsInstalledAsync() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.GetIsInstalledAsync()
    }

    /**
     * Requests the purchase of the product SKU and displays the UI that is used to complete the transaction via the Microsoft Store. This method provides the option to specify additional details for a specific offer within a large catalog of products that are represented by a single listing in the Microsoft Store, including the product name to display to the user during the purchase.
     * 
     * > [!IMPORTANT]
     * > This method must be called on the UI thread.
     * 
     * > [!IMPORTANT]
     * > In-app purchase functionality is not supported in evelated applications.
     * @returns {IAsyncOperation<StorePurchaseResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.requestpurchaseasync
     */
    RequestPurchaseAsync() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.RequestPurchaseAsync()
    }

    /**
     * Requests the purchase of the product SKU and displays the UI that is used to complete the transaction via the Windows Store.
     * 
     * > [!IMPORTANT]
     * > This method must be called on the UI thread.
     * 
     * > [!IMPORTANT]
     * > In-app purchase functionality is not supported in evelated applications.
     * @param {StorePurchaseProperties} storePurchaseProperties_ 
     * @returns {IAsyncOperation<StorePurchaseResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesku.requestpurchaseasync
     */
    RequestPurchaseWithPurchasePropertiesAsync(storePurchaseProperties_) {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.RequestPurchaseWithPurchasePropertiesAsync(storePurchaseProperties_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSubscription() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_IsSubscription()
    }

    /**
     * 
     * @returns {StoreSubscriptionInfo} 
     */
    get_SubscriptionInfo() {
        if (!this.HasProp("__IStoreSku")) {
            if ((queryResult := this.QueryInterface(IStoreSku.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSku := IStoreSku(outPtr)
        }

        return this.__IStoreSku.get_SubscriptionInfo()
    }

;@endregion Instance Methods
}
