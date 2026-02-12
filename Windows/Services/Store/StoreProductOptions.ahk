#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreProductOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains a collection of filter strings you can use with the [GetStoreProductsAsync](storecontext_getstoreproductsasync_915504661.md) method to get info for the specified products that are associated with the current app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproductoptions
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreProductOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreProductOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreProductOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a collection of filter strings you can use with the [GetStoreProductsAsync](storecontext_getstoreproductsasync_915504661.md) method to get info for the specified products that are associated with the current app. Currently, this collection only supports one filter string, ```Purchase```.
     * @remarks
     * Currently, this property only supports one filter string, ```Purchase```. When you include this filter string, [GetStoreProductsAsync](storecontext_getstoreproductsasync_915504661.md) returns info only for products that are currently available for purchase from within the current app (the operation will exclude products that are no longer sellable by the app).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproductoptions.actionfilters
     * @type {IVector<HSTRING>} 
     */
    ActionFilters {
        get => this.get_ActionFilters()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new instance of the [StoreProductOptions](storeproductoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Services.Store.StoreProductOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ActionFilters() {
        if (!this.HasProp("__IStoreProductOptions")) {
            if ((queryResult := this.QueryInterface(IStoreProductOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProductOptions := IStoreProductOptions(outPtr)
        }

        return this.__IStoreProductOptions.get_ActionFilters()
    }

;@endregion Instance Methods
}
