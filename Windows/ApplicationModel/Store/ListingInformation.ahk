#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IListingInformation.ahk
#Include .\IListingInformation2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the listing info that describes the app in the Microsoft Store.
 * @remarks
 * The info that this object returns comes from the listing info you enter when you submit the app to the Microsoft Store.
 * 
 * You access this object through the [LoadListingInformationAsync](currentappsimulator_loadlistinginformationasync_1372253086.md) method of the [CurrentAppSimulator](currentappsimulator.md) object during testing, or the [LoadListingInformationAsync](currentapp_loadlistinginformationasync_1372253086.md) method of the [CurrentApp](currentapp.md) object when the app is distributed through the Microsoft Store.
 * 
 * > [!NOTE]
 * > The [CurrentApp](currentapp.md) object obtains its data from the Microsoft Store, so you must have a Microsoft Store developer account and the app must be published in the Microsoft Store. If you don't have a Microsoft Store developer account, you can test the functions of this class by using the [CurrentAppSimulator](currentappsimulator.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.listinginformation
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class ListingInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IListingInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IListingInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the country code associated with the user's location, such as **US** or **CA**, that is used to identify their market for transactions in the current session.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.listinginformation.currentmarket
     * @type {HSTRING} 
     */
    CurrentMarket {
        get => this.get_CurrentMarket()
    }

    /**
     * Gets the app's description in the current market.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.listinginformation.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Gets information about add-ons (also called in-app products or IAPs) available for purchase.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.listinginformation.productlistings
     * @type {IMapView<HSTRING, ProductListing>} 
     */
    ProductListings {
        get => this.get_ProductListings()
    }

    /**
     * Gets the app's purchase price formatted for the current market and currency.
     * @remarks
     * If the app is on sale in the current market, the **FormattedPrice** property returns the sale price. Use the [FormattedBasePrice](listinginformation_formattedbaseprice.md) property to get the default price. If the app is not on sale, [FormattedBasePrice](listinginformation_formattedbaseprice.md) and **FormattedPrice** return the same value.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.listinginformation.formattedprice
     * @type {HSTRING} 
     */
    FormattedPrice {
        get => this.get_FormattedPrice()
    }

    /**
     * Gets the app's name in the current market.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.listinginformation.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the age rating for the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.listinginformation.agerating
     * @type {Integer} 
     */
    AgeRating {
        get => this.get_AgeRating()
    }

    /**
     * Gets the app's base price formatted for the current market and currency.
     * @remarks
     * The base price is the default price for the app. If the app is on sale in the current market, use the [FormattedPrice](listinginformation_formattedprice.md) property to get the sale price. If the app is not on sale, FormattedBasePrice and [FormattedPrice](listinginformation_formattedprice.md) return the same value.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.listinginformation.formattedbaseprice
     * @type {HSTRING} 
     */
    FormattedBasePrice {
        get => this.get_FormattedBasePrice()
    }

    /**
     * Gets the end date of the sale period for the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.listinginformation.saleenddate
     * @type {DateTime} 
     */
    SaleEndDate {
        get => this.get_SaleEndDate()
    }

    /**
     * Gets a value that indicates whether the app is on sale.
     * @remarks
     * For information about putting apps on sale, see [Put apps and add-ons on sale](/windows/uwp/publish/put-apps-and-add-ons-on-sale).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.listinginformation.isonsale
     * @type {Boolean} 
     */
    IsOnSale {
        get => this.get_IsOnSale()
    }

    /**
     * Gets the currency code associated with the user's market, such as **USD** or **CAD**.
     * @remarks
     * The currency code string returned by this property conforms to ISO 4217.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.listinginformation.currencycode
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
    get_CurrentMarket() {
        if (!this.HasProp("__IListingInformation")) {
            if ((queryResult := this.QueryInterface(IListingInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListingInformation := IListingInformation(outPtr)
        }

        return this.__IListingInformation.get_CurrentMarket()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IListingInformation")) {
            if ((queryResult := this.QueryInterface(IListingInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListingInformation := IListingInformation(outPtr)
        }

        return this.__IListingInformation.get_Description()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, ProductListing>} 
     */
    get_ProductListings() {
        if (!this.HasProp("__IListingInformation")) {
            if ((queryResult := this.QueryInterface(IListingInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListingInformation := IListingInformation(outPtr)
        }

        return this.__IListingInformation.get_ProductListings()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FormattedPrice() {
        if (!this.HasProp("__IListingInformation")) {
            if ((queryResult := this.QueryInterface(IListingInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListingInformation := IListingInformation(outPtr)
        }

        return this.__IListingInformation.get_FormattedPrice()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IListingInformation")) {
            if ((queryResult := this.QueryInterface(IListingInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListingInformation := IListingInformation(outPtr)
        }

        return this.__IListingInformation.get_Name()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AgeRating() {
        if (!this.HasProp("__IListingInformation")) {
            if ((queryResult := this.QueryInterface(IListingInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListingInformation := IListingInformation(outPtr)
        }

        return this.__IListingInformation.get_AgeRating()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FormattedBasePrice() {
        if (!this.HasProp("__IListingInformation2")) {
            if ((queryResult := this.QueryInterface(IListingInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListingInformation2 := IListingInformation2(outPtr)
        }

        return this.__IListingInformation2.get_FormattedBasePrice()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_SaleEndDate() {
        if (!this.HasProp("__IListingInformation2")) {
            if ((queryResult := this.QueryInterface(IListingInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListingInformation2 := IListingInformation2(outPtr)
        }

        return this.__IListingInformation2.get_SaleEndDate()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOnSale() {
        if (!this.HasProp("__IListingInformation2")) {
            if ((queryResult := this.QueryInterface(IListingInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListingInformation2 := IListingInformation2(outPtr)
        }

        return this.__IListingInformation2.get_IsOnSale()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CurrencyCode() {
        if (!this.HasProp("__IListingInformation2")) {
            if ((queryResult := this.QueryInterface(IListingInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IListingInformation2 := IListingInformation2(outPtr)
        }

        return this.__IListingInformation2.get_CurrencyCode()
    }

;@endregion Instance Methods
}
