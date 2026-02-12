#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorePreviewPurchaseResults.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about the results of a purchase transaction for an in-app product SKU that was purchased by using the [RequestProductPurchaseByProductIdAndSkuIdAsync](storepreview_requestproductpurchasebyproductidandskuidasync_423925263.md) method.
 * @remarks
 * The [RequestProductPurchaseByProductIdAndSkuIdAsync](storepreview_requestproductpurchasebyproductidandskuidasync_423925263.md) method returns an instance of this class to provide the results of the purchase transaction for the in-app product.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storepreviewpurchaseresults
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class StorePreviewPurchaseResults extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorePreviewPurchaseResults

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorePreviewPurchaseResults.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current state of the purchase transaction for an in-app product SKU that was purchased by using the [RequestProductPurchaseByProductIdAndSkuIdAsync](storepreview_requestproductpurchasebyproductidandskuidasync_423925263.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.storepreviewpurchaseresults.productpurchasestatus
     * @type {Integer} 
     */
    ProductPurchaseStatus {
        get => this.get_ProductPurchaseStatus()
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
    get_ProductPurchaseStatus() {
        if (!this.HasProp("__IStorePreviewPurchaseResults")) {
            if ((queryResult := this.QueryInterface(IStorePreviewPurchaseResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePreviewPurchaseResults := IStorePreviewPurchaseResults(outPtr)
        }

        return this.__IStorePreviewPurchaseResults.get_ProductPurchaseStatus()
    }

;@endregion Instance Methods
}
