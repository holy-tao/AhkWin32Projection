#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\StoreProduct.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreProductResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreProductResult
     * @type {Guid}
     */
    static IID => Guid("{b7674f73-3c87-4ee1-8201-f428359bd3af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Product", "get_ExtendedError"]

    /**
     * @type {StoreProduct} 
     */
    Product {
        get => this.get_Product()
    }

    /**
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * 
     * @returns {StoreProduct} 
     */
    get_Product() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StoreProduct(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
