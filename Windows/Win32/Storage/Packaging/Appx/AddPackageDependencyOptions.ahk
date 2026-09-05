#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines options that can be applied when adding a package dependency.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-addpackagedependencyoptions
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class AddPackageDependencyOptions extends Win32BitflagEnum {

    /**
     * No options are applied.
     * Native name: AddPackageDependencyOptions_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * If multiple packages are present in the package graph with the same rank as the call to **AddPackageDependency**, the resolved package is added before others of the same rank. For more information, see [AddPackageDependency](nf-appmodel-addpackagedependency.md).
     * Native name: AddPackageDependencyOptions_PrependIfRankCollision
     * @type {Integer (Int32)}
     */
    static PrependIfRankCollision => 1
}
