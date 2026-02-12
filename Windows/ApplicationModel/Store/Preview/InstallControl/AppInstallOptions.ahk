#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppInstallOptions.ahk
#Include .\IAppInstallOptions2.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides options you can use in several method overloads of the [AppInstallManager](appinstallmanager.md) class for installing app updates.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class AppInstallOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppInstallOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppInstallOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the catalog ID of the app to install.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions.catalogid
     * @type {HSTRING} 
     */
    CatalogId {
        get => this.get_CatalogId()
        set => this.put_CatalogId(value)
    }

    /**
     * Gets or sets a value that indicates whether to install the app to non-removable storage even if the user has configured apps to install to SD card, or whether to install the app to non-removable storage or SD card according to the user's settings.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions.forceuseofnonremovablestorage
     * @type {Boolean} 
     */
    ForceUseOfNonRemovableStorage {
        get => this.get_ForceUseOfNonRemovableStorage()
        set => this.put_ForceUseOfNonRemovableStorage(value)
    }

    /**
     * Gets or sets a value that indicates whether to allow a forced restart of the app that is being installed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions.allowforcedapprestart
     * @type {Boolean} 
     */
    AllowForcedAppRestart {
        get => this.get_AllowForcedAppRestart()
        set => this.put_AllowForcedAppRestart(value)
    }

    /**
     * Gets or sets a value that indicates whether to attempt to repair the installation of an app that is already installed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions.repair
     * @type {Boolean} 
     */
    Repair {
        get => this.get_Repair()
        set => this.put_Repair(value)
    }

    /**
     * Gets or sets the package storage volume where the app or app bundle will be installed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions.targetvolume
     * @type {PackageVolume} 
     */
    TargetVolume {
        get => this.get_TargetVolume()
        set => this.put_TargetVolume(value)
    }

    /**
     * Gets or sets a value that indicates whether to automatically launch the app after it is installed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions.launchafterinstall
     * @type {Boolean} 
     */
    LaunchAfterInstall {
        get => this.get_LaunchAfterInstall()
        set => this.put_LaunchAfterInstall(value)
    }

    /**
     * Gets or sets a value that determines whether the product being installed should be pinned to the desktop after installation is complete.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions.pintodesktopafterinstall
     * @type {Boolean} 
     */
    PinToDesktopAfterInstall {
        get => this.get_PinToDesktopAfterInstall()
        set => this.put_PinToDesktopAfterInstall(value)
    }

    /**
     * Gets or sets a value that indicates whether the product being installed should be pinned to the **Start** menu after installation is complete.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions.pintostartafterinstall
     * @type {Boolean} 
     */
    PinToStartAfterInstall {
        get => this.get_PinToStartAfterInstall()
        set => this.put_PinToStartAfterInstall(value)
    }

    /**
     * Gets or sets a value that indicates whether the product being installed should be pinned to the taskbar after installation is complete.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions.pintotaskbarafterinstall
     * @type {Boolean} 
     */
    PinToTaskbarAfterInstall {
        get => this.get_PinToTaskbarAfterInstall()
        set => this.put_PinToTaskbarAfterInstall(value)
    }

    /**
     * Gets or sets the notification toast mode for when the app installation completes.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions.completedinstalltoastnotificationmode
     * @type {Integer} 
     */
    CompletedInstallToastNotificationMode {
        get => this.get_CompletedInstallToastNotificationMode()
        set => this.put_CompletedInstallToastNotificationMode(value)
    }

    /**
     * Gets or sets the notification toast mode for when the app installation is in progress.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions.installinprogresstoastnotificationmode
     * @type {Integer} 
     */
    InstallInProgressToastNotificationMode {
        get => this.get_InstallInProgressToastNotificationMode()
        set => this.put_InstallInProgressToastNotificationMode(value)
    }

    /**
     * Gets or sets a value that indicates whether the application will be installed for all users.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions.installforallusers
     * @type {Boolean} 
     */
    InstallForAllUsers {
        get => this.get_InstallForAllUsers()
        set => this.put_InstallForAllUsers(value)
    }

    /**
     * Gets or sets a value that indicates whether the installation of the app should pause after the download and staging step but not complete the final install.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions.stagebutdonotinstall
     * @type {Boolean} 
     */
    StageButDoNotInstall {
        get => this.get_StageButDoNotInstall()
        set => this.put_StageButDoNotInstall(value)
    }

    /**
     * Gets or sets the promotion campaign ID that is associated with the app to install.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions.campaignid
     * @type {HSTRING} 
     */
    CampaignId {
        get => this.get_CampaignId()
        set => this.put_CampaignId(value)
    }

    /**
     * Gets or sets the extended promotion campaign ID that is associated with the app to install.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstalloptions.extendedcampaignid
     * @type {HSTRING} 
     */
    ExtendedCampaignId {
        get => this.get_ExtendedCampaignId()
        set => this.put_ExtendedCampaignId(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates and initializes a new instance of the [AppInstallOptions](appinstalloptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Store.Preview.InstallControl.AppInstallOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CatalogId() {
        if (!this.HasProp("__IAppInstallOptions")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions := IAppInstallOptions(outPtr)
        }

        return this.__IAppInstallOptions.get_CatalogId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CatalogId(value) {
        if (!this.HasProp("__IAppInstallOptions")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions := IAppInstallOptions(outPtr)
        }

        return this.__IAppInstallOptions.put_CatalogId(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceUseOfNonRemovableStorage() {
        if (!this.HasProp("__IAppInstallOptions")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions := IAppInstallOptions(outPtr)
        }

        return this.__IAppInstallOptions.get_ForceUseOfNonRemovableStorage()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ForceUseOfNonRemovableStorage(value) {
        if (!this.HasProp("__IAppInstallOptions")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions := IAppInstallOptions(outPtr)
        }

        return this.__IAppInstallOptions.put_ForceUseOfNonRemovableStorage(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowForcedAppRestart() {
        if (!this.HasProp("__IAppInstallOptions")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions := IAppInstallOptions(outPtr)
        }

        return this.__IAppInstallOptions.get_AllowForcedAppRestart()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowForcedAppRestart(value) {
        if (!this.HasProp("__IAppInstallOptions")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions := IAppInstallOptions(outPtr)
        }

        return this.__IAppInstallOptions.put_AllowForcedAppRestart(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Repair() {
        if (!this.HasProp("__IAppInstallOptions")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions := IAppInstallOptions(outPtr)
        }

        return this.__IAppInstallOptions.get_Repair()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Repair(value) {
        if (!this.HasProp("__IAppInstallOptions")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions := IAppInstallOptions(outPtr)
        }

        return this.__IAppInstallOptions.put_Repair(value)
    }

    /**
     * 
     * @returns {PackageVolume} 
     */
    get_TargetVolume() {
        if (!this.HasProp("__IAppInstallOptions")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions := IAppInstallOptions(outPtr)
        }

        return this.__IAppInstallOptions.get_TargetVolume()
    }

    /**
     * 
     * @param {PackageVolume} value 
     * @returns {HRESULT} 
     */
    put_TargetVolume(value) {
        if (!this.HasProp("__IAppInstallOptions")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions := IAppInstallOptions(outPtr)
        }

        return this.__IAppInstallOptions.put_TargetVolume(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LaunchAfterInstall() {
        if (!this.HasProp("__IAppInstallOptions")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions := IAppInstallOptions(outPtr)
        }

        return this.__IAppInstallOptions.get_LaunchAfterInstall()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_LaunchAfterInstall(value) {
        if (!this.HasProp("__IAppInstallOptions")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions := IAppInstallOptions(outPtr)
        }

        return this.__IAppInstallOptions.put_LaunchAfterInstall(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PinToDesktopAfterInstall() {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.get_PinToDesktopAfterInstall()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PinToDesktopAfterInstall(value) {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.put_PinToDesktopAfterInstall(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PinToStartAfterInstall() {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.get_PinToStartAfterInstall()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PinToStartAfterInstall(value) {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.put_PinToStartAfterInstall(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PinToTaskbarAfterInstall() {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.get_PinToTaskbarAfterInstall()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_PinToTaskbarAfterInstall(value) {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.put_PinToTaskbarAfterInstall(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CompletedInstallToastNotificationMode() {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.get_CompletedInstallToastNotificationMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CompletedInstallToastNotificationMode(value) {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.put_CompletedInstallToastNotificationMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstallInProgressToastNotificationMode() {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.get_InstallInProgressToastNotificationMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InstallInProgressToastNotificationMode(value) {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.put_InstallInProgressToastNotificationMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InstallForAllUsers() {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.get_InstallForAllUsers()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_InstallForAllUsers(value) {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.put_InstallForAllUsers(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StageButDoNotInstall() {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.get_StageButDoNotInstall()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_StageButDoNotInstall(value) {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.put_StageButDoNotInstall(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CampaignId() {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.get_CampaignId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CampaignId(value) {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.put_CampaignId(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExtendedCampaignId() {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.get_ExtendedCampaignId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ExtendedCampaignId(value) {
        if (!this.HasProp("__IAppInstallOptions2")) {
            if ((queryResult := this.QueryInterface(IAppInstallOptions2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallOptions2 := IAppInstallOptions2(outPtr)
        }

        return this.__IAppInstallOptions2.put_ExtendedCampaignId(value)
    }

;@endregion Instance Methods
}
