#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageCatalogRemoveResourcePackagesResult.ahk
#Include ..\..\Guid.ahk

/**
 * Provides information on the status of removing resource packages from an app package.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalogremoveresourcepackagesresult
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageCatalogRemoveResourcePackagesResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageCatalogRemoveResourcePackagesResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageCatalogRemoveResourcePackagesResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the resource packages that were removed from the app package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalogremoveresourcepackagesresult.packagesremoved
     * @type {IVectorView<Package>} 
     */
    PackagesRemoved {
        get => this.get_PackagesRemoved()
    }

    /**
     * An extended error code generated when removing a resource package from an app package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalogremoveresourcepackagesresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<Package>} 
     */
    get_PackagesRemoved() {
        if (!this.HasProp("__IPackageCatalogRemoveResourcePackagesResult")) {
            if ((queryResult := this.QueryInterface(IPackageCatalogRemoveResourcePackagesResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalogRemoveResourcePackagesResult := IPackageCatalogRemoveResourcePackagesResult(outPtr)
        }

        return this.__IPackageCatalogRemoveResourcePackagesResult.get_PackagesRemoved()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IPackageCatalogRemoveResourcePackagesResult")) {
            if ((queryResult := this.QueryInterface(IPackageCatalogRemoveResourcePackagesResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalogRemoveResourcePackagesResult := IPackageCatalogRemoveResourcePackagesResult(outPtr)
        }

        return this.__IPackageCatalogRemoveResourcePackagesResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
