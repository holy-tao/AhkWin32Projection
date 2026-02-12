#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\StoreProduct.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\StoreProductPagedQueryResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreProductPagedQueryResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreProductPagedQueryResult
     * @type {Guid}
     */
    static IID => Guid("{c92718c5-4dd5-4869-a462-ecc6872e43c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Products", "get_HasMoreResults", "get_ExtendedError", "GetNextAsync"]

    /**
     * @type {IMapView<HSTRING, StoreProduct>} 
     */
    Products {
        get => this.get_Products()
    }

    /**
     * @type {Boolean} 
     */
    HasMoreResults {
        get => this.get_HasMoreResults()
    }

    /**
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, StoreProduct>} 
     */
    get_Products() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), StoreProduct, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasMoreResults() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<StoreProductPagedQueryResult>} 
     */
    GetNextAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreProductPagedQueryResult, operation)
    }
}
