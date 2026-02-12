#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageCatalogAddResourcePackageResult.ahk
#Include ..\..\Guid.ahk

/**
 * Provides information on the status of adding resource packages to an app package.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalogaddresourcepackageresult
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageCatalogAddResourcePackageResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageCatalogAddResourcePackageResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageCatalogAddResourcePackageResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the app package that the resource package was added to.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalogaddresourcepackageresult.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * A boolean value that specifies if the resource package has been completely addded to an app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalogaddresourcepackageresult.iscomplete
     * @type {Boolean} 
     */
    IsComplete {
        get => this.get_IsComplete()
    }

    /**
     * An extended error code generated when adding a resource package to an app package.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalogaddresourcepackageresult.extendederror
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
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IPackageCatalogAddResourcePackageResult")) {
            if ((queryResult := this.QueryInterface(IPackageCatalogAddResourcePackageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalogAddResourcePackageResult := IPackageCatalogAddResourcePackageResult(outPtr)
        }

        return this.__IPackageCatalogAddResourcePackageResult.get_Package()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComplete() {
        if (!this.HasProp("__IPackageCatalogAddResourcePackageResult")) {
            if ((queryResult := this.QueryInterface(IPackageCatalogAddResourcePackageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalogAddResourcePackageResult := IPackageCatalogAddResourcePackageResult(outPtr)
        }

        return this.__IPackageCatalogAddResourcePackageResult.get_IsComplete()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IPackageCatalogAddResourcePackageResult")) {
            if ((queryResult := this.QueryInterface(IPackageCatalogAddResourcePackageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalogAddResourcePackageResult := IPackageCatalogAddResourcePackageResult(outPtr)
        }

        return this.__IPackageCatalogAddResourcePackageResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
