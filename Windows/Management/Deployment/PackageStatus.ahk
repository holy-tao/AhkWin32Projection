#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Provides info about the status of a [Package](/uwp/api/windows.applicationmodel.package).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagestatus
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class PackageStatus extends Win32BitflagEnum{

    /**
     * The package is usable.
     * @type {Integer (UInt32)}
     */
    static OK => 0

    /**
     * The license of the package is not valid.
     * @type {Integer (UInt32)}
     */
    static LicenseIssue => 1

    /**
     * The package payload was modified by an unknown source.
     * @type {Integer (UInt32)}
     */
    static Modified => 2

    /**
     * The package payload was tampered with intentionally.
     * @type {Integer (UInt32)}
     */
    static Tampered => 4

    /**
     * The package is not available for use. It can still be serviced.
     * @type {Integer (UInt32)}
     */
    static Disabled => 8
}
