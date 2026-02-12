#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\StoreRateAndReviewResult.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\StoreQueueItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreContext4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreContext4
     * @type {Guid}
     */
    static IID => Guid("{af9c6f69-bea1-4bf4-8e74-ae03e206c6b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestRateAndReviewAppAsync", "SetInstallOrderForAssociatedStoreQueueItemsAsync"]

    /**
     * 
     * @returns {IAsyncOperation<StoreRateAndReviewResult>} 
     */
    RequestRateAndReviewAppAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreRateAndReviewResult, operation)
    }

    /**
     * 
     * @param {IIterable<StoreQueueItem>} items 
     * @returns {IAsyncOperation<IVectorView<StoreQueueItem>>} 
     */
    SetInstallOrderForAssociatedStoreQueueItemsAsync(items) {
        result := ComCall(7, this, "ptr", items, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StoreQueueItem), operation)
    }
}
