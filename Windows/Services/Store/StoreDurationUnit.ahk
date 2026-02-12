#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values that represent the units of a trial period or billing period for a subscription.
 * @remarks
 * The [StoreSubscriptionInfo.BillingPeriodUnit](storesubscriptioninfo_billingperiodunit.md) property returns these values.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storedurationunit
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreDurationUnit extends Win32Enum{

    /**
     * The period is defined in minutes.
     * @type {Integer (Int32)}
     */
    static Minute => 0

    /**
     * The period is defined in hours.
     * @type {Integer (Int32)}
     */
    static Hour => 1

    /**
     * The period is defined in days.
     * @type {Integer (Int32)}
     */
    static Day => 2

    /**
     * The period is defined in weeks.
     * @type {Integer (Int32)}
     */
    static Week => 3

    /**
     * The period is defined in months.
     * @type {Integer (Int32)}
     */
    static Month => 4

    /**
     * The period is defined in years.
     * @type {Integer (Int32)}
     */
    static Year => 5
}
