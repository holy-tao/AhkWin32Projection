#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines the automatic app update setting values that can be returned by the [AutoUpdateSetting](appinstallmanager_autoupdatesetting.md) property of the [AppInstallManager](appinstallmanager.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.autoupdatesetting
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class AutoUpdateSetting extends Win32Enum{

    /**
     * Automatic app updates are disabled by the user.
     * @type {Integer (Int32)}
     */
    static Disabled => 0

    /**
     * Automatic app updates are enabled by the user.
     * @type {Integer (Int32)}
     */
    static Enabled => 1

    /**
     * Automatic app updates are disabled by policy.
     * @type {Integer (Int32)}
     */
    static DisabledByPolicy => 2

    /**
     * Automatic app updates are enabled by policy.
     * @type {Integer (Int32)}
     */
    static EnabledByPolicy => 3
}
