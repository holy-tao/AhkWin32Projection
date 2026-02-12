#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreProductPagedQueryResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides response data for a paged request to retrieve details about products that can be purchased from within the current app.
 * @remarks
 * The [StoreContext.GetAssociatedStoreProductsWithPagingAsync](storecontext_getassociatedstoreproductswithpagingasync_35867193.md) and [StoreContext.GetUserCollectionWithPagingAsync](storecontext_getusercollectionwithpagingasync_1326616908.md) methods return an object of this type.
 * 
 * After you have a StoreProductPagedQueryResult object, you can retrieve the object that contains the next page of results by using the [GetNextAsync](storeproductpagedqueryresult_getnextasync_1854313260.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproductpagedqueryresult
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreProductPagedQueryResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreProductPagedQueryResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreProductPagedQueryResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of products returned by the request.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproductpagedqueryresult.products
     * @type {IMapView<HSTRING, StoreProduct>} 
     */
    Products {
        get => this.get_Products()
    }

    /**
     * Gets a value that indicates whether there are additional pages of results. To get the next page of results, use the [GetNextAsync](storeproductpagedqueryresult_getnextasync_1854313260.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproductpagedqueryresult.hasmoreresults
     * @type {Boolean} 
     */
    HasMoreResults {
        get => this.get_HasMoreResults()
    }

    /**
     * Gets the error code for the request, if the operation encountered an error.
     * @remarks
     * If the current user is not signed in to the Store, this property returns the error code 0x80070525 (**ERROR_NO_SUCH_USER**).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproductpagedqueryresult.extendederror
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
        if (!this.HasProp("__IStoreProductPagedQueryResult")) {
            if ((queryResult := this.QueryInterface(IStoreProductPagedQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProductPagedQueryResult := IStoreProductPagedQueryResult(outPtr)
        }

        return this.__IStoreProductPagedQueryResult.get_Products()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasMoreResults() {
        if (!this.HasProp("__IStoreProductPagedQueryResult")) {
            if ((queryResult := this.QueryInterface(IStoreProductPagedQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProductPagedQueryResult := IStoreProductPagedQueryResult(outPtr)
        }

        return this.__IStoreProductPagedQueryResult.get_HasMoreResults()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IStoreProductPagedQueryResult")) {
            if ((queryResult := this.QueryInterface(IStoreProductPagedQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProductPagedQueryResult := IStoreProductPagedQueryResult(outPtr)
        }

        return this.__IStoreProductPagedQueryResult.get_ExtendedError()
    }

    /**
     * Returns the next page of results. To determine if there are more pages of results, use the [HasMoreResults](storeproductpagedqueryresult_hasmoreresults.md) property.
     * @returns {IAsyncOperation<StoreProductPagedQueryResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeproductpagedqueryresult.getnextasync
     */
    GetNextAsync() {
        if (!this.HasProp("__IStoreProductPagedQueryResult")) {
            if ((queryResult := this.QueryInterface(IStoreProductPagedQueryResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreProductPagedQueryResult := IStoreProductPagedQueryResult(outPtr)
        }

        return this.__IStoreProductPagedQueryResult.GetNextAsync()
    }

;@endregion Instance Methods
}
