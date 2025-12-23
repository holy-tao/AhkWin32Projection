#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies values that indicate the type of artifact that is used to define the lifetime of a package dependency.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-packagedependencylifetimekind
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class PackageDependencyLifetimeKind extends Win32Enum{

    /**
     * The current process is the lifetime artifact. The package dependency is implicitly deleted when the process terminates.
     * @type {Integer (Int32)}
     */
    static PackageDependencyLifetimeKind_Process => 0

    /**
     * The lifetime artifact is an absolute filename or path. The package dependency is implicitly deleted when this is deleted.
     * @type {Integer (Int32)}
     */
    static PackageDependencyLifetimeKind_FilePath => 1

    /**
     * The lifetime artifact is a registry key in the format *root*\\*subkey*, where *root* is one of the following: HKEY_LOCAL_MACHINE, HKEY_CURRENT_USER, HKEY_CLASSES_ROOT, or HKEY_USERS. The package dependency is implicitly deleted when this is deleted.
     * @type {Integer (Int32)}
     */
    static PackageDependencyLifetimeKind_RegistryKey => 2
}
