#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies collision options when creating a shared package container with [SharedPackageContainerManager.CreateContainer](sharedpackagecontainermanager_createcontainer_1800565425.md)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.sharedpackagecontainercreationcollisionoptions
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class SharedPackageContainerCreationCollisionOptions extends Win32Enum{

    /**
     * Fail if the shared package container exists.
     * @type {Integer (Int32)}
     */
    static FailIfExists => 0

    /**
     * Merge the contents of the existing package container with the contents of the new package container.
     * @type {Integer (Int32)}
     */
    static MergeWithExisting => 1

    /**
     * Replace the existing package container with the new package container.
     * @type {Integer (Int32)}
     */
    static ReplaceExisting => 2
}
