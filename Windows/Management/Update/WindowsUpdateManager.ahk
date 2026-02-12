#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsUpdateManager.ahk
#Include .\IWindowsUpdateManager2.ahk
#Include .\IWindowsUpdateManagerFactory.ahk
#Include .\IWindowsUpdateManagerFactory2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\WindowsUpdateManager.ahk
#Include .\WindowsUpdateProgressChangedEventArgs.ahk
#Include .\WindowsUpdateAttentionRequiredReasonChangedEventArgs.ahk
#Include .\WindowsUpdateActionCompletedEventArgs.ahk
#Include .\WindowsUpdateScanCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Interface used for monitoring update activity via callbacks, and retrieving update history.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdatemanager
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsUpdateManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsUpdateManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Constructs a new [WindowsUpdateManager](./windowsupdatemanager.md) object.
     * @param {HSTRING} clientId Identifier used to distinguish the update manager instance.
     * @returns {WindowsUpdateManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdatemanager.#ctor
     */
    static CreateInstance(clientId) {
        if (!WindowsUpdateManager.HasProp("__IWindowsUpdateManagerFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsUpdateManagerFactory.IID)
            WindowsUpdateManager.__IWindowsUpdateManagerFactory := IWindowsUpdateManagerFactory(factoryPtr)
        }

        return WindowsUpdateManager.__IWindowsUpdateManagerFactory.CreateInstance(clientId)
    }

    /**
     * Constructs a new [WindowsUpdateManager](./windowsupdatemanager.md) object.
     * @param {HSTRING} clientId Identifier used to distinguish the update manager instance.
     * @param {Integer} providerIdFilter_length 
     * @param {Pointer<HSTRING>} providerIdFilter 
     * @returns {WindowsUpdateManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdatemanager.#ctor
     */
    static CreateInstance1(clientId, providerIdFilter_length, providerIdFilter) {
        if (!WindowsUpdateManager.HasProp("__IWindowsUpdateManagerFactory2")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsUpdateManagerFactory2.IID)
            WindowsUpdateManager.__IWindowsUpdateManagerFactory2 := IWindowsUpdateManagerFactory2(factoryPtr)
        }

        return WindowsUpdateManager.__IWindowsUpdateManagerFactory2.CreateInstance(clientId, providerIdFilter_length, providerIdFilter)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value indicating whether the [WindowsUpdateManager](./windowsupdatemanager.md) is actively scanning for updates.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdatemanager.isscanning
     * @type {Boolean} 
     */
    IsScanning {
        get => this.get_IsScanning()
    }

    /**
     * Gets a value indicating whether the [WindowsUpdateManager](./windowsupdatemanager.md) is actively working on updates.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdatemanager.isworking
     * @type {Boolean} 
     */
    IsWorking {
        get => this.get_IsWorking()
    }

    /**
     * Gets a value indicating the last successful scan timestamp from [WindowsUpdateManager](./windowsupdatemanager.md).
     * @remarks
     * The timestamp is reported in the local time of the device. If there has not yet been a successful scan, then the value returned is null.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdatemanager.lastsuccessfulscantimestamp
     * @type {IReference<DateTime>} 
     */
    LastSuccessfulScanTimestamp {
        get => this.get_LastSuccessfulScanTimestamp()
    }

    /**
     */
    ProviderIds {
        get => this.get_ProviderIds()
    }

    /**
     * Raised when the scanning state changes.
     * @remarks
     * Unlike the [ScanCompleted](./windowsupdatemanager_scancompleted.md) event, this event is also raised when a scan begins; so you can leverage it to detect the start of scan activity.
     * @type {TypedEventHandler<WindowsUpdateManager, IInspectable>}
    */
    OnScanningStateChanged {
        get {
            if(!this.HasProp("__OnScanningStateChanged")){
                this.__OnScanningStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b95a0a5d-28f1-50f5-914a-b55a1a84dcd8}"),
                    WindowsUpdateManager,
                    IInspectable
                )
                this.__OnScanningStateChangedToken := this.add_ScanningStateChanged(this.__OnScanningStateChanged.iface)
            }
            return this.__OnScanningStateChanged
        }
    }

    /**
     * Raised when the working state changes.
     * @type {TypedEventHandler<WindowsUpdateManager, IInspectable>}
    */
    OnWorkingStateChanged {
        get {
            if(!this.HasProp("__OnWorkingStateChanged")){
                this.__OnWorkingStateChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b95a0a5d-28f1-50f5-914a-b55a1a84dcd8}"),
                    WindowsUpdateManager,
                    IInspectable
                )
                this.__OnWorkingStateChangedToken := this.add_WorkingStateChanged(this.__OnWorkingStateChanged.iface)
            }
            return this.__OnWorkingStateChanged
        }
    }

    /**
     * Raised when the progress changes for an update.
     * @type {TypedEventHandler<WindowsUpdateManager, WindowsUpdateProgressChangedEventArgs>}
    */
    OnProgressChanged {
        get {
            if(!this.HasProp("__OnProgressChanged")){
                this.__OnProgressChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{61f35a11-50a1-5199-ac17-75206872fc4d}"),
                    WindowsUpdateManager,
                    WindowsUpdateProgressChangedEventArgs
                )
                this.__OnProgressChangedToken := this.add_ProgressChanged(this.__OnProgressChanged.iface)
            }
            return this.__OnProgressChanged
        }
    }

    /**
     * Raised when the attention required reason changed for an update.
     * @type {TypedEventHandler<WindowsUpdateManager, WindowsUpdateAttentionRequiredReasonChangedEventArgs>}
    */
    OnAttentionRequiredReasonChanged {
        get {
            if(!this.HasProp("__OnAttentionRequiredReasonChanged")){
                this.__OnAttentionRequiredReasonChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1b44e3b5-e822-5c75-85a9-4a3983bebdd8}"),
                    WindowsUpdateManager,
                    WindowsUpdateAttentionRequiredReasonChangedEventArgs
                )
                this.__OnAttentionRequiredReasonChangedToken := this.add_AttentionRequiredReasonChanged(this.__OnAttentionRequiredReasonChanged.iface)
            }
            return this.__OnAttentionRequiredReasonChanged
        }
    }

    /**
     * Raised when an action has been completed for an update.
     * @type {TypedEventHandler<WindowsUpdateManager, WindowsUpdateActionCompletedEventArgs>}
    */
    OnActionCompleted {
        get {
            if(!this.HasProp("__OnActionCompleted")){
                this.__OnActionCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a4f8bb0a-4633-5c2c-b4a2-5047e201cf07}"),
                    WindowsUpdateManager,
                    WindowsUpdateActionCompletedEventArgs
                )
                this.__OnActionCompletedToken := this.add_ActionCompleted(this.__OnActionCompleted.iface)
            }
            return this.__OnActionCompleted
        }
    }

    /**
     * Raised when a scan for updates completes.
     * @type {TypedEventHandler<WindowsUpdateManager, WindowsUpdateScanCompletedEventArgs>}
    */
    OnScanCompleted {
        get {
            if(!this.HasProp("__OnScanCompleted")){
                this.__OnScanCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{74625656-399b-5686-b24d-349f57880690}"),
                    WindowsUpdateManager,
                    WindowsUpdateScanCompletedEventArgs
                )
                this.__OnScanCompletedToken := this.add_ScanCompleted(this.__OnScanCompleted.iface)
            }
            return this.__OnScanCompleted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnScanningStateChangedToken")) {
            this.remove_ScanningStateChanged(this.__OnScanningStateChangedToken)
            this.__OnScanningStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnWorkingStateChangedToken")) {
            this.remove_WorkingStateChanged(this.__OnWorkingStateChangedToken)
            this.__OnWorkingStateChanged.iface.Dispose()
        }

        if(this.HasProp("__OnProgressChangedToken")) {
            this.remove_ProgressChanged(this.__OnProgressChangedToken)
            this.__OnProgressChanged.iface.Dispose()
        }

        if(this.HasProp("__OnAttentionRequiredReasonChangedToken")) {
            this.remove_AttentionRequiredReasonChanged(this.__OnAttentionRequiredReasonChangedToken)
            this.__OnAttentionRequiredReasonChanged.iface.Dispose()
        }

        if(this.HasProp("__OnActionCompletedToken")) {
            this.remove_ActionCompleted(this.__OnActionCompletedToken)
            this.__OnActionCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnScanCompletedToken")) {
            this.remove_ScanCompleted(this.__OnScanCompletedToken)
            this.__OnScanCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<WindowsUpdateManager, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScanningStateChanged(handler) {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.add_ScanningStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ScanningStateChanged(token) {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.remove_ScanningStateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WindowsUpdateManager, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WorkingStateChanged(handler) {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.add_WorkingStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_WorkingStateChanged(token) {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.remove_WorkingStateChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WindowsUpdateManager, WindowsUpdateProgressChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProgressChanged(handler) {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.add_ProgressChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ProgressChanged(token) {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.remove_ProgressChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WindowsUpdateManager, WindowsUpdateAttentionRequiredReasonChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AttentionRequiredReasonChanged(handler) {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.add_AttentionRequiredReasonChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AttentionRequiredReasonChanged(token) {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.remove_AttentionRequiredReasonChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WindowsUpdateManager, WindowsUpdateActionCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActionCompleted(handler) {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.add_ActionCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ActionCompleted(token) {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.remove_ActionCompleted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<WindowsUpdateManager, WindowsUpdateScanCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScanCompleted(handler) {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.add_ScanCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ScanCompleted(token) {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.remove_ScanCompleted(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScanning() {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.get_IsScanning()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWorking() {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.get_IsWorking()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_LastSuccessfulScanTimestamp() {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.get_LastSuccessfulScanTimestamp()
    }

    /**
     * Retrieves a list of all applicable updates currently known to the [WindowsUpdateManager](./windowsupdatemanager.md).
     * @remarks
     * If a [WindowsUpdateAdministrator](./windowsupdateadministrator.md) has been registered using [RequireAdministratorApprovalForUpdates](./windowsupdateadministratoroptions.md), then updates won't be considered applicable until they have been approved using [ApproveWindowsUpdate](./windowsupdateadministrator_approvewindowsupdate_1582950728.md).
     * @returns {IVectorView<WindowsUpdate>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdatemanager.getapplicableupdates
     */
    GetApplicableUpdates() {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.GetApplicableUpdates()
    }

    /**
     * Retrieves information about the most recently completed updates.
     * @param {Integer} count The number of recently completed updates to retrieve.
     * @returns {IVectorView<WindowsUpdateItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdatemanager.getmostrecentcompletedupdates
     */
    GetMostRecentCompletedUpdates(count) {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.GetMostRecentCompletedUpdates(count)
    }

    /**
     * Asynchronously retrieves information about the most recently completed updates.
     * @param {Integer} count The number of recently completed updates to retrieve.
     * @returns {IAsyncOperation<IVectorView<WindowsUpdateItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdatemanager.getmostrecentcompletedupdatesasync
     */
    GetMostRecentCompletedUpdatesAsync(count) {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.GetMostRecentCompletedUpdatesAsync(count)
    }

    /**
     * Initiates a new scan for updates on the device.
     * @remarks
     * If a scan is started with *userInitiated* set to `true`, then it will function the same as if a user had clicked "Check for updates" from the **Settings** page. That will result in the updates being processed at higher priority, and will bypass a variety of blocks that can apply to background scans.
     * 
     * If a [WindowsUpdateAdministrator](./windowsupdateadministrator.md) has been registered using [RequireAdministratorApprovalForScans](./windowsupdateadministratoroptions.md), then this scan attempt will be blocked, because only scans initiated via [StartAdministratorScan](./windowsupdateadministrator_startadministratorscan_459526238.md) are allowed in that mode.
     * @param {Boolean} userInitiated Specifies whether the scan should be performed as if initiated by a user.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdatemanager.startscan
     */
    StartScan(userInitiated) {
        if (!this.HasProp("__IWindowsUpdateManager")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager := IWindowsUpdateManager(outPtr)
        }

        return this.__IWindowsUpdateManager.StartScan(userInitiated)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @returns {WindowsSoftwareUpdateProvider} 
     */
    GetProvider(id) {
        if (!this.HasProp("__IWindowsUpdateManager2")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager2 := IWindowsUpdateManager2(outPtr)
        }

        return this.__IWindowsUpdateManager2.GetProvider(id)
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_ProviderIds(value) {
        if (!this.HasProp("__IWindowsUpdateManager2")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager2 := IWindowsUpdateManager2(outPtr)
        }

        return this.__IWindowsUpdateManager2.get_ProviderIds(value)
    }

    /**
     * 
     * @returns {IVectorView<WindowsSoftwareUpdate>} 
     */
    GetApplicableSoftwareUpdates() {
        if (!this.HasProp("__IWindowsUpdateManager2")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager2 := IWindowsUpdateManager2(outPtr)
        }

        return this.__IWindowsUpdateManager2.GetApplicableSoftwareUpdates()
    }

    /**
     * 
     * @param {WindowsUpdateManagerScanOptions} options 
     * @returns {WindowsSoftwareUpdateScanResult} 
     */
    PerformScan(options) {
        if (!this.HasProp("__IWindowsUpdateManager2")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateManager2 := IWindowsUpdateManager2(outPtr)
        }

        return this.__IWindowsUpdateManager2.PerformScan(options)
    }

;@endregion Instance Methods
}
