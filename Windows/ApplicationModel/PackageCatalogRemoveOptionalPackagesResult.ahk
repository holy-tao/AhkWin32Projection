#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageCatalogRemoveOptionalPackagesResult.ahk
#Include ..\..\Guid.ahk

/**
 * Provides information on the status of removing optional packages.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalogremoveoptionalpackagesresult
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageCatalogRemoveOptionalPackagesResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageCatalogRemoveOptionalPackagesResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageCatalogRemoveOptionalPackagesResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * A list of the optional packages that were successfully removed from the user account.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalogremoveoptionalpackagesresult.packagesremoved
     * @type {IVectorView<Package>} 
     */
    PackagesRemoved {
        get => this.get_PackagesRemoved()
    }

    /**
     * Contains the extended error information for removing optional packages.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalogremoveoptionalpackagesresult.extendederror
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
        if (!this.HasProp("__IPackageCatalogRemoveOptionalPackagesResult")) {
            if ((queryResult := this.QueryInterface(IPackageCatalogRemoveOptionalPackagesResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalogRemoveOptionalPackagesResult := IPackageCatalogRemoveOptionalPackagesResult(outPtr)
        }

        return this.__IPackageCatalogRemoveOptionalPackagesResult.get_PackagesRemoved()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IPackageCatalogRemoveOptionalPackagesResult")) {
            if ((queryResult := this.QueryInterface(IPackageCatalogRemoveOptionalPackagesResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalogRemoveOptionalPackagesResult := IPackageCatalogRemoveOptionalPackagesResult(outPtr)
        }

        return this.__IPackageCatalogRemoveOptionalPackagesResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
