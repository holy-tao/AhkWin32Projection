#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the state of the [Package](/uwp/api/windows.applicationmodel.package).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagestate
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class PackageState extends Win32Enum{

    /**
     * The package is usable.
     * @type {Integer (Int32)}
     */
    static Normal => 0

    /**
     * The license of the package is not valid.
     * @type {Integer (Int32)}
     */
    static LicenseInvalid => 1

    /**
     * The package payload was modified by an unknown source.
     * @type {Integer (Int32)}
     */
    static Modified => 2

    /**
     * The package payload was tampered with intentionally.
     * @type {Integer (Int32)}
     */
    static Tampered => 3
}
