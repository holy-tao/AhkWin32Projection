#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that are used to indicate the transaction status when purchasing an in-app product SKU by using the [RequestProductPurchaseByProductIdAndSkuIdAsync](storepreview_requestproductpurchasebyproductidandskuidasync_423925263.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storepreviewproductpurchasestatus
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class StorePreviewProductPurchaseStatus extends Win32Enum{

    /**
     * The transaction succeeded and the user has been notified.
     * @type {Integer (Int32)}
     */
    static Succeeded => 0

    /**
     * The transaction did not complete because this in-app product SKU has already been purchased by the user, and it cannot be purchased again. This value only applies to durable in-app products.
     * @type {Integer (Int32)}
     */
    static AlreadyPurchased => 1

    /**
     * The transaction did not complete because the last purchase of this consumable in-app product SKU has not been reported as fulfilled to the Microsoft Store. This value only applies to consumable in-app products.
     * @type {Integer (Int32)}
     */
    static NotFulfilled => 2

    /**
     * The purchase did not occur because the user decided not to complete the transaction (or the transaction failed for other reasons).
     * @type {Integer (Int32)}
     */
    static NotPurchased => 3
}
