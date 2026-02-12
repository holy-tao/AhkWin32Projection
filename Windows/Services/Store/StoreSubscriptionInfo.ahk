#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreSubscriptionInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides subscription info for a product SKU that represents a subscription with recurring billing.
 * @remarks
 * The [StoreSku.SubscriptionInfo](storesku_subscriptioninfo.md) property returns an object of this type.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesubscriptioninfo
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreSubscriptionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreSubscriptionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreSubscriptionInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the duration of the billing period for a subscription, in the units specified by the [BillingPeriodUnit](storesubscriptioninfo_billingperiodunit.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesubscriptioninfo.billingperiod
     * @type {Integer} 
     */
    BillingPeriod {
        get => this.get_BillingPeriod()
    }

    /**
     * Gets the units of the billing period for a subscription.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesubscriptioninfo.billingperiodunit
     * @type {Integer} 
     */
    BillingPeriodUnit {
        get => this.get_BillingPeriodUnit()
    }

    /**
     * Gets a value that indicates whether the subscription contains a trial period.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesubscriptioninfo.hastrialperiod
     * @type {Boolean} 
     */
    HasTrialPeriod {
        get => this.get_HasTrialPeriod()
    }

    /**
     * Gets the duration of the trial period for the subscription, in the units specified by the [TrialPeriodUnit](storesubscriptioninfo_trialperiodunit.md) property. To determine whether the subscription has a trial period, use the [HasTrialPeriod](storesubscriptioninfo_hastrialperiod.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesubscriptioninfo.trialperiod
     * @type {Integer} 
     */
    TrialPeriod {
        get => this.get_TrialPeriod()
    }

    /**
     * Gets the units of the trial period for the subscription.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storesubscriptioninfo.trialperiodunit
     * @type {Integer} 
     */
    TrialPeriodUnit {
        get => this.get_TrialPeriodUnit()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BillingPeriod() {
        if (!this.HasProp("__IStoreSubscriptionInfo")) {
            if ((queryResult := this.QueryInterface(IStoreSubscriptionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSubscriptionInfo := IStoreSubscriptionInfo(outPtr)
        }

        return this.__IStoreSubscriptionInfo.get_BillingPeriod()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BillingPeriodUnit() {
        if (!this.HasProp("__IStoreSubscriptionInfo")) {
            if ((queryResult := this.QueryInterface(IStoreSubscriptionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSubscriptionInfo := IStoreSubscriptionInfo(outPtr)
        }

        return this.__IStoreSubscriptionInfo.get_BillingPeriodUnit()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasTrialPeriod() {
        if (!this.HasProp("__IStoreSubscriptionInfo")) {
            if ((queryResult := this.QueryInterface(IStoreSubscriptionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSubscriptionInfo := IStoreSubscriptionInfo(outPtr)
        }

        return this.__IStoreSubscriptionInfo.get_HasTrialPeriod()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrialPeriod() {
        if (!this.HasProp("__IStoreSubscriptionInfo")) {
            if ((queryResult := this.QueryInterface(IStoreSubscriptionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSubscriptionInfo := IStoreSubscriptionInfo(outPtr)
        }

        return this.__IStoreSubscriptionInfo.get_TrialPeriod()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrialPeriodUnit() {
        if (!this.HasProp("__IStoreSubscriptionInfo")) {
            if ((queryResult := this.QueryInterface(IStoreSubscriptionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreSubscriptionInfo := IStoreSubscriptionInfo(outPtr)
        }

        return this.__IStoreSubscriptionInfo.get_TrialPeriodUnit()
    }

;@endregion Instance Methods
}
