#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the install state of the [Package](/uwp/api/windows.applicationmodel.package).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packageinstallstate
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class PackageInstallState extends Win32Enum{

    /**
     * The package has not been installed.
     * @type {Integer (Int32)}
     */
    static NotInstalled => 0

    /**
     * The package has been downloaded.
     * @type {Integer (Int32)}
     */
    static Staged => 1

    /**
     * The package is ready for use.
     * @type {Integer (Int32)}
     */
    static Installed => 2

    /**
     * The installation of the package has been paused.
     * @type {Integer (Int32)}
     */
    static Paused => 6
}
