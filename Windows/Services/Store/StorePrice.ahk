#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorePrice.ahk
#Include .\IStorePrice2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains pricing info for a product listing in the Microsoft Store.
 * @remarks
 * The [StoreAvailability.Price](storeavailability_price.md), [StoreProduct.Price](storeproduct_price.md), and [StoreSku.Price](storesku_price.md) properties return an object of this type.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeprice
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StorePrice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorePrice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorePrice.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the base price for the product with the appropriate formatting for the market of the current user.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeprice.formattedbaseprice
     * @type {HSTRING} 
     */
    FormattedBasePrice {
        get => this.get_FormattedBasePrice()
    }

    /**
     * Gets the purchase price for the product with the appropriate formatting for the market of the current user.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeprice.formattedprice
     * @type {HSTRING} 
     */
    FormattedPrice {
        get => this.get_FormattedPrice()
    }

    /**
     * Gets a value that indicates whether the product is on sale.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeprice.isonsale
     * @type {Boolean} 
     */
    IsOnSale {
        get => this.get_IsOnSale()
    }

    /**
     * Gets the end date for the sale period for the product, if the product is on sale.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeprice.saleenddate
     * @type {DateTime} 
     */
    SaleEndDate {
        get => this.get_SaleEndDate()
    }

    /**
     * Gets the ISO 4217 currency code for the market of the current user.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeprice.currencycode
     * @type {HSTRING} 
     */
    CurrencyCode {
        get => this.get_CurrencyCode()
    }

    /**
     * Gets the recurring price for the product with the appropriate formatting for the market of the current user, if recurring billing is enabled for this product.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeprice.formattedrecurrenceprice
     * @type {HSTRING} 
     */
    FormattedRecurrencePrice {
        get => this.get_FormattedRecurrencePrice()
    }

    /**
     * @type {HSTRING} 
     */
    UnformattedBasePrice {
        get => this.get_UnformattedBasePrice()
    }

    /**
     * @type {HSTRING} 
     */
    UnformattedPrice {
        get => this.get_UnformattedPrice()
    }

    /**
     * @type {HSTRING} 
     */
    UnformattedRecurrencePrice {
        get => this.get_UnformattedRecurrencePrice()
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
    get_FormattedBasePrice() {
        if (!this.HasProp("__IStorePrice")) {
            if ((queryResult := this.QueryInterface(IStorePrice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePrice := IStorePrice(outPtr)
        }

        return this.__IStorePrice.get_FormattedBasePrice()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FormattedPrice() {
        if (!this.HasProp("__IStorePrice")) {
            if ((queryResult := this.QueryInterface(IStorePrice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePrice := IStorePrice(outPtr)
        }

        return this.__IStorePrice.get_FormattedPrice()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOnSale() {
        if (!this.HasProp("__IStorePrice")) {
            if ((queryResult := this.QueryInterface(IStorePrice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePrice := IStorePrice(outPtr)
        }

        return this.__IStorePrice.get_IsOnSale()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_SaleEndDate() {
        if (!this.HasProp("__IStorePrice")) {
            if ((queryResult := this.QueryInterface(IStorePrice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePrice := IStorePrice(outPtr)
        }

        return this.__IStorePrice.get_SaleEndDate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CurrencyCode() {
        if (!this.HasProp("__IStorePrice")) {
            if ((queryResult := this.QueryInterface(IStorePrice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePrice := IStorePrice(outPtr)
        }

        return this.__IStorePrice.get_CurrencyCode()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FormattedRecurrencePrice() {
        if (!this.HasProp("__IStorePrice")) {
            if ((queryResult := this.QueryInterface(IStorePrice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePrice := IStorePrice(outPtr)
        }

        return this.__IStorePrice.get_FormattedRecurrencePrice()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnformattedBasePrice() {
        if (!this.HasProp("__IStorePrice2")) {
            if ((queryResult := this.QueryInterface(IStorePrice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePrice2 := IStorePrice2(outPtr)
        }

        return this.__IStorePrice2.get_UnformattedBasePrice()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnformattedPrice() {
        if (!this.HasProp("__IStorePrice2")) {
            if ((queryResult := this.QueryInterface(IStorePrice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePrice2 := IStorePrice2(outPtr)
        }

        return this.__IStorePrice2.get_UnformattedPrice()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnformattedRecurrencePrice() {
        if (!this.HasProp("__IStorePrice2")) {
            if ((queryResult := this.QueryInterface(IStorePrice2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePrice2 := IStorePrice2(outPtr)
        }

        return this.__IStorePrice2.get_UnformattedRecurrencePrice()
    }

;@endregion Instance Methods
}
