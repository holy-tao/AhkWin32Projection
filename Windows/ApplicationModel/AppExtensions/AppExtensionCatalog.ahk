#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppExtensionCatalog.ahk
#Include .\IAppExtensionCatalog2.ahk
#Include .\IAppExtensionCatalogStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\AppExtensionCatalog.ahk
#Include .\AppExtensionPackageInstalledEventArgs.ahk
#Include .\AppExtensionPackageUpdatingEventArgs.ahk
#Include .\AppExtensionPackageUpdatedEventArgs.ahk
#Include .\AppExtensionPackageUninstallingEventArgs.ahk
#Include .\AppExtensionPackageStatusChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides information about available extensions within an extension group.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensioncatalog
 * @namespace Windows.ApplicationModel.AppExtensions
 * @version WindowsRuntime 1.4
 */
class AppExtensionCatalog extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppExtensionCatalog

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppExtensionCatalog.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Opens a catalog of extensions.
     * @remarks
     * For a packaged app to see/enumerate appextensions it must meet at least one of the following criteria:
     * 
     * - Run as MediumIL (or higher)
     * - Run in an AppContainer and declare a matching appextensionhost
     * - Run in an AppContainer and have the packageQuery capability
     * 
     * This check is called by [AppExtensionCatalog.Open](/uwp/api/windows.applicationmodel.appextensions.appextensioncatalog.open) and [AppExtensionCatalog::RequestRemovePackageAsync](/uwp/api/windows.applicationmodel.appextensions.
     * 
     * If you have multiple `<uap3:AppExtensionHost>` declarations in your host app, you need to open a separate catalog for each one.
     * 
     * An instance of the **PackageCatalog** is required to handle the events so keep a reference to it as long as you need to manage your app extensions.
     * 
     * |App Extension|Purpose|
     * |----|----|
     * |com.microsoft.windows.dontmaximizeonsmallscreen|Prevents app from maximizing on launch on small devices. Currently used by the Calculator app.|
     * @param {HSTRING} appExtensionName The extension namespace name.
     * @returns {AppExtensionCatalog} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensioncatalog.open
     */
    static Open(appExtensionName) {
        if (!AppExtensionCatalog.HasProp("__IAppExtensionCatalogStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.AppExtensions.AppExtensionCatalog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAppExtensionCatalogStatics.IID)
            AppExtensionCatalog.__IAppExtensionCatalogStatics := IAppExtensionCatalogStatics(factoryPtr)
        }

        return AppExtensionCatalog.__IAppExtensionCatalogStatics.Open(appExtensionName)
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
     * <!--What's the scope - need to understand open() better-->
     * @remarks
     * Extensions are scoped by the `<uap3:AppExtension Name=...>` defined in the extension's Package.appxmanifest file. This method returns the list of extensions installed on the machine that match the `<uap3:AppExtension Name=...>` defined in the host's Package.appxmanifest file.
     * 
     * You typically call this method when your app launches or resumes from suspension. Then use the events on this class to listen for updates to the extensions in the catalog.
     * @returns {IAsyncOperation<IVectorView<AppExtension>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensioncatalog.findallasync
     */
    FindAllAsync() {
        if (!this.HasProp("__IAppExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IAppExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionCatalog := IAppExtensionCatalog(outPtr)
        }

        return this.__IAppExtensionCatalog.FindAllAsync()
    }

    /**
     * Attempts to remove the specified extension package from the machine.
     * @remarks
     * The user is prompted to allow or deny the package removal. You can only remove packages that contain extensions found in the **AppExtensionCatalog** instance you make the call from. See [AppExtensionCatalog::Open](/uwp/api/windows.applicationmodel.appextensions.appextensioncatalog.open) for more details.
     * 
     * The unit of deployment for [AppExtensions](appextension.md) is the [Package](/uwp/api/windows.applicationmodel.package). You cannot remove **AppExtensions**; you can only remove **Packages**. **Packages** may contain multiple **AppExtensions**.
     * 
     * The user may not understand the relationship between **AppExtensions** and **Packages**, or between an **AppExtension** and an app on the machine (because an app may be designed to also serve as an extension). The user may accept the request to remove a package thinking that they are only removing an extension but then find that one of their favorite apps is now gone. Only use this method if you are certain that the **AppExtension** is the only thing in the package.
     * 
     * Avoid using this method if you do not control the ecosystem of extensions involved. This method is intended for convenience in a closed ecosystem of extensions, such as in an enterprise environment.
     * 
     * **Desktop Bridge** app extension hosts cannot use this method directly. Desktop Bridge app extension hosts should use their Universal Windows Platform component to manage app extensions. For more information, see [Building an MSIX package from your code](/windows/msix/desktop/source-code-overview).
     * @param {HSTRING} packageFullName The name of the package to remove, which you can get from [AppExtension.Package.Id.FullName](/uwp/api/windows.applicationmodel.packageid).
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensioncatalog.requestremovepackageasync
     */
    RequestRemovePackageAsync(packageFullName) {
        if (!this.HasProp("__IAppExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IAppExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionCatalog := IAppExtensionCatalog(outPtr)
        }

        return this.__IAppExtensionCatalog.RequestRemovePackageAsync(packageFullName)
    }

    /**
     * 
     * @param {TypedEventHandler<AppExtensionCatalog, AppExtensionPackageInstalledEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageInstalled(handler) {
        if (!this.HasProp("__IAppExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IAppExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionCatalog := IAppExtensionCatalog(outPtr)
        }

        return this.__IAppExtensionCatalog.add_PackageInstalled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageInstalled(token) {
        if (!this.HasProp("__IAppExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IAppExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionCatalog := IAppExtensionCatalog(outPtr)
        }

        return this.__IAppExtensionCatalog.remove_PackageInstalled(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppExtensionCatalog, AppExtensionPackageUpdatingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageUpdating(handler) {
        if (!this.HasProp("__IAppExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IAppExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionCatalog := IAppExtensionCatalog(outPtr)
        }

        return this.__IAppExtensionCatalog.add_PackageUpdating(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageUpdating(token) {
        if (!this.HasProp("__IAppExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IAppExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionCatalog := IAppExtensionCatalog(outPtr)
        }

        return this.__IAppExtensionCatalog.remove_PackageUpdating(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppExtensionCatalog, AppExtensionPackageUpdatedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageUpdated(handler) {
        if (!this.HasProp("__IAppExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IAppExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionCatalog := IAppExtensionCatalog(outPtr)
        }

        return this.__IAppExtensionCatalog.add_PackageUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageUpdated(token) {
        if (!this.HasProp("__IAppExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IAppExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionCatalog := IAppExtensionCatalog(outPtr)
        }

        return this.__IAppExtensionCatalog.remove_PackageUpdated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppExtensionCatalog, AppExtensionPackageUninstallingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageUninstalling(handler) {
        if (!this.HasProp("__IAppExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IAppExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionCatalog := IAppExtensionCatalog(outPtr)
        }

        return this.__IAppExtensionCatalog.add_PackageUninstalling(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageUninstalling(token) {
        if (!this.HasProp("__IAppExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IAppExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionCatalog := IAppExtensionCatalog(outPtr)
        }

        return this.__IAppExtensionCatalog.remove_PackageUninstalling(token)
    }

    /**
     * 
     * @param {TypedEventHandler<AppExtensionCatalog, AppExtensionPackageStatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageStatusChanged(handler) {
        if (!this.HasProp("__IAppExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IAppExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionCatalog := IAppExtensionCatalog(outPtr)
        }

        return this.__IAppExtensionCatalog.add_PackageStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageStatusChanged(token) {
        if (!this.HasProp("__IAppExtensionCatalog")) {
            if ((queryResult := this.QueryInterface(IAppExtensionCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionCatalog := IAppExtensionCatalog(outPtr)
        }

        return this.__IAppExtensionCatalog.remove_PackageStatusChanged(token)
    }

    /**
     * Provides a read-only list of extensions in the catalog.
     * @remarks
     * Note that this method returns a read-only list of [AppExtensions](appextension.md), not [Packages](/uwp/api/windows.applicationmodel.package). You can get the **Package** for each **AppExtension** with [AppExtension.Package](appextension_package.md).
     * 
     * Extensions are scoped by the `<uap3:AppExtension Name=...>` defined in the extension's Package.appxmanifest file. This method returns the list of extensions installed on the machine that match the `<uap3:AppExtension Name=...>` defined in the host's Package.appxmanifest file.
     * 
     * You typically call this method when your app launches or resumes from suspension. Then use the events on this class to listen for updates to the extensions in the catalog.
     * @returns {IVectorView<AppExtension>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.appextensions.appextensioncatalog.findall
     */
    FindAll() {
        if (!this.HasProp("__IAppExtensionCatalog2")) {
            if ((queryResult := this.QueryInterface(IAppExtensionCatalog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppExtensionCatalog2 := IAppExtensionCatalog2(outPtr)
        }

        return this.__IAppExtensionCatalog2.FindAll()
    }

;@endregion Instance Methods
}
