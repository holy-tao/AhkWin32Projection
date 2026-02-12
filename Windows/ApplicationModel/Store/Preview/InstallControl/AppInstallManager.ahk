#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppInstallManager.ahk
#Include .\IAppInstallManager2.ahk
#Include .\IAppInstallManager3.ahk
#Include .\IAppInstallManager4.ahk
#Include .\IAppInstallManager5.ahk
#Include .\IAppInstallManager6.ahk
#Include .\IAppInstallManager7.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\AppInstallManager.ahk
#Include .\AppInstallManagerItemEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides members for programmatically installing apps, including the ability to start an app install and get a list of app installs currently in progress.
 * @remarks
 * > [!IMPORTANT]
 * > Access to this API is protected by a private capability that is restricted to apps that are developed by Microsoft.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class AppInstallManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppInstallManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppInstallManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Retrieves information about all apps that are currently in the installation queue.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.appinstallitems
     * @type {IVectorView<AppInstallItem>} 
     */
    AppInstallItems {
        get => this.get_AppInstallItems()
    }

    /**
     * Gets or sets the auto update setting for apps on the current computer or device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.autoupdatesetting
     * @type {Integer} 
     */
    AutoUpdateSetting {
        get => this.get_AutoUpdateSetting()
        set => this.put_AutoUpdateSetting(value)
    }

    /**
     * Gets or sets the user identity associated with the app installs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.acquisitionidentity
     * @type {HSTRING} 
     */
    AcquisitionIdentity {
        get => this.get_AcquisitionIdentity()
        set => this.put_AcquisitionIdentity(value)
    }

    /**
     * Retrieves information about all the apps that are part of a single app bundle that is currently in the installation queue.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.appinstallitemswithgroupsupport
     * @type {IVectorView<AppInstallItem>} 
     */
    AppInstallItemsWithGroupSupport {
        get => this.get_AppInstallItemsWithGroupSupport()
    }

    /**
     * Gets or sets a value that indicates whether the calling app has elevated administrative privileges to ensure installing an app for all users will succeed.
     * @remarks
     * The calling app must have elevated admin privileges when installing an app for all users otherwise an Access Denied error will be thrown when attempted.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.caninstallforallusers
     * @type {Boolean} 
     */
    CanInstallForAllUsers {
        get => this.get_CanInstallForAllUsers()
    }

    /**
     * Occurs when an app has finished installing.
     * @type {TypedEventHandler<AppInstallManager, AppInstallManagerItemEventArgs>}
    */
    OnItemCompleted {
        get {
            if(!this.HasProp("__OnItemCompleted")){
                this.__OnItemCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{abf1c837-dacd-5446-a032-3ee902880244}"),
                    AppInstallManager,
                    AppInstallManagerItemEventArgs
                )
                this.__OnItemCompletedToken := this.add_ItemCompleted(this.__OnItemCompleted.iface)
            }
            return this.__OnItemCompleted
        }
    }

    /**
     * Occurs when the status of an app in the installation queue has changed.
     * @type {TypedEventHandler<AppInstallManager, AppInstallManagerItemEventArgs>}
    */
    OnItemStatusChanged {
        get {
            if(!this.HasProp("__OnItemStatusChanged")){
                this.__OnItemStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{abf1c837-dacd-5446-a032-3ee902880244}"),
                    AppInstallManager,
                    AppInstallManagerItemEventArgs
                )
                this.__OnItemStatusChangedToken := this.add_ItemStatusChanged(this.__OnItemStatusChanged.iface)
            }
            return this.__OnItemStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates and initializes a new instance of the [AppInstallManager](appinstallmanager.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.InstallControl.AppInstallManager")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnItemCompletedToken")) {
            this.remove_ItemCompleted(this.__OnItemCompletedToken)
            this.__OnItemCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnItemStatusChangedToken")) {
            this.remove_ItemStatusChanged(this.__OnItemStatusChangedToken)
            this.__OnItemStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {IVectorView<AppInstallItem>} 
     */
    get_AppInstallItems() {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.get_AppInstallItems()
    }

    /**
     * Cancels the installation of the specified app.
     * @param {HSTRING} productId The product ID of the app whose installation should be canceled.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.cancel
     */
    Cancel(productId) {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.Cancel(productId)
    }

    /**
     * Pauses the installation of the specified app.
     * @param {HSTRING} productId The product ID of the app whose installation should be paused.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.pause
     */
    Pause(productId) {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.Pause(productId)
    }

    /**
     * Restarts the installation of the specified app.
     * @param {HSTRING} productId The product ID of the app whose installation should be restarted.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.restart
     */
    Restart(productId) {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.Restart(productId)
    }

    /**
     * 
     * @param {TypedEventHandler<AppInstallManager, AppInstallManagerItemEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemCompleted(handler) {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.add_ItemCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ItemCompleted(token) {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.remove_ItemCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppInstallManager, AppInstallManagerItemEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ItemStatusChanged(handler) {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.add_ItemStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ItemStatusChanged(token) {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.remove_ItemStatusChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AutoUpdateSetting() {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.get_AutoUpdateSetting()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AutoUpdateSetting(value) {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.put_AutoUpdateSetting(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AcquisitionIdentity() {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.get_AcquisitionIdentity()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_AcquisitionIdentity(value) {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.put_AcquisitionIdentity(value)
    }

    /**
     * Determines whether the specified app can be installed on the current computer or device.
     * @param {HSTRING} productId The product ID of the app that this method will check to determine if it can be installed.
     * @param {HSTRING} skuId The SKU ID of the app that this method will check to determine if it can be installed.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.getisapplicableasync
     */
    GetIsApplicableAsync(productId, skuId) {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.GetIsApplicableAsync(productId, skuId)
    }

    /**
     * > [!NOTE]
     * > Please note that the `AppInstallManager.StartAppInstallAsync` method has been officially retired. Please refer to the [AppInstallManager](appinstallmanager.md) documentation for alternative APIs for your needs.
     * 
     * Starts the installation of the specified app.
     * @remarks
     * When this method successfully returns, the app has been added to the installation queue; it does not necessarily mean that the app has finished being installed. To determine the installation status, check the [GetCurrentStatus](appinstallitem_getcurrentstatus_1536936899.md) method of the [AppInstallItem](appinstallitem.md) return value.
     * @param {HSTRING} productId The product ID of the app to install.
     * @param {HSTRING} skuId The SKU ID of the app to install.
     * @param {Boolean} repair True to attempt to repair the installation of an app that is already installed; otherwise, false.
     * @param {Boolean} forceUseOfNonRemovableStorage True to install the app to non-removable storage even if the user has configured apps to install to SD card; false to install the app to non-removable storage or SD card according to the user's settings.
     * @returns {IAsyncOperation<AppInstallItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.startappinstallasync
     */
    StartAppInstallAsync(productId, skuId, repair, forceUseOfNonRemovableStorage) {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.StartAppInstallAsync(productId, skuId, repair, forceUseOfNonRemovableStorage)
    }

    /**
     * Starts the update of an app specified by the package family name, with the option to generate telemetry data.
     * @param {HSTRING} packageFamilyName The package family name of the app to update.
     * @returns {IAsyncOperation<AppInstallItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.updateappbypackagefamilynameasync
     */
    UpdateAppByPackageFamilyNameAsync(packageFamilyName) {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.UpdateAppByPackageFamilyNameAsync(packageFamilyName)
    }

    /**
     * Searches for updates for the specified app.
     * @param {HSTRING} productId The product ID of the app to be queried for updates.
     * @param {HSTRING} skuId The SKU to be queried for updates.
     * @returns {IAsyncOperation<AppInstallItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.searchforupdatesasync
     */
    SearchForUpdatesAsync(productId, skuId) {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.SearchForUpdatesAsync(productId, skuId)
    }

    /**
     * Searches for all available updates to apps installed on the current computer or device, with the option to generate telemetry data.
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.searchforallupdatesasync
     */
    SearchForAllUpdatesAsync() {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.SearchForAllUpdatesAsync()
    }

    /**
     * Determines whether the specified app is blocked by policy on the current computer or device.
     * @param {HSTRING} storeClientName The name of the app that this method will check to determine if is blocked by policy.
     * @param {HSTRING} storeClientPublisher The publisher name of the app that this method will check to determine if is blocked by policy.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.isstoreblockedbypolicyasync
     */
    IsStoreBlockedByPolicyAsync(storeClientName, storeClientPublisher) {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.IsStoreBlockedByPolicyAsync(storeClientName, storeClientPublisher)
    }

    /**
     * Determines whether the specified app has permission to install on the current computer or device.
     * @param {HSTRING} productId The product ID of the app that this method will check to determine if it has permission to be installed.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.getisappallowedtoinstallasync
     */
    GetIsAppAllowedToInstallAsync(productId) {
        if (!this.HasProp("__IAppInstallManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager := IAppInstallManager(outPtr)
        }

        return this.__IAppInstallManager.GetIsAppAllowedToInstallAsync(productId)
    }

    /**
     * > [!NOTE]
     * > Please note that the `AppInstallManager.StartAppInstallAsync` method has been officially retired. Please refer to the [AppInstallManager](appinstallmanager.md) documentation for alternative APIs for your needs.
     * 
     * Starts the installation of the specified app.
     * @remarks
     * When this method successfully returns, the app has been added to the installation queue; it does not necessarily mean that the app has finished being installed. To determine the installation status, check the [GetCurrentStatus](appinstallitem_getcurrentstatus_1536936899.md) method of the [AppInstallItem](appinstallitem.md) return value.
     * @param {HSTRING} productId The product ID of the app to install.
     * @param {HSTRING} skuId The SKU ID of the app to install.
     * @param {Boolean} repair True to attempt to repair the installation of an app that is already installed; otherwise, false.
     * @param {Boolean} forceUseOfNonRemovableStorage True to install the app to non-removable storage even if the user has configured apps to install to SD card; false to install the app to non-removable storage or SD card according to the user's settings.
     * @param {HSTRING} catalogId 
     * @param {HSTRING} bundleId 
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<AppInstallItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.startappinstallasync
     */
    StartAppInstallWithTelemetryAsync(productId, skuId, repair, forceUseOfNonRemovableStorage, catalogId, bundleId, correlationVector) {
        if (!this.HasProp("__IAppInstallManager2")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager2 := IAppInstallManager2(outPtr)
        }

        return this.__IAppInstallManager2.StartAppInstallWithTelemetryAsync(productId, skuId, repair, forceUseOfNonRemovableStorage, catalogId, bundleId, correlationVector)
    }

    /**
     * Starts the update of an app specified by the package family name.
     * @param {HSTRING} packageFamilyName The package family name of the app to update.
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<AppInstallItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.updateappbypackagefamilynameasync
     */
    UpdateAppByPackageFamilyNameWithTelemetryAsync(packageFamilyName, correlationVector) {
        if (!this.HasProp("__IAppInstallManager2")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager2 := IAppInstallManager2(outPtr)
        }

        return this.__IAppInstallManager2.UpdateAppByPackageFamilyNameWithTelemetryAsync(packageFamilyName, correlationVector)
    }

    /**
     * Searches for updates for the specified app, with the ability to allow a forced app restart and the option to generate telemetry data.
     * @param {HSTRING} productId The product ID of the app to be queried for updates.
     * @param {HSTRING} skuId The SKU ID of the app to be queried for updates.
     * @param {HSTRING} catalogId 
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @returns {IAsyncOperation<AppInstallItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.searchforupdatesasync
     */
    SearchForUpdatesWithTelemetryAsync(productId, skuId, catalogId, correlationVector) {
        if (!this.HasProp("__IAppInstallManager2")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager2 := IAppInstallManager2(outPtr)
        }

        return this.__IAppInstallManager2.SearchForUpdatesWithTelemetryAsync(productId, skuId, catalogId, correlationVector)
    }

    /**
     * Searches for all available updates to apps installed on the current computer or device.
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.searchforallupdatesasync
     */
    SearchForAllUpdatesWithTelemetryAsync(correlationVector) {
        if (!this.HasProp("__IAppInstallManager2")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager2 := IAppInstallManager2(outPtr)
        }

        return this.__IAppInstallManager2.SearchForAllUpdatesWithTelemetryAsync(correlationVector)
    }

    /**
     * Determines whether the specified app has permission to install on the current computer or device.
     * @param {HSTRING} productId The product ID of the app that this method will check to determine if it has permission to be installed.
     * @param {HSTRING} skuId 
     * @param {HSTRING} catalogId 
     * @param {HSTRING} correlationVector 
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.getisappallowedtoinstallasync
     */
    GetIsAppAllowedToInstallWithTelemetryAsync(productId, skuId, catalogId, correlationVector) {
        if (!this.HasProp("__IAppInstallManager2")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager2 := IAppInstallManager2(outPtr)
        }

        return this.__IAppInstallManager2.GetIsAppAllowedToInstallWithTelemetryAsync(productId, skuId, catalogId, correlationVector)
    }

    /**
     * Cancels the installation of the specified app, with the option to generate telemetry data.
     * @param {HSTRING} productId The product ID of the app whose installation should be canceled.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.cancel
     */
    CancelWithTelemetry(productId, correlationVector) {
        if (!this.HasProp("__IAppInstallManager2")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager2 := IAppInstallManager2(outPtr)
        }

        return this.__IAppInstallManager2.CancelWithTelemetry(productId, correlationVector)
    }

    /**
     * Pauses the installation of the specified app, with the option to generate telemetry data.
     * @param {HSTRING} productId The product ID of the app whose installation should be paused.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.pause
     */
    PauseWithTelemetry(productId, correlationVector) {
        if (!this.HasProp("__IAppInstallManager2")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager2 := IAppInstallManager2(outPtr)
        }

        return this.__IAppInstallManager2.PauseWithTelemetry(productId, correlationVector)
    }

    /**
     * Restarts the installation of the specified app, with the option to generate telemetry data.
     * @param {HSTRING} productId The product ID of the app whose installation should be restarted.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.restart
     */
    RestartWithTelemetry(productId, correlationVector) {
        if (!this.HasProp("__IAppInstallManager2")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager2 := IAppInstallManager2(outPtr)
        }

        return this.__IAppInstallManager2.RestartWithTelemetry(productId, correlationVector)
    }

    /**
     * Starts the installation of the specified app or app bundle, with the ability to specify additional install options such as whether to allow a forced app restart.
     * @param {HSTRING} productId The product ID of the app to install.
     * @param {HSTRING} catalogId 
     * @param {HSTRING} flightId The flight ID of the app to install.
     * @param {HSTRING} clientId The ID of the caller.
     * @param {Boolean} repair 
     * @param {Boolean} forceUseOfNonRemovableStorage 
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @param {PackageVolume} targetVolume 
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.startproductinstallasync
     */
    StartProductInstallAsync(productId, catalogId, flightId, clientId, repair, forceUseOfNonRemovableStorage, correlationVector, targetVolume) {
        if (!this.HasProp("__IAppInstallManager3")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager3 := IAppInstallManager3(outPtr)
        }

        return this.__IAppInstallManager3.StartProductInstallAsync(productId, catalogId, flightId, clientId, repair, forceUseOfNonRemovableStorage, correlationVector, targetVolume)
    }

    /**
     * Starts the installation of the specified app or app bundle for the specified user, with the ability to specify additional install options such as whether to allow a forced app restart.
     * @param {User} user_ An object that identifies the user to specify for this operation.
     * @param {HSTRING} productId The product ID of the app to install.
     * @param {HSTRING} catalogId 
     * @param {HSTRING} flightId The flight ID of the app to install.
     * @param {HSTRING} clientId The ID of the caller.
     * @param {Boolean} repair 
     * @param {Boolean} forceUseOfNonRemovableStorage 
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @param {PackageVolume} targetVolume 
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.startproductinstallforuserasync
     */
    StartProductInstallForUserAsync(user_, productId, catalogId, flightId, clientId, repair, forceUseOfNonRemovableStorage, correlationVector, targetVolume) {
        if (!this.HasProp("__IAppInstallManager3")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager3 := IAppInstallManager3(outPtr)
        }

        return this.__IAppInstallManager3.StartProductInstallForUserAsync(user_, productId, catalogId, flightId, clientId, repair, forceUseOfNonRemovableStorage, correlationVector, targetVolume)
    }

    /**
     * Starts the update of an app for a given user specified by the package family name, with the option to generate telemetry data.
     * @param {User} user_ An object that identifies the user to specify for this operation.
     * @param {HSTRING} packageFamilyName The package family name of the app to update.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @returns {IAsyncOperation<AppInstallItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.updateappbypackagefamilynameforuserasync
     */
    UpdateAppByPackageFamilyNameForUserAsync(user_, packageFamilyName, correlationVector) {
        if (!this.HasProp("__IAppInstallManager3")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager3 := IAppInstallManager3(outPtr)
        }

        return this.__IAppInstallManager3.UpdateAppByPackageFamilyNameForUserAsync(user_, packageFamilyName, correlationVector)
    }

    /**
     * Searches for updates for the specified app and user, with the ability to allow a forced app restart and the option to generate telemetry data.
     * @param {User} user_ An object that identifies the user to specify for this operation.
     * @param {HSTRING} productId The product ID of the app to be queried for updates.
     * @param {HSTRING} skuId The SKU ID of the app to be queried for updates.
     * @param {HSTRING} catalogId 
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @returns {IAsyncOperation<AppInstallItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.searchforupdatesforuserasync
     */
    SearchForUpdatesForUserAsync(user_, productId, skuId, catalogId, correlationVector) {
        if (!this.HasProp("__IAppInstallManager3")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager3 := IAppInstallManager3(outPtr)
        }

        return this.__IAppInstallManager3.SearchForUpdatesForUserAsync(user_, productId, skuId, catalogId, correlationVector)
    }

    /**
     * Searches for all available updates to apps installed on the current computer or device for the specified user, with the option to generate telemetry data.
     * @param {User} user_ An object that identifies the user to specify for this operation.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.searchforallupdatesforuserasync
     */
    SearchForAllUpdatesForUserAsync(user_, correlationVector) {
        if (!this.HasProp("__IAppInstallManager3")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager3 := IAppInstallManager3(outPtr)
        }

        return this.__IAppInstallManager3.SearchForAllUpdatesForUserAsync(user_, correlationVector)
    }

    /**
     * Determines whether the specified app has permission to install on the current computer or device for the specified user, with the option to generate telemetry data.
     * @param {User} user_ An object that identifies the user to specify for this operation.
     * @param {HSTRING} productId The product ID of the app that this method will check to determine if it has permission to be installed.
     * @param {HSTRING} skuId The SKU ID of the app that this method will check to determine if it has permission to be installed.
     * @param {HSTRING} catalogId The catalog ID of the app that this method will check to determine if it has permission to be installed.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.getisappallowedtoinstallforuserasync
     */
    GetIsAppAllowedToInstallForUserAsync(user_, productId, skuId, catalogId, correlationVector) {
        if (!this.HasProp("__IAppInstallManager3")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager3 := IAppInstallManager3(outPtr)
        }

        return this.__IAppInstallManager3.GetIsAppAllowedToInstallForUserAsync(user_, productId, skuId, catalogId, correlationVector)
    }

    /**
     * Determines whether the specified app can be installed on the current computer or device for the specified user.
     * @param {User} user_ An object that identifies the user to specify for this operation.
     * @param {HSTRING} productId The product ID of the app that this method will check to determine if it can be installed.
     * @param {HSTRING} skuId The SKU ID of the app that this method will check to determine if it can be installed.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.getisapplicableforuserasync
     */
    GetIsApplicableForUserAsync(user_, productId, skuId) {
        if (!this.HasProp("__IAppInstallManager3")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager3 := IAppInstallManager3(outPtr)
        }

        return this.__IAppInstallManager3.GetIsApplicableForUserAsync(user_, productId, skuId)
    }

    /**
     * Moves the specified app to the front of the download queue.
     * @param {HSTRING} productId The product ID of the app to move to the front of the download queue.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.movetofrontofdownloadqueue
     */
    MoveToFrontOfDownloadQueue(productId, correlationVector) {
        if (!this.HasProp("__IAppInstallManager3")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager3 := IAppInstallManager3(outPtr)
        }

        return this.__IAppInstallManager3.MoveToFrontOfDownloadQueue(productId, correlationVector)
    }

    /**
     * Grants a free entitlement for the specified app to the current user.
     * @param {HSTRING} storeId The Store ID of the app for which you want to grant the entitlement.
     * @param {HSTRING} campaignId The ID of the campaign that is associated with the entitlement.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @returns {IAsyncOperation<GetEntitlementResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.getfreeuserentitlementasync
     */
    GetFreeUserEntitlementAsync(storeId, campaignId, correlationVector) {
        if (!this.HasProp("__IAppInstallManager4")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager4 := IAppInstallManager4(outPtr)
        }

        return this.__IAppInstallManager4.GetFreeUserEntitlementAsync(storeId, campaignId, correlationVector)
    }

    /**
     * Grants a free entitlement for the specified app to the specified user.
     * @param {User} user_ A [Windows.System.User](../windows.system/user.md) object that represents the user to which you want to grant the entitlement.
     * @param {HSTRING} storeId The Store ID of the app for which you want to grant the entitlement.
     * @param {HSTRING} campaignId The ID of the campaign that is associated with the entitlement.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @returns {IAsyncOperation<GetEntitlementResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.getfreeuserentitlementforuserasync
     */
    GetFreeUserEntitlementForUserAsync(user_, storeId, campaignId, correlationVector) {
        if (!this.HasProp("__IAppInstallManager4")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager4 := IAppInstallManager4(outPtr)
        }

        return this.__IAppInstallManager4.GetFreeUserEntitlementForUserAsync(user_, storeId, campaignId, correlationVector)
    }

    /**
     * Grants a free entitlement for the specified app to all users on the current device.
     * @param {HSTRING} storeId The Store ID of the app for which you want to grant the entitlement.
     * @param {HSTRING} campaignId The ID of the campaign that is associated with the entitlement.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @returns {IAsyncOperation<GetEntitlementResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.getfreedeviceentitlementasync
     */
    GetFreeDeviceEntitlementAsync(storeId, campaignId, correlationVector) {
        if (!this.HasProp("__IAppInstallManager4")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager4 := IAppInstallManager4(outPtr)
        }

        return this.__IAppInstallManager4.GetFreeDeviceEntitlementAsync(storeId, campaignId, correlationVector)
    }

    /**
     * 
     * @returns {IVectorView<AppInstallItem>} 
     */
    get_AppInstallItemsWithGroupSupport() {
        if (!this.HasProp("__IAppInstallManager5")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager5 := IAppInstallManager5(outPtr)
        }

        return this.__IAppInstallManager5.get_AppInstallItemsWithGroupSupport()
    }

    /**
     * Searches for all available updates to apps installed on the current computer or device.
     * @param {HSTRING} correlationVector 
     * @param {HSTRING} clientId 
     * @param {AppUpdateOptions} updateOptions 
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.searchforallupdatesasync
     */
    SearchForAllUpdatesWithUpdateOptionsAsync(correlationVector, clientId, updateOptions) {
        if (!this.HasProp("__IAppInstallManager6")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager6 := IAppInstallManager6(outPtr)
        }

        return this.__IAppInstallManager6.SearchForAllUpdatesWithUpdateOptionsAsync(correlationVector, clientId, updateOptions)
    }

    /**
     * Searches for all available updates to apps installed on the current computer or device for the specified user, with the option to generate telemetry data.
     * @param {User} user_ An object that identifies the user to specify for this operation.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @param {HSTRING} clientId 
     * @param {AppUpdateOptions} updateOptions 
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.searchforallupdatesforuserasync
     */
    SearchForAllUpdatesWithUpdateOptionsForUserAsync(user_, correlationVector, clientId, updateOptions) {
        if (!this.HasProp("__IAppInstallManager6")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager6 := IAppInstallManager6(outPtr)
        }

        return this.__IAppInstallManager6.SearchForAllUpdatesWithUpdateOptionsForUserAsync(user_, correlationVector, clientId, updateOptions)
    }

    /**
     * Searches for updates for the specified app.
     * @param {HSTRING} productId The product ID of the app to be queried for updates.
     * @param {HSTRING} skuId The SKU to be queried for updates.
     * @param {HSTRING} correlationVector 
     * @param {HSTRING} clientId 
     * @param {AppUpdateOptions} updateOptions 
     * @returns {IAsyncOperation<AppInstallItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.searchforupdatesasync
     */
    SearchForUpdatesWithUpdateOptionsAsync(productId, skuId, correlationVector, clientId, updateOptions) {
        if (!this.HasProp("__IAppInstallManager6")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager6 := IAppInstallManager6(outPtr)
        }

        return this.__IAppInstallManager6.SearchForUpdatesWithUpdateOptionsAsync(productId, skuId, correlationVector, clientId, updateOptions)
    }

    /**
     * Searches for updates for the specified app and user, with the option to generate telemetry data.
     * @param {User} user_ An object that identifies the user to specify for this operation.
     * @param {HSTRING} productId The product ID of the app to be queried for updates.
     * @param {HSTRING} skuId The SKU ID of the app to be queried for updates.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @param {HSTRING} clientId 
     * @param {AppUpdateOptions} updateOptions 
     * @returns {IAsyncOperation<AppInstallItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.searchforupdatesforuserasync
     */
    SearchForUpdatesWithUpdateOptionsForUserAsync(user_, productId, skuId, correlationVector, clientId, updateOptions) {
        if (!this.HasProp("__IAppInstallManager6")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager6 := IAppInstallManager6(outPtr)
        }

        return this.__IAppInstallManager6.SearchForUpdatesWithUpdateOptionsForUserAsync(user_, productId, skuId, correlationVector, clientId, updateOptions)
    }

    /**
     * Starts the installation of the specified app or app bundle, with the ability to specify additional install options such as whether to allow a forced app restart.
     * @param {HSTRING} productId The product ID of the app to install.
     * @param {HSTRING} flightId The flight ID of the app to install.
     * @param {HSTRING} clientId The ID of the caller.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @param {AppInstallOptions} installOptions_ Provides additional options for the operation, including the ability to allow a forced app restart.
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.startproductinstallasync
     */
    StartProductInstallWithOptionsAsync(productId, flightId, clientId, correlationVector, installOptions_) {
        if (!this.HasProp("__IAppInstallManager6")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager6 := IAppInstallManager6(outPtr)
        }

        return this.__IAppInstallManager6.StartProductInstallWithOptionsAsync(productId, flightId, clientId, correlationVector, installOptions_)
    }

    /**
     * Starts the installation of the specified app or app bundle for the specified user, with the ability to specify additional install options such as whether to allow a forced app restart.
     * @param {User} user_ An object that identifies the user to specify for this operation.
     * @param {HSTRING} productId The product ID of the app to install.
     * @param {HSTRING} flightId The flight ID of the app to install.
     * @param {HSTRING} clientId The ID of the caller.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @param {AppInstallOptions} installOptions_ Provides additional options for the operation, including the ability to allow a forced app restart.
     * @returns {IAsyncOperation<IVectorView<AppInstallItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.startproductinstallforuserasync
     */
    StartProductInstallWithOptionsForUserAsync(user_, productId, flightId, clientId, correlationVector, installOptions_) {
        if (!this.HasProp("__IAppInstallManager6")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager6 := IAppInstallManager6(outPtr)
        }

        return this.__IAppInstallManager6.StartProductInstallWithOptionsForUserAsync(user_, productId, flightId, clientId, correlationVector, installOptions_)
    }

    /**
     * Returns a value that indicates whether the package with the specified identity info is allowed to be installed on the current device.
     * @remarks
     * For more details about identity names and publisher names, see [Identity](/uwp/schemas/appxpackage/uapmanifestschema/element-identity) in the package manifest schema reference.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data for the operation.
     * @param {HSTRING} packageIdentityName The identity name of the package, as specified in the package manifest.
     * @param {HSTRING} publisherCertificateName The publisher name of the package, as specified in the package manifest.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.getispackageidentityallowedtoinstallasync
     */
    GetIsPackageIdentityAllowedToInstallAsync(correlationVector, packageIdentityName, publisherCertificateName) {
        if (!this.HasProp("__IAppInstallManager6")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager6 := IAppInstallManager6(outPtr)
        }

        return this.__IAppInstallManager6.GetIsPackageIdentityAllowedToInstallAsync(correlationVector, packageIdentityName, publisherCertificateName)
    }

    /**
     * Returns a value that indicates whether the package with the specified identity info is allowed to be installed on the current device for the specified user.
     * @remarks
     * For more details about identity names and publisher names, see [Identity](/uwp/schemas/appxpackage/uapmanifestschema/element-identity) in the package manifest schema reference.
     * @param {User} user_ An object that identifies the user to specify for this operation.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data for the operation.
     * @param {HSTRING} packageIdentityName The identity name of the package, as specified in the package manifest.
     * @param {HSTRING} publisherCertificateName The publisher name of the package, as specified in the package manifest.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallmanager.getispackageidentityallowedtoinstallforuserasync
     */
    GetIsPackageIdentityAllowedToInstallForUserAsync(user_, correlationVector, packageIdentityName, publisherCertificateName) {
        if (!this.HasProp("__IAppInstallManager6")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager6 := IAppInstallManager6(outPtr)
        }

        return this.__IAppInstallManager6.GetIsPackageIdentityAllowedToInstallForUserAsync(user_, correlationVector, packageIdentityName, publisherCertificateName)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanInstallForAllUsers() {
        if (!this.HasProp("__IAppInstallManager7")) {
            if ((queryResult := this.QueryInterface(IAppInstallManager7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallManager7 := IAppInstallManager7(outPtr)
        }

        return this.__IAppInstallManager7.get_CanInstallForAllUsers()
    }

;@endregion Instance Methods
}
