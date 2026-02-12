#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the status result of a shared package container operation initiated with [SharedPackageContainerManager](sharedpackagecontainermanager.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontaineroperationstatus
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class SharedPackageContainerOperationStatus extends Win32Enum{

    /**
     * The operation was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The operation was blocked by policy.
     * @type {Integer (Int32)}
     */
    static BlockedByPolicy => 1

    /**
     * The shared package container already exists.
     * @type {Integer (Int32)}
     */
    static AlreadyExists => 2

    /**
     * The operation attempted to add a package family that already exists in another container.
     * @type {Integer (Int32)}
     */
    static PackageFamilyExistsInAnotherContainer => 3

    /**
     * The specified shared package container was not found.
     * @type {Integer (Int32)}
     */
    static NotFound => 4

    /**
     * Unknown failure.
     * @type {Integer (Int32)}
     */
    static UnknownFailure => 5
}
