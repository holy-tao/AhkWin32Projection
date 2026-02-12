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
class IAppInstallManager6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallManager6
     * @type {Guid}
     */
    static IID => Guid("{c9e7d408-f27a-4471-b2f4-e76efcbebcca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SearchForAllUpdatesWithUpdateOptionsAsync", "SearchForAllUpdatesWithUpdateOptionsForUserAsync", "SearchForUpdatesWithUpdateOptionsAsync", "SearchForUpdatesWithUpdateOptionsForUserAsync", "StartProductInstallWithOptionsAsync", "StartProductInstallWithOptionsForUserAsync", "GetIsPackageIdentityAllowedToInstallAsync", "GetIsPackageIdentityAllowedToInstallForUserAsync"]

    /**
     * 
     * @param {HSTRING} correlationVector 
     * @param {HSTRING} clientId 
     * @param {AppUpdateOptions} updateOptions 
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     */
    SearchForAllUpdatesWithUpdateOptionsAsync(correlationVector, clientId, updateOptions) {
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector
        if(clientId is String) {
            pin := HSTRING.Create(clientId)
            clientId := pin.Value
        }
        clientId := clientId is Win32Handle ? NumGet(clientId, "ptr") : clientId

        result := ComCall(6, this, "ptr", correlationVector, "ptr", clientId, "ptr", updateOptions, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppInstallItem), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} correlationVector 
     * @param {HSTRING} clientId 
     * @param {AppUpdateOptions} updateOptions 
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     */
    SearchForAllUpdatesWithUpdateOptionsForUserAsync(user_, correlationVector, clientId, updateOptions) {
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector
        if(clientId is String) {
            pin := HSTRING.Create(clientId)
            clientId := pin.Value
        }
        clientId := clientId is Win32Handle ? NumGet(clientId, "ptr") : clientId

        result := ComCall(7, this, "ptr", user_, "ptr", correlationVector, "ptr", clientId, "ptr", updateOptions, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppInstallItem), operation)
    }

    /**
     * 
     * @param {HSTRING} productId 
     * @param {HSTRING} skuId 
     * @param {HSTRING} correlationVector 
     * @param {HSTRING} clientId 
     * @param {AppUpdateOptions} updateOptions 
     * @returns {IAsyncOperation<AppInstallItem>} 
     */
    SearchForUpdatesWithUpdateOptionsAsync(productId, skuId, correlationVector, clientId, updateOptions) {
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
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector
        if(clientId is String) {
            pin := HSTRING.Create(clientId)
            clientId := pin.Value
        }
        clientId := clientId is Win32Handle ? NumGet(clientId, "ptr") : clientId

        result := ComCall(8, this, "ptr", productId, "ptr", skuId, "ptr", correlationVector, "ptr", clientId, "ptr", updateOptions, "ptr*", &operation := 0, "int")
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
     * @param {HSTRING} correlationVector 
     * @param {HSTRING} clientId 
     * @param {AppUpdateOptions} updateOptions 
     * @returns {IAsyncOperation<AppInstallItem>} 
     */
    SearchForUpdatesWithUpdateOptionsForUserAsync(user_, productId, skuId, correlationVector, clientId, updateOptions) {
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
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector
        if(clientId is String) {
            pin := HSTRING.Create(clientId)
            clientId := pin.Value
        }
        clientId := clientId is Win32Handle ? NumGet(clientId, "ptr") : clientId

        result := ComCall(9, this, "ptr", user_, "ptr", productId, "ptr", skuId, "ptr", correlationVector, "ptr", clientId, "ptr", updateOptions, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppInstallItem, operation)
    }

    /**
     * 
     * @param {HSTRING} productId 
     * @param {HSTRING} flightId 
     * @param {HSTRING} clientId 
     * @param {HSTRING} correlationVector 
     * @param {AppInstallOptions} installOptions_ 
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     */
    StartProductInstallWithOptionsAsync(productId, flightId, clientId, correlationVector, installOptions_) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId
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

        result := ComCall(10, this, "ptr", productId, "ptr", flightId, "ptr", clientId, "ptr", correlationVector, "ptr", installOptions_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppInstallItem), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} productId 
     * @param {HSTRING} flightId 
     * @param {HSTRING} clientId 
     * @param {HSTRING} correlationVector 
     * @param {AppInstallOptions} installOptions_ 
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     */
    StartProductInstallWithOptionsForUserAsync(user_, productId, flightId, clientId, correlationVector, installOptions_) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId
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

        result := ComCall(11, this, "ptr", user_, "ptr", productId, "ptr", flightId, "ptr", clientId, "ptr", correlationVector, "ptr", installOptions_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppInstallItem), operation)
    }

    /**
     * 
     * @param {HSTRING} correlationVector 
     * @param {HSTRING} packageIdentityName 
     * @param {HSTRING} publisherCertificateName 
     * @returns {IAsyncOperation<Boolean>} 
     */
    GetIsPackageIdentityAllowedToInstallAsync(correlationVector, packageIdentityName, publisherCertificateName) {
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector
        if(packageIdentityName is String) {
            pin := HSTRING.Create(packageIdentityName)
            packageIdentityName := pin.Value
        }
        packageIdentityName := packageIdentityName is Win32Handle ? NumGet(packageIdentityName, "ptr") : packageIdentityName
        if(publisherCertificateName is String) {
            pin := HSTRING.Create(publisherCertificateName)
            publisherCertificateName := pin.Value
        }
        publisherCertificateName := publisherCertificateName is Win32Handle ? NumGet(publisherCertificateName, "ptr") : publisherCertificateName

        result := ComCall(12, this, "ptr", correlationVector, "ptr", packageIdentityName, "ptr", publisherCertificateName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} correlationVector 
     * @param {HSTRING} packageIdentityName 
     * @param {HSTRING} publisherCertificateName 
     * @returns {IAsyncOperation<Boolean>} 
     */
    GetIsPackageIdentityAllowedToInstallForUserAsync(user_, correlationVector, packageIdentityName, publisherCertificateName) {
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector
        if(packageIdentityName is String) {
            pin := HSTRING.Create(packageIdentityName)
            packageIdentityName := pin.Value
        }
        packageIdentityName := packageIdentityName is Win32Handle ? NumGet(packageIdentityName, "ptr") : packageIdentityName
        if(publisherCertificateName is String) {
            pin := HSTRING.Create(publisherCertificateName)
            publisherCertificateName := pin.Value
        }
        publisherCertificateName := publisherCertificateName is Win32Handle ? NumGet(publisherCertificateName, "ptr") : publisherCertificateName

        result := ComCall(13, this, "ptr", user_, "ptr", correlationVector, "ptr", packageIdentityName, "ptr", publisherCertificateName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
