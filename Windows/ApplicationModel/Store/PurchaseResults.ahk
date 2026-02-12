#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPurchaseResults.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information detailing the results of an in-app product purchase transaction.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.purchaseresults
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class PurchaseResults extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPurchaseResults

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPurchaseResults.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The current state of the purchase transaction for an in-app product.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.purchaseresults.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * A unique transaction ID associated with the purchase of a consumable in-app product.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.purchaseresults.transactionid
     * @type {Guid} 
     */
    TransactionId {
        get => this.get_TransactionId()
    }

    /**
     * A full receipt that provides a transaction history for the purchase of an in-app product.
     * @remarks
     * For information about the contents of the receipt, see [Using receipts to verify product purchases](/windows/uwp/monetize/use-receipts-to-verify-product-purchases).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.purchaseresults.receiptxml
     * @type {HSTRING} 
     */
    ReceiptXml {
        get => this.get_ReceiptXml()
    }

    /**
     * A unique ID used to identify a specific in-app product within a large catalog.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.purchaseresults.offerid
     * @type {HSTRING} 
     */
    OfferId {
        get => this.get_OfferId()
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
    get_Status() {
        if (!this.HasProp("__IPurchaseResults")) {
            if ((queryResult := this.QueryInterface(IPurchaseResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPurchaseResults := IPurchaseResults(outPtr)
        }

        return this.__IPurchaseResults.get_Status()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TransactionId() {
        if (!this.HasProp("__IPurchaseResults")) {
            if ((queryResult := this.QueryInterface(IPurchaseResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPurchaseResults := IPurchaseResults(outPtr)
        }

        return this.__IPurchaseResults.get_TransactionId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ReceiptXml() {
        if (!this.HasProp("__IPurchaseResults")) {
            if ((queryResult := this.QueryInterface(IPurchaseResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPurchaseResults := IPurchaseResults(outPtr)
        }

        return this.__IPurchaseResults.get_ReceiptXml()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OfferId() {
        if (!this.HasProp("__IPurchaseResults")) {
            if ((queryResult := this.QueryInterface(IPurchaseResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPurchaseResults := IPurchaseResults(outPtr)
        }

        return this.__IPurchaseResults.get_OfferId()
    }

;@endregion Instance Methods
}
