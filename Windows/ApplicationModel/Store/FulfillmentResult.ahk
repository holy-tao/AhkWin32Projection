#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values used to indicate fulfillment status for a consumable in-app product.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.fulfillmentresult
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class FulfillmentResult extends Win32Enum{

    /**
     * The purchased consumable in-app product was fulfilled.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The specified transaction ID has been passed or the consumable in-app product has already been fulfilled.
     * @type {Integer (Int32)}
     */
    static NothingToFulfill => 1

    /**
     * The purchase is not complete. At this point it is still possible for the transaction to be reversed due to provider failures and/or risk checks.
     * @type {Integer (Int32)}
     */
    static PurchasePending => 2

    /**
     * The purchase request has been reverted.
     * @type {Integer (Int32)}
     */
    static PurchaseReverted => 3

    /**
     * There was an issue receiving fulfillment status.
     * @type {Integer (Int32)}
     */
    static ServerError => 4
}
