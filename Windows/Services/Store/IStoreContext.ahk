#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\System\User.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\StoreAppLicense.ahk
#Include .\StoreProductResult.ahk
#Include .\StoreProductQueryResult.ahk
#Include .\StoreProductPagedQueryResult.ahk
#Include .\StoreConsumableResult.ahk
#Include .\StoreAcquireLicenseResult.ahk
#Include .\StorePurchaseResult.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\StorePackageUpdate.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\StorePackageUpdateResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class IStoreContext extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStoreContext
     * @type {Guid}
     */
    static IID => Guid("{ac98b6be-f4fd-4912-babd-5035e5e8bcab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_User", "add_OfflineLicensesChanged", "remove_OfflineLicensesChanged", "GetCustomerPurchaseIdAsync", "GetCustomerCollectionsIdAsync", "GetAppLicenseAsync", "GetStoreProductForCurrentAppAsync", "GetStoreProductsAsync", "GetAssociatedStoreProductsAsync", "GetAssociatedStoreProductsWithPagingAsync", "GetUserCollectionAsync", "GetUserCollectionWithPagingAsync", "ReportConsumableFulfillmentAsync", "GetConsumableBalanceRemainingAsync", "AcquireStoreLicenseForOptionalPackageAsync", "RequestPurchaseAsync", "RequestPurchaseWithPurchasePropertiesAsync", "GetAppAndOptionalStorePackageUpdatesAsync", "RequestDownloadStorePackageUpdatesAsync", "RequestDownloadAndInstallStorePackageUpdatesAsync", "RequestDownloadAndInstallStorePackagesAsync"]

    /**
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return User(value)
    }

    /**
     * 
     * @param {TypedEventHandler<StoreContext, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OfflineLicensesChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_OfflineLicensesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} serviceTicket 
     * @param {HSTRING} publisherUserId 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetCustomerPurchaseIdAsync(serviceTicket, publisherUserId) {
        if(serviceTicket is String) {
            pin := HSTRING.Create(serviceTicket)
            serviceTicket := pin.Value
        }
        serviceTicket := serviceTicket is Win32Handle ? NumGet(serviceTicket, "ptr") : serviceTicket
        if(publisherUserId is String) {
            pin := HSTRING.Create(publisherUserId)
            publisherUserId := pin.Value
        }
        publisherUserId := publisherUserId is Win32Handle ? NumGet(publisherUserId, "ptr") : publisherUserId

        result := ComCall(9, this, "ptr", serviceTicket, "ptr", publisherUserId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {HSTRING} serviceTicket 
     * @param {HSTRING} publisherUserId 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    GetCustomerCollectionsIdAsync(serviceTicket, publisherUserId) {
        if(serviceTicket is String) {
            pin := HSTRING.Create(serviceTicket)
            serviceTicket := pin.Value
        }
        serviceTicket := serviceTicket is Win32Handle ? NumGet(serviceTicket, "ptr") : serviceTicket
        if(publisherUserId is String) {
            pin := HSTRING.Create(publisherUserId)
            publisherUserId := pin.Value
        }
        publisherUserId := publisherUserId is Win32Handle ? NumGet(publisherUserId, "ptr") : publisherUserId

        result := ComCall(10, this, "ptr", serviceTicket, "ptr", publisherUserId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<StoreAppLicense>} 
     */
    GetAppLicenseAsync() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreAppLicense, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<StoreProductResult>} 
     */
    GetStoreProductForCurrentAppAsync() {
        result := ComCall(12, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreProductResult, operation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} productKinds 
     * @param {IIterable<HSTRING>} storeIds 
     * @returns {IAsyncOperation<StoreProductQueryResult>} 
     */
    GetStoreProductsAsync(productKinds, storeIds) {
        result := ComCall(13, this, "ptr", productKinds, "ptr", storeIds, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreProductQueryResult, operation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} productKinds 
     * @returns {IAsyncOperation<StoreProductQueryResult>} 
     */
    GetAssociatedStoreProductsAsync(productKinds) {
        result := ComCall(14, this, "ptr", productKinds, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreProductQueryResult, operation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} productKinds 
     * @param {Integer} maxItemsToRetrievePerPage 
     * @returns {IAsyncOperation<StoreProductPagedQueryResult>} 
     */
    GetAssociatedStoreProductsWithPagingAsync(productKinds, maxItemsToRetrievePerPage) {
        result := ComCall(15, this, "ptr", productKinds, "uint", maxItemsToRetrievePerPage, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreProductPagedQueryResult, operation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} productKinds 
     * @returns {IAsyncOperation<StoreProductQueryResult>} 
     */
    GetUserCollectionAsync(productKinds) {
        result := ComCall(16, this, "ptr", productKinds, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreProductQueryResult, operation)
    }

    /**
     * 
     * @param {IIterable<HSTRING>} productKinds 
     * @param {Integer} maxItemsToRetrievePerPage 
     * @returns {IAsyncOperation<StoreProductPagedQueryResult>} 
     */
    GetUserCollectionWithPagingAsync(productKinds, maxItemsToRetrievePerPage) {
        result := ComCall(17, this, "ptr", productKinds, "uint", maxItemsToRetrievePerPage, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreProductPagedQueryResult, operation)
    }

    /**
     * 
     * @param {HSTRING} productStoreId 
     * @param {Integer} quantity 
     * @param {Guid} trackingId 
     * @returns {IAsyncOperation<StoreConsumableResult>} 
     */
    ReportConsumableFulfillmentAsync(productStoreId, quantity, trackingId) {
        if(productStoreId is String) {
            pin := HSTRING.Create(productStoreId)
            productStoreId := pin.Value
        }
        productStoreId := productStoreId is Win32Handle ? NumGet(productStoreId, "ptr") : productStoreId

        result := ComCall(18, this, "ptr", productStoreId, "uint", quantity, "ptr", trackingId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreConsumableResult, operation)
    }

    /**
     * 
     * @param {HSTRING} productStoreId 
     * @returns {IAsyncOperation<StoreConsumableResult>} 
     */
    GetConsumableBalanceRemainingAsync(productStoreId) {
        if(productStoreId is String) {
            pin := HSTRING.Create(productStoreId)
            productStoreId := pin.Value
        }
        productStoreId := productStoreId is Win32Handle ? NumGet(productStoreId, "ptr") : productStoreId

        result := ComCall(19, this, "ptr", productStoreId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreConsumableResult, operation)
    }

    /**
     * 
     * @param {Package} optionalPackage 
     * @returns {IAsyncOperation<StoreAcquireLicenseResult>} 
     */
    AcquireStoreLicenseForOptionalPackageAsync(optionalPackage) {
        result := ComCall(20, this, "ptr", optionalPackage, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StoreAcquireLicenseResult, operation)
    }

    /**
     * 
     * @param {HSTRING} storeId 
     * @returns {IAsyncOperation<StorePurchaseResult>} 
     */
    RequestPurchaseAsync(storeId) {
        if(storeId is String) {
            pin := HSTRING.Create(storeId)
            storeId := pin.Value
        }
        storeId := storeId is Win32Handle ? NumGet(storeId, "ptr") : storeId

        result := ComCall(21, this, "ptr", storeId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorePurchaseResult, operation)
    }

    /**
     * 
     * @param {HSTRING} storeId 
     * @param {StorePurchaseProperties} storePurchaseProperties_ 
     * @returns {IAsyncOperation<StorePurchaseResult>} 
     */
    RequestPurchaseWithPurchasePropertiesAsync(storeId, storePurchaseProperties_) {
        if(storeId is String) {
            pin := HSTRING.Create(storeId)
            storeId := pin.Value
        }
        storeId := storeId is Win32Handle ? NumGet(storeId, "ptr") : storeId

        result := ComCall(22, this, "ptr", storeId, "ptr", storePurchaseProperties_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorePurchaseResult, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<StorePackageUpdate>>} 
     */
    GetAppAndOptionalStorePackageUpdatesAsync() {
        result := ComCall(23, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, StorePackageUpdate), operation)
    }

    /**
     * 
     * @param {IIterable<StorePackageUpdate>} storePackageUpdates 
     * @returns {IAsyncOperationWithProgress<StorePackageUpdateResult, StorePackageUpdateStatus>} 
     */
    RequestDownloadStorePackageUpdatesAsync(storePackageUpdates) {
        result := ComCall(24, this, "ptr", storePackageUpdates, "ptr*", &operation := 0, "int")
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
    RequestDownloadAndInstallStorePackageUpdatesAsync(storePackageUpdates) {
        result := ComCall(25, this, "ptr", storePackageUpdates, "ptr*", &operation := 0, "int")
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
    RequestDownloadAndInstallStorePackagesAsync(storeIds) {
        result := ComCall(26, this, "ptr", storeIds, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(StorePackageUpdateResult, (ptr) => IPropertyValue(ptr).GetStorePackageUpdateStatus(), operation)
    }
}
