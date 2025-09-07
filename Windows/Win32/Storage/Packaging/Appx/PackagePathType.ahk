#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the type of package folder to retrieve.
 * @remarks
 * An application has a mutable install folder if it uses the [windows.mutablePackageDirectories extension](/uwp/schemas/appxpackage/uapmanifestschema/element-desktop6-package-extension) in its package manifest. This extension specifies a folder under the %ProgramFiles%\ModifiableWindowsApps path where the contents of the application's install folder are projected so that users can modify the installation files. This feature is currently available only for certain types of desktop PC games that are published by Microsoft and our partners, and it enables these types of games to support mods.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-packagepathtype
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class PackagePathType{

    /**
     * Retrieve the package path in the original install folder for the application.
     * @type {Integer (Int32)}
     */
    static PackagePathType_Install => 0

    /**
     * Retrieve the package path in the mutable install folder for the application, if the application is declared as mutable in the package manifest.
     * @type {Integer (Int32)}
     */
    static PackagePathType_Mutable => 1

    /**
     * Retrieve the package path in the mutable folder if the application is declared as mutable in the package manifest, or in the original install folder if the application is not mutable.
     * @type {Integer (Int32)}
     */
    static PackagePathType_Effective => 2

    /**
     * @type {Integer (Int32)}
     */
    static PackagePathType_MachineExternal => 3

    /**
     * @type {Integer (Int32)}
     */
    static PackagePathType_UserExternal => 4

    /**
     * @type {Integer (Int32)}
     */
    static PackagePathType_EffectiveExternal => 5
}
