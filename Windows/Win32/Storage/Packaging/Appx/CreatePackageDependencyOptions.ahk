#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines options that can be applied when creating a package dependency by using the TryCreatePackageDependency function.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-createpackagedependencyoptions
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct CreatePackageDependencyOptions {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No options are applied.
     * @type {Integer (Int32)}
     */
    static CreatePackageDependencyOptions_None => 0

    /**
     * Disables dependency resolution when pinning a package dependency. This is useful for installers running as user contexts other than the target user (for example, installers running as LocalSystem).
     * @type {Integer (Int32)}
     */
    static CreatePackageDependencyOptions_DoNotVerifyDependencyResolution => 1

    /**
     * Defines the package dependency for the system, accessible to all users (by default, the package dependency is defined for a specific user). This option requires the caller has administrative privileges.
     * @type {Integer (Int32)}
     */
    static CreatePackageDependencyOptions_ScopeIsSystem => 2
}
