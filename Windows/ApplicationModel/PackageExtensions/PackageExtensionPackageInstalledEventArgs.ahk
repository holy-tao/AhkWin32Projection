#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageExtensionPackageInstalledEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information for the [PackageExtensionCatalog.PackageInstalled](packageextensioncatalog_packageinstalled.md) event.
 * @remarks
 * Instances of this class are created by the system and passed as event arguments to your handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackageinstalledeventargs
 * @namespace Windows.ApplicationModel.PackageExtensions
 * @version WindowsRuntime 1.4
 */
class PackageExtensionPackageInstalledEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageExtensionPackageInstalledEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageExtensionPackageInstalledEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the extension package that was installed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackageinstalledeventargs.packageextensionname
     * @type {HSTRING} 
     */
    PackageExtensionName {
        get => this.get_PackageExtensionName()
    }

    /**
     * Gets the package containing the extension that was installed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackageinstalledeventargs.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * Provides a list of extensions in the extension package that was just installed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackageinstalledeventargs.extensions
     * @type {IVectorView<PackageExtension>} 
     */
    Extensions {
        get => this.get_Extensions()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageExtensionName() {
        if (!this.HasProp("__IPackageExtensionPackageInstalledEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionPackageInstalledEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionPackageInstalledEventArgs := IPackageExtensionPackageInstalledEventArgs(outPtr)
        }

        return this.__IPackageExtensionPackageInstalledEventArgs.get_PackageExtensionName()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IPackageExtensionPackageInstalledEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionPackageInstalledEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionPackageInstalledEventArgs := IPackageExtensionPackageInstalledEventArgs(outPtr)
        }

        return this.__IPackageExtensionPackageInstalledEventArgs.get_Package()
    }

    /**
     * 
     * @returns {IVectorView<PackageExtension>} 
     */
    get_Extensions() {
        if (!this.HasProp("__IPackageExtensionPackageInstalledEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionPackageInstalledEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionPackageInstalledEventArgs := IPackageExtensionPackageInstalledEventArgs(outPtr)
        }

        return this.__IPackageExtensionPackageInstalledEventArgs.get_Extensions()
    }

;@endregion Instance Methods
}
