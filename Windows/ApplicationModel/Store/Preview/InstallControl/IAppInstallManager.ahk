#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\AppInstallItem.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class IAppInstallManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallManager
     * @type {Guid}
     */
    static IID => Guid("{9353e170-8441-4b45-bd72-7c2fa925beee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppInstallItems", "Cancel", "Pause", "Restart", "add_ItemCompleted", "remove_ItemCompleted", "add_ItemStatusChanged", "remove_ItemStatusChanged", "get_AutoUpdateSetting", "put_AutoUpdateSetting", "get_AcquisitionIdentity", "put_AcquisitionIdentity", "GetIsApplicableAsync", "StartAppInstallAsync", "UpdateAppByPackageFamilyNameAsync", "SearchForUpdatesAsync", "SearchForAllUpdatesAsync", "IsStoreBlockedByPolicyAsync", "GetIsAppAllowedToInstallAsync"]

    /**
     * @type {IVectorView<AppInstallItem>} 
     */
    AppInstallItems {
        get => this.get_AppInstallItems()
    }

    /**
     * @type {Integer} 
     */
    AutoUpdateSetting {
        get => this.get_AutoUpdateSetting()
        set => this.put_AutoUpdateSetting(value)
    }

    /**
     * @type {HSTRING} 
     */
    AcquisitionIdentity {
        get => this.get_AcquisitionIdentity()
        set => this.put_AcquisitionIdentity(value)
    }

    /**
     * 
     * @returns {IVectorView<AppInstallItem>} 
     */
    get_AppInstallItems() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AppInstallItem, value)
    }

    /**
     * Cancel Method (RDS)
     * @remarks
     * When you call **Cancel**, [ReadyState](./readystate-property-rds.md) is automatically set to **adcReadyStateLoaded**, and the [Recordset](../ado-api/recordset-object-ado.md) will be empty.
     * @param {HSTRING} productId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/cancel-method-rds
     */
    Cancel(productId) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId

        result := ComCall(7, this, "ptr", productId, "int")
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
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/pause-method
     */
    Pause(productId) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId

        result := ComCall(8, this, "ptr", productId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Displays a dialog box that prompts the user to restart Windows. When the user clicks the button, the function calls ExitWindowsEx to attempt to restart Windows.
     * @param {HSTRING} productId 
     * @returns {HRESULT} Type: <b>int</b>
     * 
     * Returns the identifier of the button that was pressed to close the dialog box.
     * @see https://learn.microsoft.com/windows/win32/api//content/shlobj_core/nf-shlobj_core-restartdialog
     */
    Restart(productId) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId

        result := ComCall(9, this, "ptr", productId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppInstallManager, AppInstallManagerItemEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", token, "int")
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
    remove_ItemCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(11, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<AppInstallManager, AppInstallManagerItemEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemStatusChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", handler, "ptr", token, "int")
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
    remove_ItemStatusChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AutoUpdateSetting() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AutoUpdateSetting(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AcquisitionIdentity() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AcquisitionIdentity(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} productId 
     * @param {HSTRING} skuId 
     * @returns {IAsyncOperation<Boolean>} 
     */
    GetIsApplicableAsync(productId, skuId) {
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

        result := ComCall(18, this, "ptr", productId, "ptr", skuId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} productId 
     * @param {HSTRING} skuId 
     * @param {Boolean} repair 
     * @param {Boolean} forceUseOfNonRemovableStorage 
     * @returns {IAsyncOperation<AppInstallItem>} 
     */
    StartAppInstallAsync(productId, skuId, repair, forceUseOfNonRemovableStorage) {
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

        result := ComCall(19, this, "ptr", productId, "ptr", skuId, "int", repair, "int", forceUseOfNonRemovableStorage, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppInstallItem, operation)
    }

    /**
     * 
     * @param {HSTRING} packageFamilyName 
     * @returns {IAsyncOperation<AppInstallItem>} 
     */
    UpdateAppByPackageFamilyNameAsync(packageFamilyName) {
        if(packageFamilyName is String) {
            pin := HSTRING.Create(packageFamilyName)
            packageFamilyName := pin.Value
        }
        packageFamilyName := packageFamilyName is Win32Handle ? NumGet(packageFamilyName, "ptr") : packageFamilyName

        result := ComCall(20, this, "ptr", packageFamilyName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppInstallItem, operation)
    }

    /**
     * 
     * @param {HSTRING} productId 
     * @param {HSTRING} skuId 
     * @returns {IAsyncOperation<AppInstallItem>} 
     */
    SearchForUpdatesAsync(productId, skuId) {
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

        result := ComCall(21, this, "ptr", productId, "ptr", skuId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(AppInstallItem, operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     */
    SearchForAllUpdatesAsync() {
        result := ComCall(22, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AppInstallItem), operation)
    }

    /**
     * 
     * @param {HSTRING} storeClientName 
     * @param {HSTRING} storeClientPublisher 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsStoreBlockedByPolicyAsync(storeClientName, storeClientPublisher) {
        if(storeClientName is String) {
            pin := HSTRING.Create(storeClientName)
            storeClientName := pin.Value
        }
        storeClientName := storeClientName is Win32Handle ? NumGet(storeClientName, "ptr") : storeClientName
        if(storeClientPublisher is String) {
            pin := HSTRING.Create(storeClientPublisher)
            storeClientPublisher := pin.Value
        }
        storeClientPublisher := storeClientPublisher is Win32Handle ? NumGet(storeClientPublisher, "ptr") : storeClientPublisher

        result := ComCall(23, this, "ptr", storeClientName, "ptr", storeClientPublisher, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} productId 
     * @returns {IAsyncOperation<Boolean>} 
     */
    GetIsAppAllowedToInstallAsync(productId) {
        if(productId is String) {
            pin := HSTRING.Create(productId)
            productId := pin.Value
        }
        productId := productId is Win32Handle ? NumGet(productId, "ptr") : productId

        result := ComCall(24, this, "ptr", productId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
