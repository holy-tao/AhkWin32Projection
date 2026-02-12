#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\StoreProductResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreContext2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreContext2
     * @type {Guid}
     */
    static IID => Guid("{18bc54da-7bd9-452c-9116-3bbd06ffc63a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindStoreProductForPackageAsync"]

    /**
     * 
     * @param {IIterable<HSTRING>} productKinds 
     * @param {Package} package_ 
     * @returns {IAsyncOperation<StoreProductResult>} 
     */
    FindStoreProductForPackageAsync(productKinds, package_) {
        result := ComCall(6, this, "ptr", productKinds, "ptr", package_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreProductResult, operation)
    }
}
