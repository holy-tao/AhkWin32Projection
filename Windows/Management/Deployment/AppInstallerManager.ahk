#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppInstallerManager.ahk
#Include .\IAppInstallerManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides APIs for updating app installer settings such as automatic updates.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.appinstallermanager
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class AppInstallerManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppInstallerManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppInstallerManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves an instance of [AppInstallerManager](appinstallermanager.md) with default priority.
     * @remarks
     * **AppInstallerManager** methods called on an instance with default priority will replace values set by the most recent update or add the settings if an entry doesn’t already exist. Similarly, when an update takes place, the update will override these settings. To have the settings persist, use the **AppInstallerManager** returned by [AppInstallerManager.GetForSystem](appinstallermanager_getforsystem_1121253078.md).
     * @returns {AppInstallerManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.appinstallermanager.getdefault
     */
    static GetDefault() {
        if (!AppInstallerManager.HasProp("__IAppInstallerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.AppInstallerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppInstallerManagerStatics.IID)
            AppInstallerManager.__IAppInstallerManagerStatics := IAppInstallerManagerStatics(factoryPtr)
        }

        return AppInstallerManager.__IAppInstallerManagerStatics.GetDefault()
    }

    /**
     * Retrieves an instance of [AppInstallerManager](appinstallermanager.md) with system priority.
     * @remarks
     * Obtaining an **AppInstallerManager** with system priority via this method requires administrator privileges. The values set by operations from an **AppInstallerManager** with system priority won’t be overwritten by operations performed at the default level.
     * @returns {AppInstallerManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.appinstallermanager.getforsystem
     */
    static GetForSystem() {
        if (!AppInstallerManager.HasProp("__IAppInstallerManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Deployment.AppInstallerManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppInstallerManagerStatics.IID)
            AppInstallerManager.__IAppInstallerManagerStatics := IAppInstallerManagerStatics(factoryPtr)
        }

        return AppInstallerManager.__IAppInstallerManagerStatics.GetForSystem()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sets the auto update settings for the specified package.
     * @remarks
     * To use this API, you must declare the **packageManagement** and **packageQuery** capabilities.
     * @param {HSTRING} packageFamilyName The package family name for the package for which auto update settings are set.
     * @param {AutoUpdateSettingsOptions} appInstallerInfo_ An [AutoUpdateSettingsOptions](autoupdatesettingsoptions.md) object representing the new auto update settings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.appinstallermanager.setautoupdatesettings
     */
    SetAutoUpdateSettings(packageFamilyName, appInstallerInfo_) {
        if (!this.HasProp("__IAppInstallerManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallerManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerManager := IAppInstallerManager(outPtr)
        }

        return this.__IAppInstallerManager.SetAutoUpdateSettings(packageFamilyName, appInstallerInfo_)
    }

    /**
     * Completely removes any saved auto-update information from the package
     * @param {HSTRING} packageFamilyName The package family name for the package from which to remove auto-update settings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.appinstallermanager.clearautoupdatesettings
     */
    ClearAutoUpdateSettings(packageFamilyName) {
        if (!this.HasProp("__IAppInstallerManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallerManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerManager := IAppInstallerManager(outPtr)
        }

        return this.__IAppInstallerManager.ClearAutoUpdateSettings(packageFamilyName)
    }

    /**
     * Pauses automatic updates for the specified package until the specified date and time.
     * @remarks
     * Call this method with the current **DateTime** to resume automatic updates.
     * @param {HSTRING} packageFamilyName The package family name for the package for which automatic updates are paused.
     * @param {DateTime} dateTime_ The date and time when automatic updates are scheduled to resume.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.appinstallermanager.pauseautoupdatesuntil
     */
    PauseAutoUpdatesUntil(packageFamilyName, dateTime_) {
        if (!this.HasProp("__IAppInstallerManager")) {
            if ((queryResult := this.QueryInterface(IAppInstallerManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallerManager := IAppInstallerManager(outPtr)
        }

        return this.__IAppInstallerManager.PauseAutoUpdatesUntil(packageFamilyName, dateTime_)
    }

;@endregion Instance Methods
}
