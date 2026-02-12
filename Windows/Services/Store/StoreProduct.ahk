#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreProduct.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a product that is available in the Microsoft Store.
 * @remarks
 * Products in the Store are organized in a hierarcy of *product*, *SKU*, and *availability* objects. Products are represented by **StoreProduct** objects. The SKUs for each product are represented by [StoreSku](storesku.md) objects, and the availabilities for each SKU are represented by [StoreAvailability](storeavailability.md) objects. For more information, see [In-app purchases and trials](/windows/uwp/monetize/in-app-purchases-and-trials).
 * 
 * To retrieve a **StoreProduct** object for the current app, use the [GetStoreProductForCurrentAppAsync](storecontext_getstoreproductforcurrentappasync_128036649.md) method. 
 * 
 * To retrieve **StoreProduct** objects for products that can be purchased from within the current app, use these methods.
 * + [GetAssociatedStoreProductsAsync](storecontext_getassociatedstoreproductsasync_1833928682.md)
 * + [GetAssociatedStoreProductsWithPagingAsync](storecontext_getassociatedstoreproductswithpagingasync_35867193.md)
 * + [GetStoreProductsAsync](storecontext_getstoreproductsasync_1035651645.md)
 * + [GetUserCollectionAsync](storecontext_getusercollectionasync_822351662.md)
 * + [GetUserCollectionWithPagingAsync](storecontext_getusercollectionwithpagingasync_1326616908.md)
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreProduct extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreProduct

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreProduct.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Store ID for this product.
     * @remarks
     * For an app, this property corresponds to the Store ID that is available on the **App identity** page for the app in [Partner Center](https://partner.microsoft.com/dashboard). For more information, see [View app identity details](/windows/uwp/publish/view-app-identity-details).
     * 
     * For an add-on, this property corresponds to the Store ID that is available on the overview page for the add-on in [Partner Center](https://partner.microsoft.com/dashboard).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.storeid
     * @type {HSTRING} 
     */
    StoreId {
        get => this.get_StoreId()
    }

    /**
     * Gets the language for the data in the Microsoft Store listing for the product.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * Gets the product title from the Microsoft Store listing.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * Gets the product description from the Microsoft Store listing.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets the type of the product. These values are currently supported: **Application**, **Game**, **Consumable**, **UnmanagedConsumable**, and **Durable**.
     * @remarks
     * The following table provides definitions for the currently supported values. Additional values may be supported in the future.
     * 
     * | String value | Description |
     * |---|---|
     * | **Application** | An app that belongs to any category other than **Games**. For more info, see [Category and subcategory table](/windows/uwp/publish/category-and-subcategory-table). |
     * | **Game** | An app that belongs to the **Games** category. For more info, see [Category and subcategory table](/windows/uwp/publish/category-and-subcategory-table). |
     * | **Consumable** | A Store-managed consumable add-on that can be purchased, used, and purchased again. Microsoft keeps track of the user's balance for these types of add-ons. |
     * | **UnmanagedConsumable** | A developer-managed consumable add-on that can be purchased, used, and purchased again. Microsoft does not keep track of the user's balance for these types of add-ons; the developer is responsible for keeping track of the user's balance. |
     * | **Durable** | An add-on that persists for the lifetime that you specify in [Partner Center](https://partner.microsoft.com/dashboard). By default, durable add-ons never expire, in which case they can only be purchased once. If you specify a particular duration for the add-on, the user can repurchase the add-on after it expires.<br/>**Note**&nbsp;&nbsp;A **StoreProduct** that represents a [subscription add-on](/windows/uwp/monetize/enable-subscription-add-ons-for-your-app) has the type **Durable**.   |
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.productkind
     * @type {HSTRING} 
     */
    ProductKind {
        get => this.get_ProductKind()
    }

    /**
     * Gets a value that indicates whether the product has optional downloadable content (DLC).
     * @remarks
     * > [!NOTE]
     * > Downloadable content (DLC) packages are not available to all developer accounts.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.hasdigitaldownload
     * @type {Boolean} 
     */
    HasDigitalDownload {
        get => this.get_HasDigitalDownload()
    }

    /**
     * Gets the keywords that are associated with the product in [Partner Center](https://partner.microsoft.com/dashboard). This property only applies to **StoreProduct** objects that represent add-ons. These strings correspond to the value of the **Keywords** field in the properties page for the add-on in Partner Center.
     * @remarks
     * For more information about setting the keywords for an add-on in the dashboard, see [Enter add-on properties](/windows/uwp/publish/enter-add-on-properties).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.keywords
     * @type {IVectorView<HSTRING>} 
     */
    Keywords {
        get => this.get_Keywords()
    }

    /**
     * Gets the images from the Windows Store listing for the product.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.images
     * @type {IVectorView<StoreImage>} 
     */
    Images {
        get => this.get_Images()
    }

    /**
     * Gets the videos from the Windows Store listing for the product.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.videos
     * @type {IVectorView<StoreVideo>} 
     */
    Videos {
        get => this.get_Videos()
    }

    /**
     * Gets the list of available SKUs for the product.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.skus
     * @type {IVectorView<StoreSku>} 
     */
    Skus {
        get => this.get_Skus()
    }

    /**
     * Gets a value that indicates whether the current user has an entitlement to use the default SKU of the product.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.isinusercollection
     * @type {Boolean} 
     */
    IsInUserCollection {
        get => this.get_IsInUserCollection()
    }

    /**
     * Gets the price for the default SKU and availability for the product.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.price
     * @type {StorePrice} 
     */
    Price {
        get => this.get_Price()
    }

    /**
     * Gets complete data for the product from the Store in JSON format.
     * @remarks
     * Use the **ExtendedJsonData** property to access the complete data for the [StoreProduct](storeproduct.md) object as a JSON-formatted string in your code. For more information about the structure of the data, see [Data schemas for Store products](/windows/uwp/monetize/data-schemas-for-store-products).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.extendedjsondata
     * @type {HSTRING} 
     */
    ExtendedJsonData {
        get => this.get_ExtendedJsonData()
    }

    /**
     * Gets the URI to the Microsoft Store listing for the product.
     * @remarks
     * An example URI is **https://www.microsoft.com/store/apps/&lt;Store ID for the product&gt;**. If there is no listing page for the product, this link resolves to the Microsoft Store home page.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.linkuri
     * @type {Uri} 
     */
    LinkUri {
        get => this.get_LinkUri()
    }

    /**
     * Gets the product ID for this product, if the current [StoreProduct](storeproduct.md) represents an add-on.
     * @remarks
     * If the current [StoreProduct](storeproduct.md) represents an add-on, this property returns the product ID that you gave the add-on when you [submitted the add-on](/windows/uwp/publish/set-your-add-on-product-id) in [Partner Center](https://partner.microsoft.com/dashboard). For more information, see [How to use product IDs for add-ons in your code](/windows/uwp/monetize/in-app-purchases-and-trials#how-to-use-product-ids-for-add-ons-in-your-code).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.inappoffertoken
     * @type {HSTRING} 
     */
    InAppOfferToken {
        get => this.get_InAppOfferToken()
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
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.get_StoreId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.get_Language()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.get_Title()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.get_Description()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProductKind() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.get_ProductKind()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasDigitalDownload() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.get_HasDigitalDownload()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Keywords() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.get_Keywords()
    }

    /**
     * 
     * @returns {IVectorView<StoreImage>} 
     */
    get_Images() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.get_Images()
    }

    /**
     * 
     * @returns {IVectorView<StoreVideo>} 
     */
    get_Videos() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.get_Videos()
    }

    /**
     * 
     * @returns {IVectorView<StoreSku>} 
     */
    get_Skus() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.get_Skus()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInUserCollection() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.get_IsInUserCollection()
    }

    /**
     * 
     * @returns {StorePrice} 
     */
    get_Price() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.get_Price()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExtendedJsonData() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.get_ExtendedJsonData()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_LinkUri() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.get_LinkUri()
    }

    /**
     * Indicates whether any SKU of this product is installed on the current device. This method is intended to be used for products that have downloadable content (DLC).
     * @remarks
     * To determine whether the product has downloadable content, use the [HasDigitalDownload](storeproduct_hasdigitaldownload.md) property.
     * 
     * > [!NOTE]
     * > Downloadable content (DLC) packages are not available to all developer accounts.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.getisanyskuinstalledasync
     */
    GetIsAnySkuInstalledAsync() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.GetIsAnySkuInstalledAsync()
    }

    /**
     * Requests the purchase of the default SKU and availability for the product and displays the UI that is used to complete the transaction via the Microsoft Store. This method provides the option to specify additional details for a specific offer within a large catalog of products that are represented by a single listing in the Microsoft Store, including the product name to display to the user during the purchase.
     * 
     * > [!IMPORTANT]
     * > This method must be called on the UI thread.
     * 
     * > [!IMPORTANT]
     * > In-app purchase functionality is not supported in evelated applications.
     * @returns {IAsyncOperation<StorePurchaseResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.requestpurchaseasync
     */
    RequestPurchaseAsync() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.RequestPurchaseAsync()
    }

    /**
     * Requests the purchase of the default SKU and availability for the product and displays the UI that is used to complete the transaction via the Microsoft Store.
     * 
     * > [!IMPORTANT]
     * > This method must be called on the UI thread.
     * 
     * > [!IMPORTANT]
     * > In-app purchase functionality is not supported in evelated applications.
     * @param {StorePurchaseProperties} storePurchaseProperties_ 
     * @returns {IAsyncOperation<StorePurchaseResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproduct.requestpurchaseasync
     */
    RequestPurchaseWithPurchasePropertiesAsync(storePurchaseProperties_) {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.RequestPurchaseWithPurchasePropertiesAsync(storePurchaseProperties_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InAppOfferToken() {
        if (!this.HasProp("__IStoreProduct")) {
            if ((queryResult := this.QueryInterface(IStoreProduct.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProduct := IStoreProduct(outPtr)
        }

        return this.__IStoreProduct.get_InAppOfferToken()
    }

;@endregion Instance Methods
}
