#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of package folder to retrieve.
 * @remarks
 * An application has a mutable install folder if it uses the [windows.mutablePackageDirectories extension](/uwp/schemas/appxpackage/uapmanifestschema/element-desktop6-package-extension) in its package manifest. This extension specifies a folder under the %ProgramFiles%\ModifiableWindowsApps path where the contents of the application's install folder are projected so that users can modify the installation files. This feature is currently available only for certain types of desktop PC games that are published by Microsoft and our partners, and it enables these types of games to support mods.
 * @see https://learn.microsoft.com/windows/win32/api/appmodel/ne-appmodel-packagepathtype
 * @namespace Windows.Win32.Storage.Packaging.Appx
 */
class PackagePathType extends Win32Enum {

    /**
     * Retrieve the package path in the original install folder for the application.
     * Native name: PackagePathType_Install
     * @type {Integer (Int32)}
     */
    static Install => 0

    /**
     * Retrieve the package path in the mutable install folder for the application, if the application is declared as mutable in the package manifest.
     * Native name: PackagePathType_Mutable
     * @type {Integer (Int32)}
     */
    static Mutable => 1

    /**
     * Retrieve the package path in the mutable folder if the application is declared as mutable in the package manifest, or in the original install folder if the application is not mutable.
     * Native name: PackagePathType_Effective
     * @type {Integer (Int32)}
     */
    static Effective => 2

    /**
     * Native name: PackagePathType_MachineExternal
     * @type {Integer (Int32)}
     */
    static MachineExternal => 3

    /**
     * Native name: PackagePathType_UserExternal
     * @type {Integer (Int32)}
     */
    static UserExternal => 4

    /**
     * Native name: PackagePathType_EffectiveExternal
     * @type {Integer (Int32)}
     */
    static EffectiveExternal => 5
}
