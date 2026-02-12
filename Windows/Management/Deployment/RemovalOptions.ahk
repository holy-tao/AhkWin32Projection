#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Values that modify the removal of a package.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.removaloptions
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class RemovalOptions extends Win32BitflagEnum{

    /**
     * No removal options are specified. This is the default deployment behavior.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Don't remove any application data when the package is removed. This can only apply to packages that were deployed with the [DeploymentOptions.DevelopmentMode](deploymentoptions.md) value. If you specify **PreserveApplicationData** on an incompatible package, [PackageManager.RemovePackageAsync(String, RemovalOptions)](packagemanager_removepackageasync_1331217245.md) returns **E_INVALIDARG**.
     * @type {Integer (UInt32)}
     */
    static PreserveApplicationData => 4096

    /**
     * Don't remove the roamable portion of the app's data when the package is removed. This value is not supported with the **PreserveApplicationData** and **RemoveForAllUsers** fields. This field is useful in virtual desktop scenarios when additional work needs to be performed to enable the portable part of the app's state to be roamed between remote servers so that a user's virtual desktop session can be logged onto different servers without loss of app state.
     * @type {Integer (UInt32)}
     */
    static PreserveRoamableApplicationData => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DeferRemovalWhenPackagesAreInUse => 8192

    /**
     * Removes a package for all users on the device.
     * @type {Integer (UInt32)}
     */
    static RemoveForAllUsers => 524288
}
