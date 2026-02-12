#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\PurchaseResults.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\UnfulfilledConsumable.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store
 * @version WindowsRuntime 1.4
 */
class ICurrentAppWithConsumables extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICurrentAppWithConsumables
     * @type {Guid}
     */
    static IID => Guid("{844e0071-9e4f-4f79-995a-5f91172e6cef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReportConsumableFulfillmentAsync", "RequestProductPurchaseWithResultsAsync", "RequestProductPurchaseWithDisplayPropertiesAsync", "GetUnfulfilledConsumablesAsync"]

    /**
     * 
     * @param {HSTRING} productId 
     * @param {Guid} transactionId 
     * @returns {IAsyncOperation<Integer>} 
     */
    ReportConsumableFulfillmentAsync(productId, transactionId) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId

        result := ComCall(6, this, "ptr", productId, "ptr", transactionId, "ptr*", &reportConsumableFulfillmentOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), reportConsumableFulfillmentOperation)
    }

    /**
     * 
     * @param {HSTRING} productId 
     * @returns {IAsyncOperation<PurchaseResults>} 
     */
    RequestProductPurchaseWithResultsAsync(productId) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId

        result := ComCall(7, this, "ptr", productId, "ptr*", &requestProductPurchaseWithResultsOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PurchaseResults, requestProductPurchaseWithResultsOperation)
    }

    /**
     * 
     * @param {HSTRING} productId 
     * @param {HSTRING} offerId 
     * @param {ProductPurchaseDisplayProperties} displayProperties_ 
     * @returns {IAsyncOperation<PurchaseResults>} 
     */
    RequestProductPurchaseWithDisplayPropertiesAsync(productId, offerId, displayProperties_) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId
        if(offerId is String) {
            pin := HSTRING.Create(offerId)
            offerId := pin.Value
        }
        offerId := offerId is Win32Handle ? NumGet(offerId, "ptr") : offerId

        result := ComCall(8, this, "ptr", productId, "ptr", offerId, "ptr", displayProperties_, "ptr*", &requestProductPurchaseWithDisplayPropertiesOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(PurchaseResults, requestProductPurchaseWithDisplayPropertiesOperation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<UnfulfilledConsumable>>} 
     */
    GetUnfulfilledConsumablesAsync() {
        result := ComCall(9, this, "ptr*", &getUnfulfilledConsumablesOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, UnfulfilledConsumable), getUnfulfilledConsumablesOperation)
    }
}
