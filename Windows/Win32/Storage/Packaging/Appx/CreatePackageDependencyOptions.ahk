#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class CreatePackageDependencyOptions{

    /**
     * @type {Integer (Int32)}
     */
    static CreatePackageDependencyOptions_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static CreatePackageDependencyOptions_DoNotVerifyDependencyResolution => 1

    /**
     * @type {Integer (Int32)}
     */
    static CreatePackageDependencyOptions_ScopeIsSystem => 2
}
