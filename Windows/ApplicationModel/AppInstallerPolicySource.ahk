#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Enum.ahk

/**
 * Specifies the whether the source of the update policy for an app.
 * @remarks
 * The policy source is **Default** if the policy was set using [AppInstallerManager.GetDefault](../windows.management.deployment/appinstallermanager_getdefault_846721868.md). The policy source is **System** if the policy was set using [AppInstallerManager.GetForSystem](../windows.management.deployment/appinstallermanager_getforsystem_1121253078.md). If a policy was set from a **System** source, then any of the [AppInstallerManager](../windows.management.deployment/appinstallermanager.md) methods acting on that *PackageFamilyName* must also be called from a **System** source.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appinstallerpolicysource
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class AppInstallerPolicySource extends Win32Enum{

    /**
     * Default policy source.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * System policy source.
     * @type {Integer (Int32)}
     */
    static System => 1
}
