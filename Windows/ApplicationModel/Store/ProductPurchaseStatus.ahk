#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values used to indicate the transaction status when purchasing an in-app product.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.productpurchasestatus
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class ProductPurchaseStatus extends Win32Enum{

    /**
     * The transaction succeeded and the user has been notified.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The transaction did not complete because this in-app product has already been purchased by the user, and it cannot be purchased again.
     * @type {Integer (Int32)}
     */
    static AlreadyPurchased => 1

    /**
     * The transaction did not complete because the last purchase of this consumable in-app product has not been reported as fulfilled to the Microsoft Store.
     * @type {Integer (Int32)}
     */
    static NotFulfilled => 2

    /**
     * The purchase did not occur because the user decided not to complete the transaction (or the transaction failed for other reasons).
     * @type {Integer (Int32)}
     */
    static NotPurchased => 3
}
