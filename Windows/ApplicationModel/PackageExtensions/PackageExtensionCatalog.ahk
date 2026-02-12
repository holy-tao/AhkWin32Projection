#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageExtensionCatalog.ahk
#Include .\IPackageExtensionCatalogStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PackageExtensionCatalog.ahk
#Include .\PackageExtensionPackageInstalledEventArgs.ahk
#Include .\PackageExtensionPackageUpdatingEventArgs.ahk
#Include .\PackageExtensionPackageUpdatedEventArgs.ahk
#Include .\PackageExtensionPackageUninstallingEventArgs.ahk
#Include .\PackageExtensionPackageStatusChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides information about available extensions within a package-scope extension group.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensioncatalog
 * @namespace Windows.ApplicationModel.PackageExtensions
 * @version WindowsRuntime 1.4
 */
class PackageExtensionCatalog extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageExtensionCatalog

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageExtensionCatalog.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Opens a catalog of extensions.
     * @remarks
     * Package extensions are scoped by the `<uap17:PackageExtension Name=...>` defined in the extension's Package.appxmanifest file. Only extensions that match the  `<uap17:PackageExtension Name=...>` defined in the host's Package.appxmanifest file appear in the catalog.  
     * 
     * If you have multiple `<uap17:PackageExtensionHost>` declarations in your host app, you need to open a separate catalog for each one.
     * 
     * An instance of the [PackageCatalog](../windows.applicationmodel/packagecatalog.md) is required to handle the events so keep a reference to it as long as you need to manage your app extensions.
     * @param {HSTRING} packageExtensionName The extension namespace name.
     * @returns {PackageExtensionCatalog} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensioncatalog.open
     */
    static Open(packageExtensionName) {
        if (!PackageExtensionCatalog.HasProp("__IPackageExtensionCatalogStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.PackageExtensions.PackageExtensionCatalog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPackageExtensionCatalogStatics.IID)
            PackageExtensionCatalog.__IPackageExtensionCatalogStatics := IPackageExtensionCatalogStatics(factoryPtr)
        }

        return PackageExtensionCatalog.__IPackageExtensionCatalogStatics.Open(packageExtensionName)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPackageInstalledToken")) {
            this.remove_PackageInstalled(this.__OnPackageInstalledToken)
            this.__OnPackageInstalled.iface.Dispose()
        }

        if(this.HasProp("__OnPackageUpdatingToken")) {
            this.remove_PackageUpdating(this.__OnPackageUpdatingToken)
            this.__OnPackageUpdating.iface.Dispose()
        }

        if(this.HasProp("__OnPackageUpdatedToken")) {
            this.remove_PackageUpdated(this.__OnPackageUpdatedToken)
            this.__OnPackageUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnPackageUninstallingToken")) {
            this.remove_PackageUninstalling(this.__OnPackageUninstallingToken)
            this.__OnPackageUninstalling.iface.Dispose()
        }

        if(this.HasProp("__OnPackageStatusChangedToken")) {
            this.remove_PackageStatusChanged(this.__OnPackageStatusChangedToken)
            this.__OnPackageStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Provides the list of extensions in the catalog.
     * @remarks
     * Package extensions are scoped by the `<uap17:PackageExtension Name=...>` defined in the extension's Package.appxmanifest file. This method returns the list of extensions installed on the machine that match the `<uap17:PackageExtension Name=...>` defined in the host's Package.appxmanifest file.
     * 
     * You typically call this method when your app launches or resumes from suspension. Then use the events on this class to listen for updates to the extensions in the catalog.
     * @returns {IVectorView<PackageExtension>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensioncatalog.findall
     */
    FindAll() {
        if (!this.HasProp("__IPackageExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionCatalog := IPackageExtensionCatalog(outPtr)
        }

        return this.__IPackageExtensionCatalog.FindAll()
    }

    /**
     * Provides the list of extensions in the catalog.
     * @remarks
     * Package extensions are scoped by the `<uap17:PackageExtension Name=...>` defined in the extension's Package.appxmanifest file. This method returns the list of extensions installed on the machine that match the `<uap17:PackageExtension Name=...>` defined in the host's Package.appxmanifest file.
     * 
     * You typically call this method when your app launches or resumes from suspension. Then use the events on this class to listen for updates to the extensions in the catalog.
     * @returns {IAsyncOperation<IVectorView<PackageExtension>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensioncatalog.findallasync
     */
    FindAllAsync() {
        if (!this.HasProp("__IPackageExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionCatalog := IPackageExtensionCatalog(outPtr)
        }

        return this.__IPackageExtensionCatalog.FindAllAsync()
    }

    /**
     * Attempts to remove the specified extension package from the machine.
     * @remarks
     * The user is prompted to allow or deny the package removal. You can only remove packages that contain extensions found in the **PackageExtensionCatalog** instance you make the call from.
     * 
     * The unit of deployment for [PackageExtensions](packageextension.md) is the [Package](../windows.applicationmodel/package.md). You cannot remove **PackageExtensions**; you can only remove **Packages**. **Packages** may contain multiple **PackageExtensions**.
     * 
     * The user may not understand the relationship between **PackageExtensions** and **Packages**, or between an **PackageExtension** and an app on the machine (because an app may be designed to also serve as an extension). The user may accept the request to remove a package thinking that they are only removing an extension but then find that one of their favorite apps is now gone. Only use this method if you are certain that the **PackageExtension** is the only thing in the package.
     * 
     * Avoid using this method if you do not control the ecosystem of extensions involved. This method is intended for convenience in a closed ecosystem of extensions, such as in an enterprise environment.
     * 
     * **Desktop Bridge** extension hosts cannot use this method directly. Desktop Bridge extension hosts should use their Universal Windows Platform component to manage package extensions. For more information, see [Building an MSIX package from your code](/windows/msix/desktop/source-code-overview).
     * @param {HSTRING} packageFullName The name of the package to remove, which you can get from [PackageExtension.Package.Id.FullName](../windows.applicationmodel/packageid_fullname.md).
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageextensions.packageextensioncatalog.requestremovepackageasync
     */
    RequestRemovePackageAsync(packageFullName) {
        if (!this.HasProp("__IPackageExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionCatalog := IPackageExtensionCatalog(outPtr)
        }

        return this.__IPackageExtensionCatalog.RequestRemovePackageAsync(packageFullName)
    }

    /**
     * 
     * @param {TypedEventHandler<PackageExtensionCatalog, PackageExtensionPackageInstalledEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageInstalled(handler) {
        if (!this.HasProp("__IPackageExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionCatalog := IPackageExtensionCatalog(outPtr)
        }

        return this.__IPackageExtensionCatalog.add_PackageInstalled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageInstalled(token) {
        if (!this.HasProp("__IPackageExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionCatalog := IPackageExtensionCatalog(outPtr)
        }

        return this.__IPackageExtensionCatalog.remove_PackageInstalled(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PackageExtensionCatalog, PackageExtensionPackageUpdatingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageUpdating(handler) {
        if (!this.HasProp("__IPackageExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionCatalog := IPackageExtensionCatalog(outPtr)
        }

        return this.__IPackageExtensionCatalog.add_PackageUpdating(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageUpdating(token) {
        if (!this.HasProp("__IPackageExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionCatalog := IPackageExtensionCatalog(outPtr)
        }

        return this.__IPackageExtensionCatalog.remove_PackageUpdating(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PackageExtensionCatalog, PackageExtensionPackageUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageUpdated(handler) {
        if (!this.HasProp("__IPackageExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionCatalog := IPackageExtensionCatalog(outPtr)
        }

        return this.__IPackageExtensionCatalog.add_PackageUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageUpdated(token) {
        if (!this.HasProp("__IPackageExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionCatalog := IPackageExtensionCatalog(outPtr)
        }

        return this.__IPackageExtensionCatalog.remove_PackageUpdated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PackageExtensionCatalog, PackageExtensionPackageUninstallingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageUninstalling(handler) {
        if (!this.HasProp("__IPackageExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionCatalog := IPackageExtensionCatalog(outPtr)
        }

        return this.__IPackageExtensionCatalog.add_PackageUninstalling(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageUninstalling(token) {
        if (!this.HasProp("__IPackageExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionCatalog := IPackageExtensionCatalog(outPtr)
        }

        return this.__IPackageExtensionCatalog.remove_PackageUninstalling(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PackageExtensionCatalog, PackageExtensionPackageStatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageStatusChanged(handler) {
        if (!this.HasProp("__IPackageExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionCatalog := IPackageExtensionCatalog(outPtr)
        }

        return this.__IPackageExtensionCatalog.add_PackageStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageStatusChanged(token) {
        if (!this.HasProp("__IPackageExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageExtensionCatalog := IPackageExtensionCatalog(outPtr)
        }

        return this.__IPackageExtensionCatalog.remove_PackageStatusChanged(token)
    }

;@endregion Instance Methods
}
