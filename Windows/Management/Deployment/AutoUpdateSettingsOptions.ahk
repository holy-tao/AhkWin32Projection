#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAutoUpdateSettingsOptions.ahk
#Include .\IAutoUpdateSettingsOptionsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the automatic update settings for a package.
 * @remarks
 * Pass this object into the [AppInstallerManager.SetAutoUpdateSettings](appinstallermanager_setautoupdatesettings_1519760534.md) method to create or update automatic update settings.
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.autoupdatesettingsoptions
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class AutoUpdateSettingsOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutoUpdateSettingsOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutoUpdateSettingsOptions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the **AutoUpdateSettingsOptions** with values from the provided [AppInstallerInfo](../windows.applicationmodel/appinstallerinfo.md) class.
     * @param {AppInstallerInfo} appInstallerInfo_ The **AppInstallerInfo** object from which a new **AutoUpdateSettingsOptions** instance is created.
     * @returns {AutoUpdateSettingsOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.autoupdatesettingsoptions.createfromappinstallerinfo
     */
    static CreateFromAppInstallerInfo(appInstallerInfo_) {
        if (!AutoUpdateSettingsOptions.HasProp("__IAutoUpdateSettingsOptionsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.AutoUpdateSettingsOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAutoUpdateSettingsOptionsStatics.IID)
            AutoUpdateSettingsOptions.__IAutoUpdateSettingsOptionsStatics := IAutoUpdateSettingsOptionsStatics(factoryPtr)
        }

        return AutoUpdateSettingsOptions.__IAutoUpdateSettingsOptionsStatics.CreateFromAppInstallerInfo(appInstallerInfo_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a [PackageVersion](/uwp/api/Windows.ApplicationModel.PackageVersion) object expressing the version of the App Installer file represented by the **AppInstallerInfo** object.
     * @remarks
     * Note that this is the version of the App Installer file itself, not the version of the schema the App Installer uses, and will typically be assigned to match the version of the main package the installer file is associated with.
     * 
     * This property is equivalent to the *Version* attribute of the [AppInstaller](/uwp/schemas/appinstallerschema/element-appinstaller) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.autoupdatesettingsoptions.version
     * @type {PackageVersion} 
     */
    Version {
        get => this.get_Version()
        set => this.put_Version(value)
    }

    /**
     * Gets or sets the a **Uri** object pointing to the App Installer file represented by the **AppInstallerInfo** object.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.autoupdatesettingsoptions.appinstalleruri
     * @type {Uri} 
     */
    AppInstallerUri {
        get => this.get_AppInstallerUri()
        set => this.put_AppInstallerUri(value)
    }

    /**
     * Gets or sets a boolean value specifying whether the deployment service will check for an update to the App Installer file when the app launches.
     * @remarks
     * This property is equivalent to the [OnLaunch](/uwp/schemas/appinstallerschema/element-onlaunch) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.autoupdatesettingsoptions.onlaunch
     * @type {Boolean} 
     */
    OnLaunch {
        get => this.get_OnLaunch()
        set => this.put_OnLaunch(value)
    }

    /**
     * Gets or sets an integer value specifying the frequency with which the the deployment service will check for an update to the App Installer file.
     * @remarks
     * When **HoursBetweenUpdateChecks** is set to 0, the deployment service will check for updates every time the application is launched. For other values, the deployment service will check for updates when the application is launched only if it hasn't previously checked within the last number of hours specified by HoursBetweenUpdateChecks. For example, if **HoursBetweenUpdateChecks** is set to 12, the deployments service will check for updates when the application is launched only if it hasn't already checked for updates in the previous 12 hours.
     * 
     * The allowed range for this property is 0 to 255. The default value is 24. 
     * 
     * This property is equivalent to the *HoursBetweenUpdateChecks* attribute of the [OnLaunch](/uwp/schemas/appinstallerschema/element-onlaunch) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.autoupdatesettingsoptions.hoursbetweenupdatechecks
     * @type {Integer} 
     */
    HoursBetweenUpdateChecks {
        get => this.get_HoursBetweenUpdateChecks()
        set => this.put_HoursBetweenUpdateChecks(value)
    }

    /**
     * Gets or sets a boolean value specifying whether the deployment service will show a prompt informing the user about an update.
     * @remarks
     * This property is equivalent to the *ShowPrompt* attribute of the [OnLaunch](/uwp/schemas/appinstallerschema/element-onlaunch) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.autoupdatesettingsoptions.showprompt
     * @type {Boolean} 
     */
    ShowPrompt {
        get => this.get_ShowPrompt()
        set => this.put_ShowPrompt(value)
    }

    /**
     * Gets or sets a boolean value specifying whether the deployment service will stop the user from launching the application until a pending update has been applied.
     * @remarks
     * When this property is true, on app launch the user is shown a dialog that will allow them to update or close the app. When this property is false, the user is shown a dialog that will allow them to update or launch the app. If the user launches the app, the update will be applied silently at an opportune time. 
     * 
     * This property is equivalent to the *UpdateBlocksActivation* attribute of the [OnLaunch](/uwp/schemas/appinstallerschema/element-onlaunch) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.autoupdatesettingsoptions.updateblocksactivation
     * @type {Boolean} 
     */
    UpdateBlocksActivation {
        get => this.get_UpdateBlocksActivation()
        set => this.put_UpdateBlocksActivation(value)
    }

    /**
     * Gets a boolean value indicating whether the deployment service checks for app updates in the background.
     * @remarks
     * When this value is true, a check for updates is made every 8 hours independently of whether the user launched the app.  This type of update cannot show UI.
     * 
     * This property is equivalent to the [AutomaticBackgroundTask](/uwp/schemas/appinstallerschema/element-automatic-background-task) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.autoupdatesettingsoptions.automaticbackgroundtask
     * @type {Boolean} 
     */
    AutomaticBackgroundTask {
        get => this.get_AutomaticBackgroundTask()
        set => this.put_AutomaticBackgroundTask(value)
    }

    /**
     * Gets or sets a boolean value indicating whether the app version can be both incremented and decremented. If the value is false, the app can only move to a higher version.
     * @remarks
     * This property is equivalent to the [ForceUpdateFromAnyVersion](/uwp/schemas/appinstallerschema/element-force-update-from-any-version) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.autoupdatesettingsoptions.forceupdatefromanyversion
     * @type {Boolean} 
     */
    ForceUpdateFromAnyVersion {
        get => this.get_ForceUpdateFromAnyVersion()
        set => this.put_ForceUpdateFromAnyVersion(value)
    }

    /**
     * Gets or sets a value specifying if the OS and deployment service can automatically perform a repair when the package is marked for remediation.
     * @remarks
     * The default value for this property is true.
     * 
     * For more information on automatic app repair, see [Auto-update and repair apps](/windows/msix/app-installer/auto-update-and-repair--overview).
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.autoupdatesettingsoptions.isautorepairenabled
     * @type {Boolean} 
     */
    IsAutoRepairEnabled {
        get => this.get_IsAutoRepairEnabled()
        set => this.put_IsAutoRepairEnabled(value)
    }

    /**
     * Gets a read-only list of **Uri** objects pointing to App Installer files for updating an installation.
     * @remarks
     * An app may specify from 1 to 10 update URIs.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.autoupdatesettingsoptions.updateuris
     * @type {IVector<Uri>} 
     */
    UpdateUris {
        get => this.get_UpdateUris()
    }

    /**
     * Gets a read-only list of **Uri** objects pointing to App Installer files for repairing an installation.
     * @remarks
     * An app may specify from 0 to 10 repair URIs.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.autoupdatesettingsoptions.repairuris
     * @type {IVector<Uri>} 
     */
    RepairUris {
        get => this.get_RepairUris()
    }

    /**
     * Gets a read-only list of **Uri** objects pointing to the dependency packages that are required for successful deployment of the related set.
     * @remarks
     * This property is equivalent to the [AutomaticBackgroundTask](/uwp/schemas/appinstallerschema/element-automatic-background-task) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.autoupdatesettingsoptions.dependencypackageuris
     * @type {IVector<Uri>} 
     */
    DependencyPackageUris {
        get => this.get_DependencyPackageUris()
    }

    /**
     * Gets a read-only list of **Uri** objects pointing to the optional packages that will be installed along with the main package.
     * @remarks
     * This property is equivalent to the [OptionalPackages](/uwp/schemas/appinstallerschema/element-optional-packages) element of the App Installer file schema.
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.autoupdatesettingsoptions.optionalpackageuris
     * @type {IVector<Uri>} 
     */
    OptionalPackageUris {
        get => this.get_OptionalPackageUris()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the **AutoUpdateSettingsOptions** class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.AutoUpdateSettingsOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {PackageVersion} 
     */
    get_Version() {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.get_Version()
    }

    /**
     * 
     * @param {PackageVersion} value 
     * @returns {HRESULT} 
     */
    put_Version(value) {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.put_Version(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_AppInstallerUri() {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.get_AppInstallerUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_AppInstallerUri(value) {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.put_AppInstallerUri(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OnLaunch() {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.get_OnLaunch()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_OnLaunch(value) {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.put_OnLaunch(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HoursBetweenUpdateChecks() {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.get_HoursBetweenUpdateChecks()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HoursBetweenUpdateChecks(value) {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.put_HoursBetweenUpdateChecks(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowPrompt() {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.get_ShowPrompt()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowPrompt(value) {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.put_ShowPrompt(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UpdateBlocksActivation() {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.get_UpdateBlocksActivation()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UpdateBlocksActivation(value) {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.put_UpdateBlocksActivation(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutomaticBackgroundTask() {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.get_AutomaticBackgroundTask()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutomaticBackgroundTask(value) {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.put_AutomaticBackgroundTask(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceUpdateFromAnyVersion() {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.get_ForceUpdateFromAnyVersion()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ForceUpdateFromAnyVersion(value) {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.put_ForceUpdateFromAnyVersion(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAutoRepairEnabled() {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.get_IsAutoRepairEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAutoRepairEnabled(value) {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.put_IsAutoRepairEnabled(value)
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_UpdateUris() {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.get_UpdateUris()
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_RepairUris() {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.get_RepairUris()
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_DependencyPackageUris() {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.get_DependencyPackageUris()
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_OptionalPackageUris() {
        if (!this.HasProp("__IAutoUpdateSettingsOptions")) {
            if ((queryResult := this.QueryInterface(IAutoUpdateSettingsOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutoUpdateSettingsOptions := IAutoUpdateSettingsOptions(outPtr)
        }

        return this.__IAutoUpdateSettingsOptions.get_OptionalPackageUris()
    }

;@endregion Instance Methods
}
