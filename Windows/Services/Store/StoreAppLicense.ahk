#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreAppLicense.ahk
#Include .\IStoreAppLicense2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides license info for the current app, including licenses for products that are offered by the app.
 * @remarks
 * The [StoreContext.GetAppLicenseAsync](storecontext_getapplicenseasync_1472711008.md) method returns an object of this type.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeapplicense
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreAppLicense extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreAppLicense

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreAppLicense.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Store ID of the licensed app SKU from the Microsoft Store catalog.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeapplicense.skustoreid
     * @type {HSTRING} 
     */
    SkuStoreId {
        get => this.get_SkuStoreId()
    }

    /**
     * Gets a value that indicates whether the license is valid and provides the current user an entitlement to use the app.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeapplicense.isactive
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * Gets a value that indicates whether the license is a trial license.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeapplicense.istrial
     * @type {Boolean} 
     */
    IsTrial {
        get => this.get_IsTrial()
    }

    /**
     * Gets the expiration date and time for the app license.
     * @remarks
     * For usage-limited trials, the expiration date is December 31, 9999. Usage-limited trials are currently available only to some developer accounts in Xbox managed partner programs.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeapplicense.expirationdate
     * @type {DateTime} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
    }

    /**
     * Gets complete license data in JSON format.
     * @remarks
     * Use the **ExtendedJsonData** property to access the complete data for the [StoreAppLicense](storeapplicense.md) object as a JSON-formatted string in your code. For more information about the structure of the data, see [Data schemas for Store products](/windows/uwp/monetize/data-schemas-for-store-products).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeapplicense.extendedjsondata
     * @type {HSTRING} 
     */
    ExtendedJsonData {
        get => this.get_ExtendedJsonData()
    }

    /**
     * Gets the collection of licenses for durable add-ons for which the user has entitlements to use. This property does not include licenses for consumable add-ons.
     * @remarks
     * This collection contains durable add-on licenses that are currently valid. When a license is expired or no longer valid, it will no longer be available in this collection.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeapplicense.addonlicenses
     * @type {IMapView<HSTRING, StoreLicense>} 
     */
    AddOnLicenses {
        get => this.get_AddOnLicenses()
    }

    /**
     * Gets the remaining time for the usage-limited trial that is associated with this app license.
     * @remarks
     * This property is intended to be used by developers who have configured their app as a **usage-limited trial** in [Partner Center](https://partner.microsoft.com/dashboard). Usage-limited trials are currently available only to some developer accounts in Xbox managed partner programs.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeapplicense.trialtimeremaining
     * @type {TimeSpan} 
     */
    TrialTimeRemaining {
        get => this.get_TrialTimeRemaining()
    }

    /**
     * Gets a value that indicates whether the current user has an entitlement for the usage-limited trial that is associated with this app license.
     * @remarks
     * This property is intended to be used by developers who have configured their app as a **usage-limited trial** in [Partner Center](https://partner.microsoft.com/dashboard). Usage-limited trials are currently available only to some developer accounts in Xbox managed partner programs.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeapplicense.istrialownedbythisuser
     * @type {Boolean} 
     */
    IsTrialOwnedByThisUser {
        get => this.get_IsTrialOwnedByThisUser()
    }

    /**
     * Gets a unique ID that identifies the combination of the current user and the usage-limited trial that is associated with this app license.
     * @remarks
     * This property is intended to be used by developers who have configured their app as a **usage-limited trial** in [Partner Center](https://partner.microsoft.com/dashboard). Usage-limited trials are currently available only to some developer accounts in Xbox managed partner programs.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeapplicense.trialuniqueid
     * @type {HSTRING} 
     */
    TrialUniqueId {
        get => this.get_TrialUniqueId()
    }

    /**
     * Gets a value that indicates whether the current license was acquired from a disc-based installation.
     * @remarks
     * This property is useful if you are a game developer who wants to determine whether the current customer acquired your game's license by installing it from a disc (rather than acquiring it from a Store purchase or some other process). You might want to use this information if you are building a differentiated monetization experience where customers who acquire your game in different ways will get access to different sets of features.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeapplicense.isdisclicense
     * @type {Boolean} 
     */
    IsDiscLicense {
        get => this.get_IsDiscLicense()
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
        if (!this.HasProp("__IStoreAppLicense")) {
            if ((queryResult := this.QueryInterface(IStoreAppLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAppLicense := IStoreAppLicense(outPtr)
        }

        return this.__IStoreAppLicense.get_SkuStoreId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        if (!this.HasProp("__IStoreAppLicense")) {
            if ((queryResult := this.QueryInterface(IStoreAppLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAppLicense := IStoreAppLicense(outPtr)
        }

        return this.__IStoreAppLicense.get_IsActive()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTrial() {
        if (!this.HasProp("__IStoreAppLicense")) {
            if ((queryResult := this.QueryInterface(IStoreAppLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAppLicense := IStoreAppLicense(outPtr)
        }

        return this.__IStoreAppLicense.get_IsTrial()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ExpirationDate() {
        if (!this.HasProp("__IStoreAppLicense")) {
            if ((queryResult := this.QueryInterface(IStoreAppLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAppLicense := IStoreAppLicense(outPtr)
        }

        return this.__IStoreAppLicense.get_ExpirationDate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExtendedJsonData() {
        if (!this.HasProp("__IStoreAppLicense")) {
            if ((queryResult := this.QueryInterface(IStoreAppLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAppLicense := IStoreAppLicense(outPtr)
        }

        return this.__IStoreAppLicense.get_ExtendedJsonData()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, StoreLicense>} 
     */
    get_AddOnLicenses() {
        if (!this.HasProp("__IStoreAppLicense")) {
            if ((queryResult := this.QueryInterface(IStoreAppLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAppLicense := IStoreAppLicense(outPtr)
        }

        return this.__IStoreAppLicense.get_AddOnLicenses()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrialTimeRemaining() {
        if (!this.HasProp("__IStoreAppLicense")) {
            if ((queryResult := this.QueryInterface(IStoreAppLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAppLicense := IStoreAppLicense(outPtr)
        }

        return this.__IStoreAppLicense.get_TrialTimeRemaining()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTrialOwnedByThisUser() {
        if (!this.HasProp("__IStoreAppLicense")) {
            if ((queryResult := this.QueryInterface(IStoreAppLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAppLicense := IStoreAppLicense(outPtr)
        }

        return this.__IStoreAppLicense.get_IsTrialOwnedByThisUser()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TrialUniqueId() {
        if (!this.HasProp("__IStoreAppLicense")) {
            if ((queryResult := this.QueryInterface(IStoreAppLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAppLicense := IStoreAppLicense(outPtr)
        }

        return this.__IStoreAppLicense.get_TrialUniqueId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDiscLicense() {
        if (!this.HasProp("__IStoreAppLicense2")) {
            if ((queryResult := this.QueryInterface(IStoreAppLicense2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAppLicense2 := IStoreAppLicense2(outPtr)
        }

        return this.__IStoreAppLicense2.get_IsDiscLicense()
    }

;@endregion Instance Methods
}
