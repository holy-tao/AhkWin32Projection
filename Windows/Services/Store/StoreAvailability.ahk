#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreAvailability.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a specific instance of a product SKU that can be purchased.
 * @remarks
 * Products in the Store are organized in a hierarcy of *product*, *SKU*, and *availability* objects. Products are represented by [StoreProduct](storeproduct.md) objects. The SKUs for each product are represented by [StoreSku](storesku.md) objects, and the availabilities for each SKU are represented by **StoreAvailability** objects. For more information, see [In-app purchases and trials](/windows/uwp/monetize/in-app-purchases-and-trials).
 * 
 * To access the availabilities for a SKU, use the [Availabilities](storesku_availabilities.md) property of the [StoreSku](storesku.md) object in which you are interested.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeavailability
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreAvailability extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreAvailability

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreAvailability.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Store ID of the current SKU availability from the Microsoft Store catalog.
     * @remarks
     * The Store ID returned by this property has the format *&lt;product Store ID&gt;/&lt;SKU Store ID&gt;/&lt;availability Store ID&gt;*, where: 
     * + *&lt;product Store ID&gt;* is a 12-character alpha-numeric string, such as 9NBLGGH69M0B. This Store ID is available in [Partner Center](https://partner.microsoft.com/dashboard), and it is returned by the [StoreId](storeproduct_storeid.md) property of the related [StoreProduct](storeproduct.md) object.
     * + *&lt;SKU Store ID&gt;* is a 4-character alpha-numeric string that identifies the SKU.
     * + *&lt;availability Store ID&gt;* is a 12-character alpha-numeric string that identifies the availability.
     * An example complete Store ID returned by this property is 9NBLGGH69M0B/000N/4KW6QZD2VN6X.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeavailability.storeid
     * @type {HSTRING} 
     */
    StoreId {
        get => this.get_StoreId()
    }

    /**
     * Gets the end date for the current SKU availability.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeavailability.enddate
     * @type {DateTime} 
     */
    EndDate {
        get => this.get_EndDate()
    }

    /**
     * Gets price info for the current SKU availability, including the base price, current price, and sale info.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeavailability.price
     * @type {StorePrice} 
     */
    Price {
        get => this.get_Price()
    }

    /**
     * Gets complete data for the current SKU availability from the Store in JSON format.
     * @remarks
     * Use the **ExtendedJsonData** property to access the complete data for the [StoreAvailability](storeavailability.md) object as a JSON-formatted string in your code. For more information about the structure of the data, see [Data schemas for Store products](/windows/uwp/monetize/data-schemas-for-store-products).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeavailability.extendedjsondata
     * @type {HSTRING} 
     */
    ExtendedJsonData {
        get => this.get_ExtendedJsonData()
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
        if (!this.HasProp("__IStoreAvailability")) {
            if ((queryResult := this.QueryInterface(IStoreAvailability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAvailability := IStoreAvailability(outPtr)
        }

        return this.__IStoreAvailability.get_StoreId()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_EndDate() {
        if (!this.HasProp("__IStoreAvailability")) {
            if ((queryResult := this.QueryInterface(IStoreAvailability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAvailability := IStoreAvailability(outPtr)
        }

        return this.__IStoreAvailability.get_EndDate()
    }

    /**
     * 
     * @returns {StorePrice} 
     */
    get_Price() {
        if (!this.HasProp("__IStoreAvailability")) {
            if ((queryResult := this.QueryInterface(IStoreAvailability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAvailability := IStoreAvailability(outPtr)
        }

        return this.__IStoreAvailability.get_Price()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExtendedJsonData() {
        if (!this.HasProp("__IStoreAvailability")) {
            if ((queryResult := this.QueryInterface(IStoreAvailability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAvailability := IStoreAvailability(outPtr)
        }

        return this.__IStoreAvailability.get_ExtendedJsonData()
    }

    /**
     * Requests the purchase of the current SKU availability and displays the UI that is used to complete the transaction via the Microsoft Store. This method provides the option to specify additional details for a specific offer within a large catalog of products that are represented by a single listing in the Microsoft Store, including the product name to display to the user during the purchase.
     * 
     * > [!IMPORTANT]
     * > This method must be called on the UI thread.
     * 
     * > [!IMPORTANT]
     * > In-app purchase functionality is not supported in evelated applications.
     * @returns {IAsyncOperation<StorePurchaseResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeavailability.requestpurchaseasync
     */
    RequestPurchaseAsync() {
        if (!this.HasProp("__IStoreAvailability")) {
            if ((queryResult := this.QueryInterface(IStoreAvailability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAvailability := IStoreAvailability(outPtr)
        }

        return this.__IStoreAvailability.RequestPurchaseAsync()
    }

    /**
     * Requests the purchase of the current SKU availability and displays the UI that is used to complete the transaction via the Microsoft Store.
     * 
     * > [!IMPORTANT]
     * > This method must be called on the UI thread.
     * 
     * > [!IMPORTANT]
     * > In-app purchase functionality is not supported in evelated applications.
     * @param {StorePurchaseProperties} storePurchaseProperties_ 
     * @returns {IAsyncOperation<StorePurchaseResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeavailability.requestpurchaseasync
     */
    RequestPurchaseWithPurchasePropertiesAsync(storePurchaseProperties_) {
        if (!this.HasProp("__IStoreAvailability")) {
            if ((queryResult := this.QueryInterface(IStoreAvailability.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAvailability := IStoreAvailability(outPtr)
        }

        return this.__IStoreAvailability.RequestPurchaseWithPurchasePropertiesAsync(storePurchaseProperties_)
    }

;@endregion Instance Methods
}
