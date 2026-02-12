#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppExtensionPackageUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information for the [AppExtensionCatalog.PackageUpdated](appextensioncatalog_packageupdated.md) event.
 * @remarks
 * Instances of this class are created by the system and passed as event arguments to your handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensionpackageupdatedeventargs
 * @namespace Windows.ApplicationModel.AppExtensions
 * @version WindowsRuntime 1.4
 */
class AppExtensionPackageUpdatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppExtensionPackageUpdatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppExtensionPackageUpdatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the app extension that was updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensionpackageupdatedeventargs.appextensionname
     * @type {HSTRING} 
     */
    AppExtensionName {
        get => this.get_AppExtensionName()
    }

    /**
     * Provides the package containing the extension that was updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensionpackageupdatedeventargs.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * Provides a list of extensions that are in the extension package that was updated
     * @remarks
     * Extensions are scoped by the `<uap3:AppExtension Name=...>` in the extension's Package.appxmanifest file. Only extensions that match the `<uap3:AppExtension Name=...>` defined in the host's Package.appxmanifest file are returned.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensionpackageupdatedeventargs.extensions
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
        if (!this.HasProp("__IAppExtensionPackageUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppExtensionPackageUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionPackageUpdatedEventArgs := IAppExtensionPackageUpdatedEventArgs(outPtr)
        }

        return this.__IAppExtensionPackageUpdatedEventArgs.get_AppExtensionName()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IAppExtensionPackageUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppExtensionPackageUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionPackageUpdatedEventArgs := IAppExtensionPackageUpdatedEventArgs(outPtr)
        }

        return this.__IAppExtensionPackageUpdatedEventArgs.get_Package()
    }

    /**
     * 
     * @returns {IVectorView<AppExtension>} 
     */
    get_Extensions() {
        if (!this.HasProp("__IAppExtensionPackageUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppExtensionPackageUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionPackageUpdatedEventArgs := IAppExtensionPackageUpdatedEventArgs(outPtr)
        }

        return this.__IAppExtensionPackageUpdatedEventArgs.get_Extensions()
    }

;@endregion Instance Methods
}
