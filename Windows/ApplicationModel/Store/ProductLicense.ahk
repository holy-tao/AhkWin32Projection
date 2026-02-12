#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProductLicense.ahk
#Include .\IProductLicenseWithFulfillment.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides info about a license that is associated with an add-on (also called an in-app product or IAP).
 * @remarks
 * The [ProductLicenses](licenseinformation_productlicenses.md) property of the [LicenseInformation](licenseinformation.md) object contains one or more instances of this object.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlicense
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class ProductLicense extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProductLicense

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProductLicense.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of an add-on (also called an in-app product or IAP). This ID is used by the app to get info about the product or feature that is enabled when the customer buys it through an in-app purchase.
     * @remarks
     * The product ID is the string that the app uses to identify the add-on. You enter the product ID when [submitting your add-on](/windows/uwp/publish/set-your-add-on-product-id) in Partner Center, where it is associated with the description, price tier and lifetime. For more information, see [How to use product IDs for add-ons in your code](/windows/uwp/monetize/in-app-purchases-and-trials#how-to-use-product-ids-for-add-ons-in-your-code).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlicense.productid
     * @type {HSTRING} 
     */
    ProductId {
        get => this.get_ProductId()
    }

    /**
     * Indicates if the add-on (also called an in-app product or IAP) license is currently active.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlicense.isactive
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * Gets the current expiration date and time of the add-on (also called an in-app product or IAP) license.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlicense.expirationdate
     * @type {DateTime} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
    }

    /**
     * Indicates if the add-on (also called an in-app product or IAP) is consumable. A consumable add-on can be purchased, used, and purchased again.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productlicense.isconsumable
     * @type {Boolean} 
     */
    IsConsumable {
        get => this.get_IsConsumable()
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
        if (!this.HasProp("__IProductLicense")) {
            if ((queryResult := this.QueryInterface(IProductLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductLicense := IProductLicense(outPtr)
        }

        return this.__IProductLicense.get_ProductId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        if (!this.HasProp("__IProductLicense")) {
            if ((queryResult := this.QueryInterface(IProductLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductLicense := IProductLicense(outPtr)
        }

        return this.__IProductLicense.get_IsActive()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ExpirationDate() {
        if (!this.HasProp("__IProductLicense")) {
            if ((queryResult := this.QueryInterface(IProductLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductLicense := IProductLicense(outPtr)
        }

        return this.__IProductLicense.get_ExpirationDate()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConsumable() {
        if (!this.HasProp("__IProductLicenseWithFulfillment")) {
            if ((queryResult := this.QueryInterface(IProductLicenseWithFulfillment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProductLicenseWithFulfillment := IProductLicenseWithFulfillment(outPtr)
        }

        return this.__IProductLicenseWithFulfillment.get_IsConsumable()
    }

;@endregion Instance Methods
}
