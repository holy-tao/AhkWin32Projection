#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageExtensionPackageUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information for the [PackageExtensionCatalog.PackageUpdated](packageextensioncatalog_packageupdated.md) event.
 * @remarks
 * Instances of this class are created by the system and passed as event arguments to your handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackageupdatedeventargs
 * @namespace Windows.ApplicationModel.PackageExtensions
 * @version WindowsRuntime 1.4
 */
class PackageExtensionPackageUpdatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageExtensionPackageUpdatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageExtensionPackageUpdatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the package extension that was updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackageupdatedeventargs.packageextensionname
     * @type {HSTRING} 
     */
    PackageExtensionName {
        get => this.get_PackageExtensionName()
    }

    /**
     * Provides the package containing the extension that was updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackageupdatedeventargs.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * Provides a list of extensions that are in the extension package that was updated.
     * @remarks
     * Extensions are scoped by the `<uap17:PackageExtension Name=...>` in the extension's Package.appxmanifest file. Only extensions that match the `<uap17:PackageExtension Name=...>` defined in the host's Package.appxmanifest file are returned.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensionpackageupdatedeventargs.extensions
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
        if (!this.HasProp("__IPackageExtensionPackageUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionPackageUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionPackageUpdatedEventArgs := IPackageExtensionPackageUpdatedEventArgs(outPtr)
        }

        return this.__IPackageExtensionPackageUpdatedEventArgs.get_PackageExtensionName()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IPackageExtensionPackageUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionPackageUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionPackageUpdatedEventArgs := IPackageExtensionPackageUpdatedEventArgs(outPtr)
        }

        return this.__IPackageExtensionPackageUpdatedEventArgs.get_Package()
    }

    /**
     * 
     * @returns {IVectorView<PackageExtension>} 
     */
    get_Extensions() {
        if (!this.HasProp("__IPackageExtensionPackageUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionPackageUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionPackageUpdatedEventArgs := IPackageExtensionPackageUpdatedEventArgs(outPtr)
        }

        return this.__IPackageExtensionPackageUpdatedEventArgs.get_Extensions()
    }

;@endregion Instance Methods
}
