#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\AppInstallItem.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class IAppInstallManager3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallManager3
     * @type {Guid}
     */
    static IID => Guid("{95b24b17-e96a-4d0e-84e1-c8cb417a0178}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartProductInstallAsync", "StartProductInstallForUserAsync", "UpdateAppByPackageFamilyNameForUserAsync", "SearchForUpdatesForUserAsync", "SearchForAllUpdatesForUserAsync", "GetIsAppAllowedToInstallForUserAsync", "GetIsApplicableForUserAsync", "MoveToFrontOfDownloadQueue"]

    /**
     * 
     * @param {HSTRING} productId 
     * @param {HSTRING} catalogId 
     * @param {HSTRING} flightId 
     * @param {HSTRING} clientId 
     * @param {Boolean} repair 
     * @param {Boolean} forceUseOfNonRemovableStorage 
     * @param {HSTRING} correlationVector 
     * @param {PackageVolume} targetVolume 
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     */
    StartProductInstallAsync(productId, catalogId, flightId, clientId, repair, forceUseOfNonRemovableStorage, correlationVector, targetVolume) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId
        if(catalogId is String) {
            pin := HSTRING.Create(catalogId)
            catalogId := pin.Value
        }
        catalogId := catalogId is Win32Handle ? NumGet(catalogId, "ptr") : catalogId
        if(flightId is String) {
            pin := HSTRING.Create(flightId)
            flightId := pin.Value
        }
        flightId := flightId is Win32Handle ? NumGet(flightId, "ptr") : flightId
        if(clientId is String) {
            pin := HSTRING.Create(clientId)
            clientId := pin.Value
        }
        clientId := clientId is Win32Handle ? NumGet(clientId, "ptr") : clientId
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector

        result := ComCall(6, this, "ptr", productId, "ptr", catalogId, "ptr", flightId, "ptr", clientId, "int", repair, "int", forceUseOfNonRemovableStorage, "ptr", correlationVector, "ptr", targetVolume, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppInstallItem), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} productId 
     * @param {HSTRING} catalogId 
     * @param {HSTRING} flightId 
     * @param {HSTRING} clientId 
     * @param {Boolean} repair 
     * @param {Boolean} forceUseOfNonRemovableStorage 
     * @param {HSTRING} correlationVector 
     * @param {PackageVolume} targetVolume 
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     */
    StartProductInstallForUserAsync(user_, productId, catalogId, flightId, clientId, repair, forceUseOfNonRemovableStorage, correlationVector, targetVolume) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId
        if(catalogId is String) {
            pin := HSTRING.Create(catalogId)
            catalogId := pin.Value
        }
        catalogId := catalogId is Win32Handle ? NumGet(catalogId, "ptr") : catalogId
        if(flightId is String) {
            pin := HSTRING.Create(flightId)
            flightId := pin.Value
        }
        flightId := flightId is Win32Handle ? NumGet(flightId, "ptr") : flightId
        if(clientId is String) {
            pin := HSTRING.Create(clientId)
            clientId := pin.Value
        }
        clientId := clientId is Win32Handle ? NumGet(clientId, "ptr") : clientId
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector

        result := ComCall(7, this, "ptr", user_, "ptr", productId, "ptr", catalogId, "ptr", flightId, "ptr", clientId, "int", repair, "int", forceUseOfNonRemovableStorage, "ptr", correlationVector, "ptr", targetVolume, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppInstallItem), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} packageFamilyName 
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<AppInstallItem>} 
     */
    UpdateAppByPackageFamilyNameForUserAsync(user_, packageFamilyName, correlationVector) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector

        result := ComCall(8, this, "ptr", user_, "ptr", packageFamilyName, "ptr", correlationVector, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppInstallItem, operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} productId 
     * @param {HSTRING} skuId 
     * @param {HSTRING} catalogId 
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<AppInstallItem>} 
     */
    SearchForUpdatesForUserAsync(user_, productId, skuId, catalogId, correlationVector) {
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
        if(catalogId is String) {
            pin := HSTRING.Create(catalogId)
            catalogId := pin.Value
        }
        catalogId := catalogId is Win32Handle ? NumGet(catalogId, "ptr") : catalogId
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector

        result := ComCall(9, this, "ptr", user_, "ptr", productId, "ptr", skuId, "ptr", catalogId, "ptr", correlationVector, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppInstallItem, operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     */
    SearchForAllUpdatesForUserAsync(user_, correlationVector) {
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector

        result := ComCall(10, this, "ptr", user_, "ptr", correlationVector, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppInstallItem), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} productId 
     * @param {HSTRING} skuId 
     * @param {HSTRING} catalogId 
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<Boolean>} 
     */
    GetIsAppAllowedToInstallForUserAsync(user_, productId, skuId, catalogId, correlationVector) {
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
        if(catalogId is String) {
            pin := HSTRING.Create(catalogId)
            catalogId := pin.Value
        }
        catalogId := catalogId is Win32Handle ? NumGet(catalogId, "ptr") : catalogId
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector

        result := ComCall(11, this, "ptr", user_, "ptr", productId, "ptr", skuId, "ptr", catalogId, "ptr", correlationVector, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} productId 
     * @param {HSTRING} skuId 
     * @returns {IAsyncOperation<Boolean>} 
     */
    GetIsApplicableForUserAsync(user_, productId, skuId) {
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

        result := ComCall(12, this, "ptr", user_, "ptr", productId, "ptr", skuId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} productId 
     * @param {HSTRING} correlationVector 
     * @returns {HRESULT} 
     */
    MoveToFrontOfDownloadQueue(productId, correlationVector) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector

        result := ComCall(13, this, "ptr", productId, "ptr", correlationVector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
