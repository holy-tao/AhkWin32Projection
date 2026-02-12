#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUnfulfilledConsumable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains purchase and product information for an unfulfilled consumable in-app product.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.unfulfilledconsumable
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class UnfulfilledConsumable extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUnfulfilledConsumable

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUnfulfilledConsumable.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A unique ID used to identify a consumable in-app product. This ID is used by the app to get info about the product or feature that is enabled when the customer buys it through an in-app purchase.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.unfulfilledconsumable.productid
     * @type {HSTRING} 
     */
    ProductId {
        get => this.get_ProductId()
    }

    /**
     * A unique ID used to identify the transaction that included the purchase of a consumable in-app product.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.unfulfilledconsumable.transactionid
     * @type {Guid} 
     */
    TransactionId {
        get => this.get_TransactionId()
    }

    /**
     * A unique ID used to identify a consumable in-app product within a large purchase catalog.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.unfulfilledconsumable.offerid
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
     * @returns {HSTRING} 
     */
    get_ProductId() {
        if (!this.HasProp("__IUnfulfilledConsumable")) {
            if ((queryResult := this.QueryInterface(IUnfulfilledConsumable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnfulfilledConsumable := IUnfulfilledConsumable(outPtr)
        }

        return this.__IUnfulfilledConsumable.get_ProductId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TransactionId() {
        if (!this.HasProp("__IUnfulfilledConsumable")) {
            if ((queryResult := this.QueryInterface(IUnfulfilledConsumable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnfulfilledConsumable := IUnfulfilledConsumable(outPtr)
        }

        return this.__IUnfulfilledConsumable.get_TransactionId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OfferId() {
        if (!this.HasProp("__IUnfulfilledConsumable")) {
            if ((queryResult := this.QueryInterface(IUnfulfilledConsumable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnfulfilledConsumable := IUnfulfilledConsumable(outPtr)
        }

        return this.__IUnfulfilledConsumable.get_OfferId()
    }

;@endregion Instance Methods
}
