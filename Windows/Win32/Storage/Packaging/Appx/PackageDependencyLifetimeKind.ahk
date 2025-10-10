#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class PackageDependencyLifetimeKind{

    /**
     * @type {Integer (Int32)}
     */
    static PackageDependencyLifetimeKind_Process => 0

    /**
     * @type {Integer (Int32)}
     */
    static PackageDependencyLifetimeKind_FilePath => 1

    /**
     * @type {Integer (Int32)}
     */
    static PackageDependencyLifetimeKind_RegistryKey => 2
}
