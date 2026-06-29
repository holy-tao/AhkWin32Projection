#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines options that can be applied when adding a package dependency.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-addpackagedependencyoptions
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
export default struct AddPackageDependencyOptions {
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
    static AddPackageDependencyOptions_None => 0

    /**
     * If multiple packages are present in the package graph with the same rank as the call to **AddPackageDependency**, the resolved package is added before others of the same rank. For more information, see [AddPackageDependency](nf-appmodel-addpackagedependency.md).
     * @type {Integer (Int32)}
     */
    static AddPackageDependencyOptions_PrependIfRankCollision => 1
}
