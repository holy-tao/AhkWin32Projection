#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\StorePreviewPurchaseResults.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\StorePreviewProductInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview
 * @version WindowsRuntime 1.4
 */
class IStorePreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorePreview
     * @type {Guid}
     */
    static IID => Guid("{8a157241-840e-49a9-bc01-5d5b01fbc8e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestProductPurchaseByProductIdAndSkuIdAsync", "LoadAddOnProductInfosAsync"]

    /**
     * 
     * @param {HSTRING} productId 
     * @param {HSTRING} skuId 
     * @returns {IAsyncOperation<StorePreviewPurchaseResults>} 
     */
    RequestProductPurchaseByProductIdAndSkuIdAsync(productId, skuId) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId
        if(skuId is String) {
            pin := HSTRING.Create(skuId)
            skuId := pin.Value
        }
        skuId := skuId is Win32Handle ? NumGet(skuId, "ptr") : skuId

        result := ComCall(6, this, "ptr", productId, "ptr", skuId, "ptr*", &requestPurchaseBySkuIdOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorePreviewPurchaseResults, requestPurchaseBySkuIdOperation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<StorePreviewProductInfo>>} 
     */
    LoadAddOnProductInfosAsync() {
        result := ComCall(7, this, "ptr*", &loadAddOnProductInfosOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StorePreviewProductInfo), loadAddOnProductInfosOperation)
    }
}
