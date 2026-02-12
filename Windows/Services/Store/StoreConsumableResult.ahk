#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreConsumableResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides response data for a request that involves a consumable add-on for the current app.
 * @remarks
 * The [ReportConsumableFulfillmentAsync](storecontext_reportconsumablefulfillmentasync_1944624188.md) and [GetConsumableBalanceRemainingAsync](storecontext_getconsumablebalanceremainingasync_667148504.md) methods of the [StoreContext](storecontext.md) class return an object of this type.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeconsumableresult
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreConsumableResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreConsumableResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreConsumableResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the request.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeconsumableresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * Gets the tracking ID that was submitted with the [ReportConsumableFulfillmentAsync](storecontext_reportconsumablefulfillmentasync_1944624188.md) request.
     * @remarks
     * For more information about the tracking ID, see [ReportConsumableFulfillmentAsync](storecontext_reportconsumablefulfillmentasync_1944624188.md).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeconsumableresult.trackingid
     * @type {Guid} 
     */
    TrackingId {
        get => this.get_TrackingId()
    }

    /**
     * Gets the remaining balance for the consumable add-on.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeconsumableresult.balanceremaining
     * @type {Integer} 
     */
    BalanceRemaining {
        get => this.get_BalanceRemaining()
    }

    /**
     * Gets the error code for the request, if the operation encountered an error.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeconsumableresult.extendederror
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
        if (!this.HasProp("__IStoreConsumableResult")) {
            if ((queryResult := this.QueryInterface(IStoreConsumableResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreConsumableResult := IStoreConsumableResult(outPtr)
        }

        return this.__IStoreConsumableResult.get_Status()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TrackingId() {
        if (!this.HasProp("__IStoreConsumableResult")) {
            if ((queryResult := this.QueryInterface(IStoreConsumableResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreConsumableResult := IStoreConsumableResult(outPtr)
        }

        return this.__IStoreConsumableResult.get_TrackingId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BalanceRemaining() {
        if (!this.HasProp("__IStoreConsumableResult")) {
            if ((queryResult := this.QueryInterface(IStoreConsumableResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreConsumableResult := IStoreConsumableResult(outPtr)
        }

        return this.__IStoreConsumableResult.get_BalanceRemaining()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IStoreConsumableResult")) {
            if ((queryResult := this.QueryInterface(IStoreConsumableResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreConsumableResult := IStoreConsumableResult(outPtr)
        }

        return this.__IStoreConsumableResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
