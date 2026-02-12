#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppExtensionPackageInstalledEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information for the [AppExtensionCatalog.PackageInstalled](appextensioncatalog_packageinstalled.md) event.
 * @remarks
 * Instances of this class are created by the system and passed as event arguments to your handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensionpackageinstalledeventargs
 * @namespace Windows.ApplicationModel.AppExtensions
 * @version WindowsRuntime 1.4
 */
class AppExtensionPackageInstalledEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppExtensionPackageInstalledEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppExtensionPackageInstalledEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the extension package that was installed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensionpackageinstalledeventargs.appextensionname
     * @type {HSTRING} 
     */
    AppExtensionName {
        get => this.get_AppExtensionName()
    }

    /**
     * Gets the package containing the extension that was installed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensionpackageinstalledeventargs.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * Provides a list of extensions in the extension package that was just installed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensionpackageinstalledeventargs.extensions
     * @type {IVectorView<AppExtension>} 
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
    get_AppExtensionName() {
        if (!this.HasProp("__IAppExtensionPackageInstalledEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppExtensionPackageInstalledEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionPackageInstalledEventArgs := IAppExtensionPackageInstalledEventArgs(outPtr)
        }

        return this.__IAppExtensionPackageInstalledEventArgs.get_AppExtensionName()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IAppExtensionPackageInstalledEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppExtensionPackageInstalledEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionPackageInstalledEventArgs := IAppExtensionPackageInstalledEventArgs(outPtr)
        }

        return this.__IAppExtensionPackageInstalledEventArgs.get_Package()
    }

    /**
     * 
     * @returns {IVectorView<AppExtension>} 
     */
    get_Extensions() {
        if (!this.HasProp("__IAppExtensionPackageInstalledEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppExtensionPackageInstalledEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionPackageInstalledEventArgs := IAppExtensionPackageInstalledEventArgs(outPtr)
        }

        return this.__IAppExtensionPackageInstalledEventArgs.get_Extensions()
    }

;@endregion Instance Methods
}
