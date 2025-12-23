#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines options that can be applied when creating a package dependency by using the TryCreatePackageDependency function.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-createpackagedependencyoptions
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class CreatePackageDependencyOptions extends Win32BitflagEnum{

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
