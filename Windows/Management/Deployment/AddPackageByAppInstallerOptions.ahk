#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * A subset of [DeploymentOptions](deploymentoptions.md) that are valid for App Installer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.addpackagebyappinstalleroptions
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class AddPackageByAppInstallerOptions extends Win32BitflagEnum{

    /**
     * The default behavior is used.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * When you set this option, the app is instructed to skip resource applicability checks. This effectively stages or registers all resource packages that a user passes in to the command, which forces applicability for all packages contained in a bundle. If a user passes in a bundle, all contained resource packages will be registered.
     * @type {Integer (UInt32)}
     */
    static InstallAllResources => 32

    /**
     * If this package is currently in use, the processes associated with the package are shut down forcibly so that registration can continue.
     * @type {Integer (UInt32)}
     */
    static ForceTargetAppShutdown => 64

    /**
     * When you set this option, only the required content group will be staged. An app can be installed as a package with the required content group alone.
     * @type {Integer (UInt32)}
     */
    static RequiredContentGroupOnly => 256

    /**
     * Do not download missing referenced packages
     * @type {Integer (UInt32)}
     */
    static LimitToExistingPackages => 512
}
