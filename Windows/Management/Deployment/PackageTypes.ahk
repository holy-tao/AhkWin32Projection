#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the types of [Package](/uwp/api/windows.applicationmodel.package) to be included in the result set of a query.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.packagetypes
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class PackageTypes extends Win32BitflagEnum{

    /**
     * Default inventorying behavior.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Include the main packages when you enumerate the package repository.
     * @type {Integer (UInt32)}
     */
    static Main => 1

    /**
     * Include the framework packages when you enumerate the package repository.
     * @type {Integer (UInt32)}
     */
    static Framework => 2

    /**
     * Include the resource packages when you enumerate the package repository.
     * @type {Integer (UInt32)}
     */
    static Resource => 4

    /**
     * Include the bundle packages when you enumerate the package repository.
     * @type {Integer (UInt32)}
     */
    static Bundle => 8

    /**
     * Include the XAP packages when you enumerate the package repository.
     * @type {Integer (UInt32)}
     */
    static Xap => 16

    /**
     * Include the optional packages when you enumerate the package repository.
     * @type {Integer (UInt32)}
     */
    static Optional => 32

    /**
     * Include all packages when you enumerate the package repository.
     * @type {Integer (UInt32)}
     */
    static All => 4294967295
}
