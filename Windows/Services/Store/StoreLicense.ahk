#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreLicense.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides license info for a durable add-on that is associated with the current app.
 * @remarks
 * To retrieve StoreLicense objects for the durable add-ons for the current app, use the [StoreAppLicense.AddOnLicenses](storeapplicense_addonlicenses.md) property. This property contains only the add-on licenses that are still valid and provide the current user with an entitlement to use the add-on. When an add-on license expires or is longer valid, it will no longer be available in the [StoreAppLicense.AddOnLicenses](storeapplicense_addonlicenses.md) collection.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storelicense
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreLicense extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreLicense

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreLicense.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Store ID of the licensed add-on SKU from the Microsoft Store catalog.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storelicense.skustoreid
     * @type {HSTRING} 
     */
    SkuStoreId {
        get => this.get_SkuStoreId()
    }

    /**
     * This property is reserved for future use, and it is not intended to be used in the current release. Currently, it always returns true.
     * @remarks
     * The license for a durable add-on is valid and provides the current user with an entitlement to use the add-on if the [StoreLicense](storelicense.md) object is included in the collection returned by the [StoreAppLicense.AddOnLicenses](storeapplicense_addonlicenses.md) property. When the add-on license expires or is no longer valid, it will no longer be available in the [StoreAppLicense.AddOnLicenses](storeapplicense_addonlicenses.md) collection.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storelicense.isactive
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * Gets the expiration date and time for the add-on license.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storelicense.expirationdate
     * @type {DateTime} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
    }

    /**
     * Gets complete license data in JSON format.
     * @remarks
     * Use the **ExtendedJsonData** property to access the complete data for the [StoreLicense](storelicense.md) object as a JSON-formatted string in your code. For more information about the structure of the data, see [Data schemas for Store products](/windows/uwp/monetize/data-schemas-for-store-products).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storelicense.extendedjsondata
     * @type {HSTRING} 
     */
    ExtendedJsonData {
        get => this.get_ExtendedJsonData()
    }

    /**
     * Gets in the product ID for the add-on.
     * @remarks
     * This property returns the product ID that you gave the add-on when you [submitted the add-on](/windows/uwp/publish/set-your-add-on-product-id) in [Partner Center](https://partner.microsoft.com/dashboard). For more information, see [How to use product IDs for add-ons in your code](/windows/uwp/monetize/in-app-purchases-and-trials#how-to-use-product-ids-for-add-ons-in-your-code).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storelicense.inappoffertoken
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
    get_SkuStoreId() {
        if (!this.HasProp("__IStoreLicense")) {
            if ((queryResult := this.QueryInterface(IStoreLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreLicense := IStoreLicense(outPtr)
        }

        return this.__IStoreLicense.get_SkuStoreId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        if (!this.HasProp("__IStoreLicense")) {
            if ((queryResult := this.QueryInterface(IStoreLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreLicense := IStoreLicense(outPtr)
        }

        return this.__IStoreLicense.get_IsActive()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ExpirationDate() {
        if (!this.HasProp("__IStoreLicense")) {
            if ((queryResult := this.QueryInterface(IStoreLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreLicense := IStoreLicense(outPtr)
        }

        return this.__IStoreLicense.get_ExpirationDate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExtendedJsonData() {
        if (!this.HasProp("__IStoreLicense")) {
            if ((queryResult := this.QueryInterface(IStoreLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreLicense := IStoreLicense(outPtr)
        }

        return this.__IStoreLicense.get_ExtendedJsonData()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InAppOfferToken() {
        if (!this.HasProp("__IStoreLicense")) {
            if ((queryResult := this.QueryInterface(IStoreLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreLicense := IStoreLicense(outPtr)
        }

        return this.__IStoreLicense.get_InAppOfferToken()
    }

;@endregion Instance Methods
}
