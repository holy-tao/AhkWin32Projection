#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppInstallerInfo.ahk
#Include .\IAppInstallerInfo2.ahk
#Include ..\..\Guid.ahk

/**
 * Represents an App Installer file containing app package and bundle information for defining the packages that are part of a related set and specifying update and repair configuration.
 * @remarks
 * For more information on the file format and contents, see [App Installer File](/uwp/schemas/appinstallerschema/app-installer-file).
 * 
 * Get an instance of this class by calling [Package.GetAppInstallerInfo](package_getappinstallerinfo_627300881.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class AppInstallerInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppInstallerInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppInstallerInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the a **Uri** object pointing to the App Installer file represented by the **AppInstallerInfo** object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets a boolean value specifying whether the deployment service will check for an update to the App Installer file when the app launches.
     * @remarks
     * This property is equivalent to the [OnLaunch](/uwp/schemas/appinstallerschema/element-onlaunch) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.onlaunch
     * @type {Boolean} 
     */
    OnLaunch {
        get => this.get_OnLaunch()
    }

    /**
     * Gets an integer value specifying the frequency with which the the deployment service will check for an update to the App Installer file.
     * @remarks
     * When **HoursBetweenUpdateChecks** is set to 0, the deployment service will check for updates every time the application is launched. For other values, the deployment service will check for updates when the application is launched only if it hasn't previously checked within the last number of hours specified by HoursBetweenUpdateChecks. For example, if **HoursBetweenUpdateChecks** is set to 12, the deployments service will check for updates when the application is launched only if it hasn't already checked for updates in the previous 12 hours.
     * 
     * The allowed range for this property is 0 to 255. The default value is 24. 
     * 
     * This property is equivalent to the *HoursBetweenUpdateChecks* attribute of the [OnLaunch](/uwp/schemas/appinstallerschema/element-onlaunch) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.hoursbetweenupdatechecks
     * @type {Integer} 
     */
    HoursBetweenUpdateChecks {
        get => this.get_HoursBetweenUpdateChecks()
    }

    /**
     * Gets a boolean value specifying whether the deployment service will show a prompt informing the user about an update.
     * @remarks
     * This property is equivalent to the *ShowPrompt* attribute of the [OnLaunch](/uwp/schemas/appinstallerschema/element-onlaunch) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.showprompt
     * @type {Boolean} 
     */
    ShowPrompt {
        get => this.get_ShowPrompt()
    }

    /**
     * Gets a boolean value specifying whether the deployment service will stop the user from launching the application until a pending update has been applied.
     * @remarks
     * When this property is true, on app launch the user is shown a dialog that will allow them to update or close the app. When this property is false, the user is shown a dialog that will allow them to update or launch the app. If the user launches the app, the update will be applied silently at an opportune time. 
     * 
     * This property is equivalent to the *UpdateBlocksActivation* attribute of the [OnLaunch](/uwp/schemas/appinstallerschema/element-onlaunch) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.updateblocksactivation
     * @type {Boolean} 
     */
    UpdateBlocksActivation {
        get => this.get_UpdateBlocksActivation()
    }

    /**
     * Gets a boolean value indicating whether the deployment service checks for app updates in the background.
     * @remarks
     * When this value is true, a check for updates is made every 8 hours independently of whether the user launched the app.  This type of update cannot show UI.
     * 
     * This property is equivalent to the [AutomaticBackgroundTask](/uwp/schemas/appinstallerschema/element-s4-automaticbackgroundtask) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.automaticbackgroundtask
     * @type {Boolean} 
     */
    AutomaticBackgroundTask {
        get => this.get_AutomaticBackgroundTask()
    }

    /**
     * Gets a boolean value indicating whether the app version can be both incremented and decremented. If the value is false, the app can only move to a higher version.
     * @remarks
     * This property is equivalent to the [ForceUpdateFromAnyVersion](/uwp/schemas/appinstallerschema/element-s4-forceupdatefromanyversion) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.forceupdatefromanyversion
     * @type {Boolean} 
     */
    ForceUpdateFromAnyVersion {
        get => this.get_ForceUpdateFromAnyVersion()
    }

    /**
     * Gets a value specifying if the OS and deployment service can automatically perform a repair when the package is marked for remediation.
     * @remarks
     * The default value for this property is true.
     * 
     * For more information on automatic app repair, see [Auto-update and repair apps](/windows/msix/app-installer/auto-update-and-repair--overview).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.isautorepairenabled
     * @type {Boolean} 
     */
    IsAutoRepairEnabled {
        get => this.get_IsAutoRepairEnabled()
    }

    /**
     * Gets a [PackageVersion](packageversion.md) object expressing the version of the App Installer file represented by the **AppInstallerInfo** object.
     * @remarks
     * Note that this is the version of the App Installer file itself, not the version of the schema the App Installer uses, and will typically be assigned to match the version of the main package the installer file is associated with.
     * 
     * This property is equivalent to the *Version* attribute of the [AppInstaller](/uwp/schemas/appinstallerschema/element-appinstaller) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.version
     * @type {PackageVersion} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * Gets a value indicating the date and time when deployment service last checked for updates.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.lastchecked
     * @type {DateTime} 
     */
    LastChecked {
        get => this.get_LastChecked()
    }

    /**
     * Gets a value indicating the date and time that update checks will resume.
     * @remarks
     * Update checks can be paused by calling [AppInstallerManager.PauseUpdatesUntil](../windows.management.deployment/appinstallermanager_pauseautoupdatesuntil_1865321165.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.pauseduntil
     * @type {IReference<DateTime>} 
     */
    PausedUntil {
        get => this.get_PausedUntil()
    }

    /**
     * Gets a read-only list of **Uri** objects pointing to App Installer files for updating an installation.
     * @remarks
     * An app may specify from 1 to 10 update URIs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.updateuris
     * @type {IVectorView<Uri>} 
     */
    UpdateUris {
        get => this.get_UpdateUris()
    }

    /**
     * Gets a read-only list of **Uri** objects pointing to App Installer files for repairing an installation.
     * @remarks
     * An app may specify from 0 to 10 repair URIs.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.repairuris
     * @type {IVectorView<Uri>} 
     */
    RepairUris {
        get => this.get_RepairUris()
    }

    /**
     * Gets a read-only list of **Uri** objects pointing to the dependency packages that are required for successful deployment of the related set.
     * @remarks
     * This property is equivalent to the [Dependencies](/uwp/schemas/appinstallerschema/element-dependencies) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.dependencypackageuris
     * @type {IVectorView<Uri>} 
     */
    DependencyPackageUris {
        get => this.get_DependencyPackageUris()
    }

    /**
     * Gets a read-only list of **Uri** objects pointing to the optional packages that will be installed along with the main package.
     * @remarks
     * This property is equivalent to the [OptionalPackages](/uwp/schemas/appinstallerschema/element-optional-packages) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.optionalpackageuris
     * @type {IVectorView<Uri>} 
     */
    OptionalPackageUris {
        get => this.get_OptionalPackageUris()
    }

    /**
     * Gets a value from the [AppInstallerPolicySource](appinstallerpolicysource.md) enumeration indicating whether the update policy specified in the **AppInstallerInfo** was set using from a system or default source.
     * @remarks
     * The policy source is **Default** if the policy was set using [AppInstallerManager.GetDefault](../windows.management.deployment/appinstallermanager_getdefault_846721868.md). The policy source is **System** if the policy was set using [AppInstallerManager.GetForSystem](../windows.management.deployment/appinstallermanager_getforsystem_1121253078.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerinfo.policysource
     * @type {Integer} 
     */
    PolicySource {
        get => this.get_PolicySource()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IAppInstallerInfo")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo := IAppInstallerInfo(outPtr)
        }

        return this.__IAppInstallerInfo.get_Uri()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OnLaunch() {
        if (!this.HasProp("__IAppInstallerInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo2 := IAppInstallerInfo2(outPtr)
        }

        return this.__IAppInstallerInfo2.get_OnLaunch()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HoursBetweenUpdateChecks() {
        if (!this.HasProp("__IAppInstallerInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo2 := IAppInstallerInfo2(outPtr)
        }

        return this.__IAppInstallerInfo2.get_HoursBetweenUpdateChecks()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowPrompt() {
        if (!this.HasProp("__IAppInstallerInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo2 := IAppInstallerInfo2(outPtr)
        }

        return this.__IAppInstallerInfo2.get_ShowPrompt()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UpdateBlocksActivation() {
        if (!this.HasProp("__IAppInstallerInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo2 := IAppInstallerInfo2(outPtr)
        }

        return this.__IAppInstallerInfo2.get_UpdateBlocksActivation()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutomaticBackgroundTask() {
        if (!this.HasProp("__IAppInstallerInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo2 := IAppInstallerInfo2(outPtr)
        }

        return this.__IAppInstallerInfo2.get_AutomaticBackgroundTask()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceUpdateFromAnyVersion() {
        if (!this.HasProp("__IAppInstallerInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo2 := IAppInstallerInfo2(outPtr)
        }

        return this.__IAppInstallerInfo2.get_ForceUpdateFromAnyVersion()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAutoRepairEnabled() {
        if (!this.HasProp("__IAppInstallerInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo2 := IAppInstallerInfo2(outPtr)
        }

        return this.__IAppInstallerInfo2.get_IsAutoRepairEnabled()
    }

    /**
     * 
     * @returns {PackageVersion} 
     */
    get_Version() {
        if (!this.HasProp("__IAppInstallerInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo2 := IAppInstallerInfo2(outPtr)
        }

        return this.__IAppInstallerInfo2.get_Version()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastChecked() {
        if (!this.HasProp("__IAppInstallerInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo2 := IAppInstallerInfo2(outPtr)
        }

        return this.__IAppInstallerInfo2.get_LastChecked()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_PausedUntil() {
        if (!this.HasProp("__IAppInstallerInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo2 := IAppInstallerInfo2(outPtr)
        }

        return this.__IAppInstallerInfo2.get_PausedUntil()
    }

    /**
     * 
     * @returns {IVectorView<Uri>} 
     */
    get_UpdateUris() {
        if (!this.HasProp("__IAppInstallerInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo2 := IAppInstallerInfo2(outPtr)
        }

        return this.__IAppInstallerInfo2.get_UpdateUris()
    }

    /**
     * 
     * @returns {IVectorView<Uri>} 
     */
    get_RepairUris() {
        if (!this.HasProp("__IAppInstallerInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo2 := IAppInstallerInfo2(outPtr)
        }

        return this.__IAppInstallerInfo2.get_RepairUris()
    }

    /**
     * 
     * @returns {IVectorView<Uri>} 
     */
    get_DependencyPackageUris() {
        if (!this.HasProp("__IAppInstallerInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo2 := IAppInstallerInfo2(outPtr)
        }

        return this.__IAppInstallerInfo2.get_DependencyPackageUris()
    }

    /**
     * 
     * @returns {IVectorView<Uri>} 
     */
    get_OptionalPackageUris() {
        if (!this.HasProp("__IAppInstallerInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo2 := IAppInstallerInfo2(outPtr)
        }

        return this.__IAppInstallerInfo2.get_OptionalPackageUris()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PolicySource() {
        if (!this.HasProp("__IAppInstallerInfo2")) {
            if ((queryResult := this.QueryInterface(IAppInstallerInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerInfo2 := IAppInstallerInfo2(outPtr)
        }

        return this.__IAppInstallerInfo2.get_PolicySource()
    }

;@endregion Instance Methods
}
