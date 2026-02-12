#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorePurchaseResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides response data for a request to purchase an app or product that is offered by the app.
 * @remarks
 * The **RequestPurchaseAsync** methods of the [StoreContext](storecontext.md), [StoreProduct](storeproduct.md), [StoreSku](storesku.md), or [StoreAvailability](storeavailability.md) classes return an object of this type.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepurchaseresult
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StorePurchaseResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorePurchaseResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorePurchaseResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the purchase request.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepurchaseresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the error code for the purchase request, if the operation encountered an error.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepurchaseresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
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
        if (!this.HasProp("__IStorePurchaseResult")) {
            if ((queryResult := this.QueryInterface(IStorePurchaseResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePurchaseResult := IStorePurchaseResult(outPtr)
        }

        return this.__IStorePurchaseResult.get_Status()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IStorePurchaseResult")) {
            if ((queryResult := this.QueryInterface(IStorePurchaseResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePurchaseResult := IStorePurchaseResult(outPtr)
        }

        return this.__IStorePurchaseResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
