#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISharedModeSettingsStatics2.ahk
#Include .\ISharedModeSettingsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the settings for shared mode. For example, devices with large screens could support communal shared apps.
 * @remarks
 * For more info on when **SharedModeSettings** is used on Desktop, see [Set up a shared or guest PC with Windows 10](/windows/manage/set-up-shared-or-guest-pc).
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.sharedmodesettings
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class SharedModeSettings extends IInspectable {
;@region Static Properties
    /**
     * Gets a Boolean value indicating that your app should not store files on the local hard drive.
     * @remarks
     * If **true**, then your app should not show local storage locations in its UI.  
     * 
     * Returns **true** when the [RestrictLocalStorage](/windows/client-management/mdm/sharedpc-csp) policy is set.  
     * 	
     * A **true** value means the PC is running in a scenario where apps should hide all entry and save points to the local disk. Windows File Explorer is disabled so customers won’t be able to navigate to any local storage (except downloads, removable drives, and mapped network drives) to access those files.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.sharedmodesettings.shouldavoidlocalstorage
     * @type {Boolean} 
     */
    static ShouldAvoidLocalStorage {
        get => SharedModeSettings.get_ShouldAvoidLocalStorage()
    }

    /**
     * Gets a Boolean value that indicates if shared mode is currently enabled.
     * @remarks
     * Returns **true** when the [EnableSharedPCMode](/windows/client-management/mdm/sharedpc-csp) policy is set.  
     * 
     * Returns **true** when running on a Surface Hub.  
     * 
     * Examples of changes you might make in an education environment:  
     *  - Not launch the first-run experience
     * 
     * A **true** value means the PC is running in scenarios where multiple consecutive users use the PC. These user accounts may be deleted, which means that users may have a new account created each time they use the same device.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.sharedmodesettings.isenabled
     * @type {Boolean} 
     */
    static IsEnabled {
        get => SharedModeSettings.get_IsEnabled()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_ShouldAvoidLocalStorage() {
        if (!SharedModeSettings.HasProp("__ISharedModeSettingsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.SharedModeSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISharedModeSettingsStatics2.IID)
            SharedModeSettings.__ISharedModeSettingsStatics2 := ISharedModeSettingsStatics2(factoryPtr)
        }

        return SharedModeSettings.__ISharedModeSettingsStatics2.get_ShouldAvoidLocalStorage()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsEnabled() {
        if (!SharedModeSettings.HasProp("__ISharedModeSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Profile.SharedModeSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISharedModeSettingsStatics.IID)
            SharedModeSettings.__ISharedModeSettingsStatics := ISharedModeSettingsStatics(factoryPtr)
        }

        return SharedModeSettings.__ISharedModeSettingsStatics.get_IsEnabled()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
