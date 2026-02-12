#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageCatalog.ahk
#Include .\IPackageCatalog2.ahk
#Include .\IPackageCatalog3.ahk
#Include .\IPackageCatalog4.ahk
#Include .\IPackageCatalogStatics2.ahk
#Include .\IPackageCatalogStatics.ahk
#Include ..\Foundation\TypedEventHandler.ahk
#Include .\PackageCatalog.ahk
#Include .\PackageStagingEventArgs.ahk
#Include .\PackageInstallingEventArgs.ahk
#Include .\PackageUpdatingEventArgs.ahk
#Include .\PackageUninstallingEventArgs.ahk
#Include .\PackageStatusChangedEventArgs.ahk
#Include .\PackageContentGroupStagingEventArgs.ahk
#Include ..\..\Guid.ahk
#Include ..\..\WinRTEventHandler.ahk

/**
 * Provides access to app packages on the device.
 * @remarks
 * Note that for PackageCatalog events:   
 * 
 * - If the PackageCatalog object is obtained using **[OpenForCurrentUser](/uwp/api/windows.applicationmodel.packagecatalog.OpenForCurrentUser)**, package events will be received for all packages being installed for the current user.  
 * 
 * - If the PackageCatalog object is obtained using **[OpenForCurrentPackage](/uwp/api/windows.applicationmodel.packagecatalog.OpenForCurrentPackage)**, package events will be received for the current package or its related packages such as optional packages.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalog
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageCatalog extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageCatalog

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageCatalog.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Allows listening to any **Package** and its dependents (optional, resource, and hostRuntime).
     * @remarks
     * **OpenForPackage** allows a package to listen to deployment notifications for another package and its dependents (like PWAs).
     * 
     * In terms of capability requirements, **OpenForPackage** requires that the caller has either the `packageQuery` or the `packageManagement` capability; or else that the caller has integrity level (IL) greater than or equal to Medium; or else that the caller's process has the same package family as the target package.
     * @param {Package} package_ The **Package** which will be monitored for notifications.
     * @returns {PackageCatalog} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalog.openforpackage
     */
    static OpenForPackage(package_) {
        if (!PackageCatalog.HasProp("__IPackageCatalogStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.PackageCatalog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPackageCatalogStatics2.IID)
            PackageCatalog.__IPackageCatalogStatics2 := IPackageCatalogStatics2(factoryPtr)
        }

        return PackageCatalog.__IPackageCatalogStatics2.OpenForPackage(package_)
    }

    /**
     * Opens the catalog of packages for the main package.
     * @remarks
     * Use [Package.Dependencies](package_dependencies.md) to get the list of optional packages.
     * @returns {PackageCatalog} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalog.openforcurrentpackage
     */
    static OpenForCurrentPackage() {
        if (!PackageCatalog.HasProp("__IPackageCatalogStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.PackageCatalog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPackageCatalogStatics.IID)
            PackageCatalog.__IPackageCatalogStatics := IPackageCatalogStatics(factoryPtr)
        }

        return PackageCatalog.__IPackageCatalogStatics.OpenForCurrentPackage()
    }

    /**
     * Opens the catalog of app packages on the device that are available to the current user.
     * @remarks
     * In terms of capability requirements, **OpenForCurrentUser** requires that the caller has either the `packageQuery` or the `packageManagement` capability; or else that the caller has integrity level (IL) greater than or equal to Medium.
     * @returns {PackageCatalog} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalog.openforcurrentuser
     */
    static OpenForCurrentUser() {
        if (!PackageCatalog.HasProp("__IPackageCatalogStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.PackageCatalog")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPackageCatalogStatics.IID)
            PackageCatalog.__IPackageCatalogStatics := IPackageCatalogStatics(factoryPtr)
        }

        return PackageCatalog.__IPackageCatalogStatics.OpenForCurrentUser()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPackageStagingToken")) {
            this.remove_PackageStaging(this.__OnPackageStagingToken)
            this.__OnPackageStaging.iface.Dispose()
        }

        if(this.HasProp("__OnPackageInstallingToken")) {
            this.remove_PackageInstalling(this.__OnPackageInstallingToken)
            this.__OnPackageInstalling.iface.Dispose()
        }

        if(this.HasProp("__OnPackageUpdatingToken")) {
            this.remove_PackageUpdating(this.__OnPackageUpdatingToken)
            this.__OnPackageUpdating.iface.Dispose()
        }

        if(this.HasProp("__OnPackageUninstallingToken")) {
            this.remove_PackageUninstalling(this.__OnPackageUninstallingToken)
            this.__OnPackageUninstalling.iface.Dispose()
        }

        if(this.HasProp("__OnPackageStatusChangedToken")) {
            this.remove_PackageStatusChanged(this.__OnPackageStatusChangedToken)
            this.__OnPackageStatusChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPackageContentGroupStagingToken")) {
            this.remove_PackageContentGroupStaging(this.__OnPackageContentGroupStagingToken)
            this.__OnPackageContentGroupStaging.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<PackageCatalog, PackageStagingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageStaging(handler) {
        if (!this.HasProp("__IPackageCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog := IPackageCatalog(outPtr)
        }

        return this.__IPackageCatalog.add_PackageStaging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageStaging(token) {
        if (!this.HasProp("__IPackageCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog := IPackageCatalog(outPtr)
        }

        return this.__IPackageCatalog.remove_PackageStaging(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PackageCatalog, PackageInstallingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageInstalling(handler) {
        if (!this.HasProp("__IPackageCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog := IPackageCatalog(outPtr)
        }

        return this.__IPackageCatalog.add_PackageInstalling(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageInstalling(token) {
        if (!this.HasProp("__IPackageCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog := IPackageCatalog(outPtr)
        }

        return this.__IPackageCatalog.remove_PackageInstalling(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PackageCatalog, PackageUpdatingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageUpdating(handler) {
        if (!this.HasProp("__IPackageCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog := IPackageCatalog(outPtr)
        }

        return this.__IPackageCatalog.add_PackageUpdating(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageUpdating(token) {
        if (!this.HasProp("__IPackageCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog := IPackageCatalog(outPtr)
        }

        return this.__IPackageCatalog.remove_PackageUpdating(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PackageCatalog, PackageUninstallingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageUninstalling(handler) {
        if (!this.HasProp("__IPackageCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog := IPackageCatalog(outPtr)
        }

        return this.__IPackageCatalog.add_PackageUninstalling(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageUninstalling(token) {
        if (!this.HasProp("__IPackageCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog := IPackageCatalog(outPtr)
        }

        return this.__IPackageCatalog.remove_PackageUninstalling(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PackageCatalog, PackageStatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageStatusChanged(handler) {
        if (!this.HasProp("__IPackageCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog := IPackageCatalog(outPtr)
        }

        return this.__IPackageCatalog.add_PackageStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageStatusChanged(token) {
        if (!this.HasProp("__IPackageCatalog")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog := IPackageCatalog(outPtr)
        }

        return this.__IPackageCatalog.remove_PackageStatusChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PackageCatalog, PackageContentGroupStagingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PackageContentGroupStaging(handler) {
        if (!this.HasProp("__IPackageCatalog2")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog2 := IPackageCatalog2(outPtr)
        }

        return this.__IPackageCatalog2.add_PackageContentGroupStaging(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PackageContentGroupStaging(token) {
        if (!this.HasProp("__IPackageCatalog2")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog2 := IPackageCatalog2(outPtr)
        }

        return this.__IPackageCatalog2.remove_PackageContentGroupStaging(token)
    }

    /**
     * Adds an optional package to the package catalog.
     * @remarks
     * This method only works for optional packages in a related set.
     * @param {HSTRING} optionalPackageFamilyName The package family of the optional package to add to the catalog.
     * @returns {IAsyncOperation<PackageCatalogAddOptionalPackageResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalog.addoptionalpackageasync
     */
    AddOptionalPackageAsync(optionalPackageFamilyName) {
        if (!this.HasProp("__IPackageCatalog2")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog2 := IPackageCatalog2(outPtr)
        }

        return this.__IPackageCatalog2.AddOptionalPackageAsync(optionalPackageFamilyName)
    }

    /**
     * Removes installed optional app packages from the user account.
     * @remarks
     * A package family name can be found in the FamilyName property of the [PackageId](/uwp/api/windows.applicationmodel.packageid).
     * @param {IIterable<HSTRING>} optionalPackageFamilyNames A list of optional package family name strings.
     * @returns {IAsyncOperation<PackageCatalogRemoveOptionalPackagesResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalog.removeoptionalpackagesasync
     */
    RemoveOptionalPackagesAsync(optionalPackageFamilyNames) {
        if (!this.HasProp("__IPackageCatalog3")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog3 := IPackageCatalog3(outPtr)
        }

        return this.__IPackageCatalog3.RemoveOptionalPackagesAsync(optionalPackageFamilyNames)
    }

    /**
     * Adds a resource package to an existing app package.
     * @param {HSTRING} resourcePackageFamilyName Package family name that uniquely identifies the app's package.
     * @param {HSTRING} resourceID The resource ID of the package.
     * @param {Integer} options Options to specify the behavior when adding a resource package to an app.
     * @returns {IAsyncOperationWithProgress<PackageCatalogAddResourcePackageResult, PackageInstallProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalog.addresourcepackageasync
     */
    AddResourcePackageAsync(resourcePackageFamilyName, resourceID, options) {
        if (!this.HasProp("__IPackageCatalog4")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog4 := IPackageCatalog4(outPtr)
        }

        return this.__IPackageCatalog4.AddResourcePackageAsync(resourcePackageFamilyName, resourceID, options)
    }

    /**
     * Removes resource packages from an existing app package.
     * @param {IIterable<Package>} resourcePackages An iterable collection of resourcePackages to be removed.
     * @returns {IAsyncOperation<PackageCatalogRemoveResourcePackagesResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalog.removeresourcepackagesasync
     */
    RemoveResourcePackagesAsync(resourcePackages) {
        if (!this.HasProp("__IPackageCatalog4")) {
            if ((queryResult := this.QueryInterface(IPackageCatalog4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalog4 := IPackageCatalog4(outPtr)
        }

        return this.__IPackageCatalog4.RemoveResourcePackagesAsync(resourcePackages)
    }

;@endregion Instance Methods
}
