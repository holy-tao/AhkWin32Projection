#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppInstallItem.ahk
#Include .\IAppInstallItem2.ahk
#Include .\IAppInstallItem3.ahk
#Include .\IAppInstallItem4.ahk
#Include .\IAppInstallItem5.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\AppInstallItem.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents an app that is in the installation queue.
 * @remarks
 * Use the [AppInstallManager.AppInstallItems](appinstallmanager_appinstallitems.md) property to retrieve a vector view of AppInstallItem objects.
 * 
 * > [!IMPORTANT]
 * > Access to this API is protected by a private capability that is restricted to apps that are developed by Microsoft.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class AppInstallItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppInstallItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppInstallItem.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the product ID for the current app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.productid
     * @type {HSTRING} 
     */
    ProductId {
        get => this.get_ProductId()
    }

    /**
     * Gets the package family name for the current app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.packagefamilyname
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
    }

    /**
     * Gets the type of the current app install.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.installtype
     * @type {Integer} 
     */
    InstallType {
        get => this.get_InstallType()
    }

    /**
     * Indicates whether the current app install was initiated by the user.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.isuserinitiated
     * @type {Boolean} 
     */
    IsUserInitiated {
        get => this.get_IsUserInitiated()
    }

    /**
     * Retrieves information about app installs that are children of the current app install. This property only returns a value if the current app install is the parent of other app installs that are part of a the same app bundle.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.children
     * @type {IVectorView<AppInstallItem>} 
     */
    Children {
        get => this.get_Children()
    }

    /**
     * Indicates whether the current app install is part of an app bundle, and therefore pausing or canceling the app install might affect other items in the installation queue.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.itemoperationsmightaffectotheritems
     * @type {Boolean} 
     */
    ItemOperationsMightAffectOtherItems {
        get => this.get_ItemOperationsMightAffectOtherItems()
    }

    /**
     * Gets a value that indicates whether the app that is in the installation queue will be automatically launched after it is installed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.launchafterinstall
     * @type {Boolean} 
     */
    LaunchAfterInstall {
        get => this.get_LaunchAfterInstall()
        set => this.put_LaunchAfterInstall(value)
    }

    /**
     * Gets or sets a value that indicates whether the product being installed should be pinned to the desktop after installation is complete.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.pintodesktopafterinstall
     * @type {Boolean} 
     */
    PinToDesktopAfterInstall {
        get => this.get_PinToDesktopAfterInstall()
        set => this.put_PinToDesktopAfterInstall(value)
    }

    /**
     * Gets or sets a value that indicates whether the product being installed should be pinned to the **Start** menu after installation is complete.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.pintostartafterinstall
     * @type {Boolean} 
     */
    PinToStartAfterInstall {
        get => this.get_PinToStartAfterInstall()
        set => this.put_PinToStartAfterInstall(value)
    }

    /**
     * Gets or sets a value that indicates whether the product being installed should be pinned to the taskbar after installation is complete.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.pintotaskbarafterinstall
     * @type {Boolean} 
     */
    PinToTaskbarAfterInstall {
        get => this.get_PinToTaskbarAfterInstall()
        set => this.put_PinToTaskbarAfterInstall(value)
    }

    /**
     * Gets or sets the notification toast mode for when the app installation completes.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.completedinstalltoastnotificationmode
     * @type {Integer} 
     */
    CompletedInstallToastNotificationMode {
        get => this.get_CompletedInstallToastNotificationMode()
        set => this.put_CompletedInstallToastNotificationMode(value)
    }

    /**
     * Gets or sets the notification toast mode for when the app installation is in progress.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.installinprogresstoastnotificationmode
     * @type {Integer} 
     */
    InstallInProgressToastNotificationMode {
        get => this.get_InstallInProgressToastNotificationMode()
        set => this.put_InstallInProgressToastNotificationMode(value)
    }

    /**
     * Occurs when the installation of the current app has finished.
     * @type {TypedEventHandler<AppInstallItem, IInspectable>}
    */
    OnCompleted {
        get {
            if(!this.HasProp("__OnCompleted")){
                this.__OnCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{92730467-501e-5b05-8826-926f86925b03}"),
                    AppInstallItem,
                    IInspectable
                )
                this.__OnCompletedToken := this.add_Completed(this.__OnCompleted.iface)
            }
            return this.__OnCompleted
        }
    }

    /**
     * Occurs when the installation status of the current app has changed.
     * @type {TypedEventHandler<AppInstallItem, IInspectable>}
    */
    OnStatusChanged {
        get {
            if(!this.HasProp("__OnStatusChanged")){
                this.__OnStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{92730467-501e-5b05-8826-926f86925b03}"),
                    AppInstallItem,
                    IInspectable
                )
                this.__OnStatusChangedToken := this.add_StatusChanged(this.__OnStatusChanged.iface)
            }
            return this.__OnStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCompletedToken")) {
            this.remove_Completed(this.__OnCompletedToken)
            this.__OnCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnStatusChangedToken")) {
            this.remove_StatusChanged(this.__OnStatusChangedToken)
            this.__OnStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProductId() {
        if (!this.HasProp("__IAppInstallItem")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem := IAppInstallItem(outPtr)
        }

        return this.__IAppInstallItem.get_ProductId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        if (!this.HasProp("__IAppInstallItem")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem := IAppInstallItem(outPtr)
        }

        return this.__IAppInstallItem.get_PackageFamilyName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstallType() {
        if (!this.HasProp("__IAppInstallItem")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem := IAppInstallItem(outPtr)
        }

        return this.__IAppInstallItem.get_InstallType()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUserInitiated() {
        if (!this.HasProp("__IAppInstallItem")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem := IAppInstallItem(outPtr)
        }

        return this.__IAppInstallItem.get_IsUserInitiated()
    }

    /**
     * Gets the installation status of the current app.
     * @returns {AppInstallStatus} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.getcurrentstatus
     */
    GetCurrentStatus() {
        if (!this.HasProp("__IAppInstallItem")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem := IAppInstallItem(outPtr)
        }

        return this.__IAppInstallItem.GetCurrentStatus()
    }

    /**
     * Cancels the installation of the current app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.cancel
     */
    Cancel() {
        if (!this.HasProp("__IAppInstallItem")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem := IAppInstallItem(outPtr)
        }

        return this.__IAppInstallItem.Cancel()
    }

    /**
     * Pauses the installation of the current app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.pause
     */
    Pause() {
        if (!this.HasProp("__IAppInstallItem")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem := IAppInstallItem(outPtr)
        }

        return this.__IAppInstallItem.Pause()
    }

    /**
     * Restarts the installation of the current app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.restart
     */
    Restart() {
        if (!this.HasProp("__IAppInstallItem")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem := IAppInstallItem(outPtr)
        }

        return this.__IAppInstallItem.Restart()
    }

    /**
     * 
     * @param {TypedEventHandler<AppInstallItem, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Completed(handler) {
        if (!this.HasProp("__IAppInstallItem")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem := IAppInstallItem(outPtr)
        }

        return this.__IAppInstallItem.add_Completed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Completed(token) {
        if (!this.HasProp("__IAppInstallItem")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem := IAppInstallItem(outPtr)
        }

        return this.__IAppInstallItem.remove_Completed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppInstallItem, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(handler) {
        if (!this.HasProp("__IAppInstallItem")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem := IAppInstallItem(outPtr)
        }

        return this.__IAppInstallItem.add_StatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusChanged(token) {
        if (!this.HasProp("__IAppInstallItem")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem := IAppInstallItem(outPtr)
        }

        return this.__IAppInstallItem.remove_StatusChanged(token)
    }

    /**
     * Cancels the installation of the current app, with the option to generate telemetry data.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.cancel
     */
    CancelWithTelemetry(correlationVector) {
        if (!this.HasProp("__IAppInstallItem2")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem2 := IAppInstallItem2(outPtr)
        }

        return this.__IAppInstallItem2.CancelWithTelemetry(correlationVector)
    }

    /**
     * Pauses the installation of the current app, with the option to generate telemetry data.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.pause
     */
    PauseWithTelemetry(correlationVector) {
        if (!this.HasProp("__IAppInstallItem2")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem2 := IAppInstallItem2(outPtr)
        }

        return this.__IAppInstallItem2.PauseWithTelemetry(correlationVector)
    }

    /**
     * Restarts the installation of the current app, with the option to generate telemetry data.
     * @param {HSTRING} correlationVector A correlation vector string that can be used to generate telemetry data.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallitem.restart
     */
    RestartWithTelemetry(correlationVector) {
        if (!this.HasProp("__IAppInstallItem2")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem2 := IAppInstallItem2(outPtr)
        }

        return this.__IAppInstallItem2.RestartWithTelemetry(correlationVector)
    }

    /**
     * 
     * @returns {IVectorView<AppInstallItem>} 
     */
    get_Children() {
        if (!this.HasProp("__IAppInstallItem3")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem3 := IAppInstallItem3(outPtr)
        }

        return this.__IAppInstallItem3.get_Children()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ItemOperationsMightAffectOtherItems() {
        if (!this.HasProp("__IAppInstallItem3")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem3 := IAppInstallItem3(outPtr)
        }

        return this.__IAppInstallItem3.get_ItemOperationsMightAffectOtherItems()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LaunchAfterInstall() {
        if (!this.HasProp("__IAppInstallItem4")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem4 := IAppInstallItem4(outPtr)
        }

        return this.__IAppInstallItem4.get_LaunchAfterInstall()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_LaunchAfterInstall(value) {
        if (!this.HasProp("__IAppInstallItem4")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem4 := IAppInstallItem4(outPtr)
        }

        return this.__IAppInstallItem4.put_LaunchAfterInstall(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PinToDesktopAfterInstall() {
        if (!this.HasProp("__IAppInstallItem5")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem5 := IAppInstallItem5(outPtr)
        }

        return this.__IAppInstallItem5.get_PinToDesktopAfterInstall()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PinToDesktopAfterInstall(value) {
        if (!this.HasProp("__IAppInstallItem5")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem5 := IAppInstallItem5(outPtr)
        }

        return this.__IAppInstallItem5.put_PinToDesktopAfterInstall(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PinToStartAfterInstall() {
        if (!this.HasProp("__IAppInstallItem5")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem5 := IAppInstallItem5(outPtr)
        }

        return this.__IAppInstallItem5.get_PinToStartAfterInstall()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PinToStartAfterInstall(value) {
        if (!this.HasProp("__IAppInstallItem5")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem5 := IAppInstallItem5(outPtr)
        }

        return this.__IAppInstallItem5.put_PinToStartAfterInstall(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PinToTaskbarAfterInstall() {
        if (!this.HasProp("__IAppInstallItem5")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem5 := IAppInstallItem5(outPtr)
        }

        return this.__IAppInstallItem5.get_PinToTaskbarAfterInstall()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PinToTaskbarAfterInstall(value) {
        if (!this.HasProp("__IAppInstallItem5")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem5 := IAppInstallItem5(outPtr)
        }

        return this.__IAppInstallItem5.put_PinToTaskbarAfterInstall(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CompletedInstallToastNotificationMode() {
        if (!this.HasProp("__IAppInstallItem5")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem5 := IAppInstallItem5(outPtr)
        }

        return this.__IAppInstallItem5.get_CompletedInstallToastNotificationMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CompletedInstallToastNotificationMode(value) {
        if (!this.HasProp("__IAppInstallItem5")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem5 := IAppInstallItem5(outPtr)
        }

        return this.__IAppInstallItem5.put_CompletedInstallToastNotificationMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstallInProgressToastNotificationMode() {
        if (!this.HasProp("__IAppInstallItem5")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem5 := IAppInstallItem5(outPtr)
        }

        return this.__IAppInstallItem5.get_InstallInProgressToastNotificationMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InstallInProgressToastNotificationMode(value) {
        if (!this.HasProp("__IAppInstallItem5")) {
            if ((queryResult := this.QueryInterface(IAppInstallItem5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallItem5 := IAppInstallItem5(outPtr)
        }

        return this.__IAppInstallItem5.put_InstallInProgressToastNotificationMode(value)
    }

;@endregion Instance Methods
}
