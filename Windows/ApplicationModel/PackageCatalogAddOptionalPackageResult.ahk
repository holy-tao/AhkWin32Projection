#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPackageCatalogAddOptionalPackageResult.ahk
#Include ..\..\Guid.ahk

/**
 * Provides information about the result of adding an optional package to the package catalog.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalogaddoptionalpackageresult
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageCatalogAddOptionalPackageResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPackageCatalogAddOptionalPackageResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPackageCatalogAddOptionalPackageResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Get the optional package that was added to the package catalog.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalogaddoptionalpackageresult.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * Provides error information about the attempt to add an optional package to the catalog.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packagecatalogaddoptionalpackageresult.extendederror
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
        if (!this.HasProp("__IPackageCatalogAddOptionalPackageResult")) {
            if ((queryResult := this.QueryInterface(IPackageCatalogAddOptionalPackageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalogAddOptionalPackageResult := IPackageCatalogAddOptionalPackageResult(outPtr)
        }

        return this.__IPackageCatalogAddOptionalPackageResult.get_Package()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IPackageCatalogAddOptionalPackageResult")) {
            if ((queryResult := this.QueryInterface(IPackageCatalogAddOptionalPackageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPackageCatalogAddOptionalPackageResult := IPackageCatalogAddOptionalPackageResult(outPtr)
        }

        return this.__IPackageCatalogAddOptionalPackageResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
