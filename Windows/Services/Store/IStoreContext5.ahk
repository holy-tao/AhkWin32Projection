#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\StoreProductQueryResult.ahk
#Include .\StorePurchaseResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreContext5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreContext5
     * @type {Guid}
     */
    static IID => Guid("{6de6c52b-c43a-5953-b39a-71643c57d96e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUserPurchaseHistoryAsync", "GetAssociatedStoreProductsByInAppOfferTokenAsync", "RequestPurchaseByInAppOfferTokenAsync"]

    /**
     * 
     * @param {IIterable<HSTRING>} productKinds 
     * @returns {IAsyncOperation<StoreProductQueryResult>} 
     */
    GetUserPurchaseHistoryAsync(productKinds) {
        result := ComCall(6, this, "ptr", productKinds, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreProductQueryResult, operation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} inAppOfferTokens 
     * @returns {IAsyncOperation<StoreProductQueryResult>} 
     */
    GetAssociatedStoreProductsByInAppOfferTokenAsync(inAppOfferTokens) {
        result := ComCall(7, this, "ptr", inAppOfferTokens, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreProductQueryResult, operation)
    }

    /**
     * 
     * @param {HSTRING} inAppOfferToken 
     * @returns {IAsyncOperation<StorePurchaseResult>} 
     */
    RequestPurchaseByInAppOfferTokenAsync(inAppOfferToken) {
        if(inAppOfferToken is String) {
            pin := HSTRING.Create(inAppOfferToken)
            inAppOfferToken := pin.Value
        }
        inAppOfferToken := inAppOfferToken is Win32Handle ? NumGet(inAppOfferToken, "ptr") : inAppOfferToken

        result := ComCall(8, this, "ptr", inAppOfferToken, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorePurchaseResult, operation)
    }
}
