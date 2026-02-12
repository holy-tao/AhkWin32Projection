#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\StorePackageUpdateResult.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\StoreCanAcquireLicenseResult.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\StoreProductQueryResult.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\StoreQueueItem.ahk
#Include .\StoreUninstallStorePackageResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreContext3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreContext3
     * @type {Guid}
     */
    static IID => Guid("{e26226ca-1a01-4730-85a6-ecc896e4ae38}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanSilentlyDownloadStorePackageUpdates", "TrySilentDownloadStorePackageUpdatesAsync", "TrySilentDownloadAndInstallStorePackageUpdatesAsync", "CanAcquireStoreLicenseForOptionalPackageAsync", "CanAcquireStoreLicenseAsync", "GetStoreProductsWithOptionsAsync", "GetAssociatedStoreQueueItemsAsync", "GetStoreQueueItemsAsync", "RequestDownloadAndInstallStorePackagesWithInstallOptionsAsync", "DownloadAndInstallStorePackagesAsync", "RequestUninstallStorePackageAsync", "RequestUninstallStorePackageByStoreIdAsync", "UninstallStorePackageAsync", "UninstallStorePackageByStoreIdAsync"]

    /**
     * @type {Boolean} 
     */
    CanSilentlyDownloadStorePackageUpdates {
        get => this.get_CanSilentlyDownloadStorePackageUpdates()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSilentlyDownloadStorePackageUpdates() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {IIterable<StorePackageUpdate>} storePackageUpdates 
     * @returns {IAsyncOperationWithProgress<StorePackageUpdateResult, StorePackageUpdateStatus>} 
     */
    TrySilentDownloadStorePackageUpdatesAsync(storePackageUpdates) {
        result := ComCall(7, this, "ptr", storePackageUpdates, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(StorePackageUpdateResult, (ptr) => IPropertyValue(ptr).GetStorePackageUpdateStatus(), operation)
    }

    /**
     * 
     * @param {IIterable<StorePackageUpdate>} storePackageUpdates 
     * @returns {IAsyncOperationWithProgress<StorePackageUpdateResult, StorePackageUpdateStatus>} 
     */
    TrySilentDownloadAndInstallStorePackageUpdatesAsync(storePackageUpdates) {
        result := ComCall(8, this, "ptr", storePackageUpdates, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(StorePackageUpdateResult, (ptr) => IPropertyValue(ptr).GetStorePackageUpdateStatus(), operation)
    }

    /**
     * 
     * @param {Package} optionalPackage 
     * @returns {IAsyncOperation<StoreCanAcquireLicenseResult>} 
     */
    CanAcquireStoreLicenseForOptionalPackageAsync(optionalPackage) {
        result := ComCall(9, this, "ptr", optionalPackage, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreCanAcquireLicenseResult, operation)
    }

    /**
     * 
     * @param {HSTRING} productStoreId 
     * @returns {IAsyncOperation<StoreCanAcquireLicenseResult>} 
     */
    CanAcquireStoreLicenseAsync(productStoreId) {
        if(productStoreId is String) {
            pin := HSTRING.Create(productStoreId)
            productStoreId := pin.Value
        }
        productStoreId := productStoreId is Win32Handle ? NumGet(productStoreId, "ptr") : productStoreId

        result := ComCall(10, this, "ptr", productStoreId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreCanAcquireLicenseResult, operation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} productKinds 
     * @param {IIterable<HSTRING>} storeIds 
     * @param {StoreProductOptions} storeProductOptions_ 
     * @returns {IAsyncOperation<StoreProductQueryResult>} 
     */
    GetStoreProductsWithOptionsAsync(productKinds, storeIds, storeProductOptions_) {
        result := ComCall(11, this, "ptr", productKinds, "ptr", storeIds, "ptr", storeProductOptions_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreProductQueryResult, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<StoreQueueItem>>} 
     */
    GetAssociatedStoreQueueItemsAsync() {
        result := ComCall(12, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StoreQueueItem), operation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} storeIds 
     * @returns {IAsyncOperation<IVectorView<StoreQueueItem>>} 
     */
    GetStoreQueueItemsAsync(storeIds) {
        result := ComCall(13, this, "ptr", storeIds, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StoreQueueItem), operation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} storeIds 
     * @param {StorePackageInstallOptions} storePackageInstallOptions_ 
     * @returns {IAsyncOperationWithProgress<StorePackageUpdateResult, StorePackageUpdateStatus>} 
     */
    RequestDownloadAndInstallStorePackagesWithInstallOptionsAsync(storeIds, storePackageInstallOptions_) {
        result := ComCall(14, this, "ptr", storeIds, "ptr", storePackageInstallOptions_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(StorePackageUpdateResult, (ptr) => IPropertyValue(ptr).GetStorePackageUpdateStatus(), operation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} storeIds 
     * @returns {IAsyncOperationWithProgress<StorePackageUpdateResult, StorePackageUpdateStatus>} 
     */
    DownloadAndInstallStorePackagesAsync(storeIds) {
        result := ComCall(15, this, "ptr", storeIds, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(StorePackageUpdateResult, (ptr) => IPropertyValue(ptr).GetStorePackageUpdateStatus(), operation)
    }

    /**
     * 
     * @param {Package} package_ 
     * @returns {IAsyncOperation<StoreUninstallStorePackageResult>} 
     */
    RequestUninstallStorePackageAsync(package_) {
        result := ComCall(16, this, "ptr", package_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreUninstallStorePackageResult, operation)
    }

    /**
     * 
     * @param {HSTRING} storeId 
     * @returns {IAsyncOperation<StoreUninstallStorePackageResult>} 
     */
    RequestUninstallStorePackageByStoreIdAsync(storeId) {
        if(storeId is String) {
            pin := HSTRING.Create(storeId)
            storeId := pin.Value
        }
        storeId := storeId is Win32Handle ? NumGet(storeId, "ptr") : storeId

        result := ComCall(17, this, "ptr", storeId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreUninstallStorePackageResult, operation)
    }

    /**
     * 
     * @param {Package} package_ 
     * @returns {IAsyncOperation<StoreUninstallStorePackageResult>} 
     */
    UninstallStorePackageAsync(package_) {
        result := ComCall(18, this, "ptr", package_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreUninstallStorePackageResult, operation)
    }

    /**
     * 
     * @param {HSTRING} storeId 
     * @returns {IAsyncOperation<StoreUninstallStorePackageResult>} 
     */
    UninstallStorePackageByStoreIdAsync(storeId) {
        if(storeId is String) {
            pin := HSTRING.Create(storeId)
            storeId := pin.Value
        }
        storeId := storeId is Win32Handle ? NumGet(storeId, "ptr") : storeId

        result := ComCall(19, this, "ptr", storeId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreUninstallStorePackageResult, operation)
    }
}
