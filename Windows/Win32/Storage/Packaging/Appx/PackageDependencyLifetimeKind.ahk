#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies values that indicate the type of artifact that is used to define the lifetime of a package dependency.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-packagedependencylifetimekind
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct PackageDependencyLifetimeKind {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
