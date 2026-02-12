#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreProductResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides response data for a request to retrieve details about the current app.
 * @remarks
 * The [StoreContext.GetStoreProductForCurrentAppAsync](storecontext_getstoreproductforcurrentappasync_128036649.md) method returns an object of this type.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproductresult
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreProductResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreProductResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreProductResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets info about the current app.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproductresult.product
     * @type {StoreProduct} 
     */
    Product {
        get => this.get_Product()
    }

    /**
     * Gets the error code for the request, if the operation encountered an error.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproductresult.extendederror
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
     * @returns {StoreProduct} 
     */
    get_Product() {
        if (!this.HasProp("__IStoreProductResult")) {
            if ((queryResult := this.QueryInterface(IStoreProductResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProductResult := IStoreProductResult(outPtr)
        }

        return this.__IStoreProductResult.get_Product()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IStoreProductResult")) {
            if ((queryResult := this.QueryInterface(IStoreProductResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProductResult := IStoreProductResult(outPtr)
        }

        return this.__IStoreProductResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
