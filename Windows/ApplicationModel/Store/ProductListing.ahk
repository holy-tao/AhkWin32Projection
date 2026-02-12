#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProductListing.ahk
#Include .\IProductListingWithMetadata.ahk
#Include .\IProductListing2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides localized information that details an add-on (also called an in-app product or IAP).
 * @remarks
 * You access this object by picking an element of the collection that the [ProductListings](listinginformation_productlistings.md) property of the [ListingInformation](listinginformation.md) object returns.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlisting
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class ProductListing extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProductListing

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProductListing.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the product ID for the add-on that this **ProductListing** represents.
     * @remarks
     * The product ID is the string that the app uses to identify the add-on. You enter the product ID when [submitting your add-on](/windows/uwp/publish/set-your-add-on-product-id) in [Partner Center](https://partner.microsoft.com/dashboard), where it is associated with the description, price tier and lifetime. For more information, see [How to use product IDs for add-ons in your code](/windows/uwp/monetize/in-app-purchases-and-trials#how-to-use-product-ids-for-add-ons-in-your-code).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlisting.productid
     * @type {HSTRING} 
     */
    ProductId {
        get => this.get_ProductId()
    }

    /**
     * Gets the purchase price for the in-app product with the appropriate formatting for the current market.
     * @remarks
     * If the in-app product is on sale in the current market, the FormattedPrice property returns the sale price. Use the [FormattedBasePrice](productlisting_formattedbaseprice.md) property to get the default price. If the in-app product is not on sale, [FormattedBasePrice](productlisting_formattedbaseprice.md) and FormattedPrice return the same value.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlisting.formattedprice
     * @type {HSTRING} 
     */
    FormattedPrice {
        get => this.get_FormattedPrice()
    }

    /**
     * Gets the descriptive name of the add-on (also called an in-app product or IAP) that is displayed customers in the current market.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlisting.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the description for the add-on (also called an in-app product or IAP).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlisting.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets the list of keywords associated with the add-on (also called an in-app product or IAP). These strings correspond to the value of the **Keywords** field in the properties page for the add-on in [Partner Center](https://partner.microsoft.com/dashboard). These keywords are useful for filtering product lists by keyword, for example, when calling [LoadListingInformationByKeywordsAsync](currentapp_loadlistinginformationbykeywordsasync_2044666377.md).
     * @remarks
     * For more information about setting the keywords for an add-on in the dashboard, see [Enter add-on properties](/windows/uwp/publish/enter-add-on-properties).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlisting.keywords
     * @type {IIterable<HSTRING>} 
     */
    Keywords {
        get => this.get_Keywords()
    }

    /**
     * Gets the type of this add-on (also called an in-app product or IAP). Possible values are defined by [ProductType](producttype.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlisting.producttype
     * @type {Integer} 
     */
    ProductType {
        get => this.get_ProductType()
    }

    /**
     * Gets the custom developer data string (also called a tag) that contains custom information about an add-on (also called an in-app product or IAP). This string corresponds to the value of the **Custom developer data** field in the properties page for the add-on in [Partner Center](https://partner.microsoft.com/dashboard).
     * @remarks
     * The custom developer data provides a way for developers to associate custom contextual information with an add-on. For more information about setting this value for an add-on, see [Enter add-on properties](/windows/uwp/publish/enter-add-on-properties).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlisting.tag
     * @type {HSTRING} 
     */
    Tag {
        get => this.get_Tag()
    }

    /**
     * Gets the URI of the image associated with the add-on (also called an in-app product or IAP).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlisting.imageuri
     * @type {Uri} 
     */
    ImageUri {
        get => this.get_ImageUri()
    }

    /**
     * Gets the base price for the add-on (also called an in-app product or IAP) with the appropriate formatting for the current market.
     * @remarks
     * The base price is the default price for the add-on. If the add-on is on sale in the current market, use the [FormattedPrice](productlisting_formattedprice.md) property to get the sale price. If the add-on is not on sale, FormattedBasePrice and [FormattedPrice](productlisting_formattedprice.md) return the same value.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlisting.formattedbaseprice
     * @type {HSTRING} 
     */
    FormattedBasePrice {
        get => this.get_FormattedBasePrice()
    }

    /**
     * Gets the end date of the sale period for the add-on (also called an in-app product or IAP).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlisting.saleenddate
     * @type {DateTime} 
     */
    SaleEndDate {
        get => this.get_SaleEndDate()
    }

    /**
     * Gets a value that indicates whether the add-on (also called an in-app product or IAP) is on sale.
     * @remarks
     * For information about putting add-ons on sale, see [Put apps and add-ons on sale](/windows/uwp/publish/put-apps-and-add-ons-on-sale).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlisting.isonsale
     * @type {Boolean} 
     */
    IsOnSale {
        get => this.get_IsOnSale()
    }

    /**
     * Gets the currency code associated with the user's market, such as **USD** or **CAD**.
     * @remarks
     * The currency code string returned by this property conforms to ISO 4217.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlisting.currencycode
     * @type {HSTRING} 
     */
    CurrencyCode {
        get => this.get_CurrencyCode()
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
    get_ProductId() {
        if (!this.HasProp("__IProductListing")) {
            if ((queryResult := this.QueryInterface(IProductListing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductListing := IProductListing(outPtr)
        }

        return this.__IProductListing.get_ProductId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FormattedPrice() {
        if (!this.HasProp("__IProductListing")) {
            if ((queryResult := this.QueryInterface(IProductListing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductListing := IProductListing(outPtr)
        }

        return this.__IProductListing.get_FormattedPrice()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IProductListing")) {
            if ((queryResult := this.QueryInterface(IProductListing.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductListing := IProductListing(outPtr)
        }

        return this.__IProductListing.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IProductListingWithMetadata")) {
            if ((queryResult := this.QueryInterface(IProductListingWithMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductListingWithMetadata := IProductListingWithMetadata(outPtr)
        }

        return this.__IProductListingWithMetadata.get_Description()
    }

    /**
     * 
     * @returns {IIterable<HSTRING>} 
     */
    get_Keywords() {
        if (!this.HasProp("__IProductListingWithMetadata")) {
            if ((queryResult := this.QueryInterface(IProductListingWithMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductListingWithMetadata := IProductListingWithMetadata(outPtr)
        }

        return this.__IProductListingWithMetadata.get_Keywords()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProductType() {
        if (!this.HasProp("__IProductListingWithMetadata")) {
            if ((queryResult := this.QueryInterface(IProductListingWithMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductListingWithMetadata := IProductListingWithMetadata(outPtr)
        }

        return this.__IProductListingWithMetadata.get_ProductType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Tag() {
        if (!this.HasProp("__IProductListingWithMetadata")) {
            if ((queryResult := this.QueryInterface(IProductListingWithMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductListingWithMetadata := IProductListingWithMetadata(outPtr)
        }

        return this.__IProductListingWithMetadata.get_Tag()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_ImageUri() {
        if (!this.HasProp("__IProductListingWithMetadata")) {
            if ((queryResult := this.QueryInterface(IProductListingWithMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductListingWithMetadata := IProductListingWithMetadata(outPtr)
        }

        return this.__IProductListingWithMetadata.get_ImageUri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FormattedBasePrice() {
        if (!this.HasProp("__IProductListing2")) {
            if ((queryResult := this.QueryInterface(IProductListing2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductListing2 := IProductListing2(outPtr)
        }

        return this.__IProductListing2.get_FormattedBasePrice()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_SaleEndDate() {
        if (!this.HasProp("__IProductListing2")) {
            if ((queryResult := this.QueryInterface(IProductListing2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductListing2 := IProductListing2(outPtr)
        }

        return this.__IProductListing2.get_SaleEndDate()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOnSale() {
        if (!this.HasProp("__IProductListing2")) {
            if ((queryResult := this.QueryInterface(IProductListing2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductListing2 := IProductListing2(outPtr)
        }

        return this.__IProductListing2.get_IsOnSale()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CurrencyCode() {
        if (!this.HasProp("__IProductListing2")) {
            if ((queryResult := this.QueryInterface(IProductListing2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductListing2 := IProductListing2(outPtr)
        }

        return this.__IProductListing2.get_CurrencyCode()
    }

;@endregion Instance Methods
}
