#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include .\AppInstallItem.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class IAppInstallManager2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallManager2
     * @type {Guid}
     */
    static IID => Guid("{16937851-ed37-480d-8314-52e27c03f04a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartAppInstallWithTelemetryAsync", "UpdateAppByPackageFamilyNameWithTelemetryAsync", "SearchForUpdatesWithTelemetryAsync", "SearchForAllUpdatesWithTelemetryAsync", "GetIsAppAllowedToInstallWithTelemetryAsync", "CancelWithTelemetry", "PauseWithTelemetry", "RestartWithTelemetry"]

    /**
     * 
     * @param {HSTRING} productId 
     * @param {HSTRING} skuId 
     * @param {Boolean} repair 
     * @param {Boolean} forceUseOfNonRemovableStorage 
     * @param {HSTRING} catalogId 
     * @param {HSTRING} bundleId 
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<AppInstallItem>} 
     */
    StartAppInstallWithTelemetryAsync(productId, skuId, repair, forceUseOfNonRemovableStorage, catalogId, bundleId, correlationVector) {
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
        if(bundleId is String) {
            pin := HSTRING.Create(bundleId)
            bundleId := pin.Value
        }
        bundleId := bundleId is Win32Handle ? NumGet(bundleId, "ptr") : bundleId
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector

        result := ComCall(6, this, "ptr", productId, "ptr", skuId, "int", repair, "int", forceUseOfNonRemovableStorage, "ptr", catalogId, "ptr", bundleId, "ptr", correlationVector, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppInstallItem, operation)
    }

    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<AppInstallItem>} 
     */
    UpdateAppByPackageFamilyNameWithTelemetryAsync(packageFamilyName, correlationVector) {
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

        result := ComCall(7, this, "ptr", packageFamilyName, "ptr", correlationVector, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppInstallItem, operation)
    }

    /**
     * 
     * @param {HSTRING} productId 
     * @param {HSTRING} skuId 
     * @param {HSTRING} catalogId 
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<AppInstallItem>} 
     */
    SearchForUpdatesWithTelemetryAsync(productId, skuId, catalogId, correlationVector) {
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

        result := ComCall(8, this, "ptr", productId, "ptr", skuId, "ptr", catalogId, "ptr", correlationVector, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppInstallItem, operation)
    }

    /**
     * 
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     */
    SearchForAllUpdatesWithTelemetryAsync(correlationVector) {
        if(correlationVector is String) {
            pin := HSTRING.Create(correlationVector)
            correlationVector := pin.Value
        }
        correlationVector := correlationVector is Win32Handle ? NumGet(correlationVector, "ptr") : correlationVector

        result := ComCall(9, this, "ptr", correlationVector, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppInstallItem), operation)
    }

    /**
     * 
     * @param {HSTRING} productId 
     * @param {HSTRING} skuId 
     * @param {HSTRING} catalogId 
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<Boolean>} 
     */
    GetIsAppAllowedToInstallWithTelemetryAsync(productId, skuId, catalogId, correlationVector) {
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

        result := ComCall(10, this, "ptr", productId, "ptr", skuId, "ptr", catalogId, "ptr", correlationVector, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * Cancel Method (RDS)
     * @remarks
     * When you call **Cancel**, [ReadyState](./readystate-property-rds.md) is automatically set to **adcReadyStateLoaded**, and the [Recordset](../ado-api/recordset-object-ado.md) will be empty.
     * @param {HSTRING} productId 
     * @param {HSTRING} correlationVector 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/cancel-method-rds
     */
    CancelWithTelemetry(productId, correlationVector) {
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

        result := ComCall(11, this, "ptr", productId, "ptr", correlationVector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @param {HSTRING} productId 
     * @param {HSTRING} correlationVector 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/pause-method
     */
    PauseWithTelemetry(productId, correlationVector) {
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

        result := ComCall(12, this, "ptr", productId, "ptr", correlationVector, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Displays a dialog box that prompts the user to restart Windows. When the user clicks the button, the function calls ExitWindowsEx to attempt to restart Windows.
     * @param {HSTRING} productId 
     * @param {HSTRING} correlationVector 
     * @returns {HRESULT} Type: <b>int</b>
     * 
     * Returns the identifier of the button that was pressed to close the dialog box.
     * @see https://learn.microsoft.com/windows/win32/api//content/shlobj_core/nf-shlobj_core-restartdialog
     */
    RestartWithTelemetry(productId, correlationVector) {
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
