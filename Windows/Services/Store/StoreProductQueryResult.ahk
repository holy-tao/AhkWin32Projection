#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreProductQueryResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides response data for a request to retrieve details about products that can be purchased from within the current app.
 * @remarks
 * The following methods of the [StoreContext](storecontext.md) class return an object of this type: 
 * + [GetStoreProductsAsync](/uwp/api/windows.services.store.storecontext.getstoreproductsasync)
 * + [GetAssociatedStoreProductsAsync](storecontext_getassociatedstoreproductsasync_1833928682.md)
 * + [GetUserCollectionAsync](storecontext_getusercollectionasync_822351662.md)
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproductqueryresult
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreProductQueryResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreProductQueryResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreProductQueryResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of products returned by the request.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproductqueryresult.products
     * @type {IMapView<HSTRING, StoreProduct>} 
     */
    Products {
        get => this.get_Products()
    }

    /**
     * Gets the error code for the request, if the operation encountered an error.
     * @remarks
     * If the current user is not signed in to the Store, this property returns the error code 0x80070525 (**ERROR_NO_SUCH_USER**).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproductqueryresult.extendederror
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
     * @returns {IMapView<HSTRING, StoreProduct>} 
     */
    get_Products() {
        if (!this.HasProp("__IStoreProductQueryResult")) {
            if ((queryResult := this.QueryInterface(IStoreProductQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProductQueryResult := IStoreProductQueryResult(outPtr)
        }

        return this.__IStoreProductQueryResult.get_Products()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IStoreProductQueryResult")) {
            if ((queryResult := this.QueryInterface(IStoreProductQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProductQueryResult := IStoreProductQueryResult(outPtr)
        }

        return this.__IStoreProductQueryResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
