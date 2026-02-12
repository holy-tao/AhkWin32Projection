#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreUninstallStorePackageResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides response data for a request to uninstall a package for the current app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeuninstallstorepackageresult
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreUninstallStorePackageResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreUninstallStorePackageResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreUninstallStorePackageResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error code for the request, if the operation encountered an error.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeuninstallstorepackageresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Gets the status of the package uninstall request.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeuninstallstorepackageresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IStoreUninstallStorePackageResult")) {
            if ((queryResult := this.QueryInterface(IStoreUninstallStorePackageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreUninstallStorePackageResult := IStoreUninstallStorePackageResult(outPtr)
        }

        return this.__IStoreUninstallStorePackageResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IStoreUninstallStorePackageResult")) {
            if ((queryResult := this.QueryInterface(IStoreUninstallStorePackageResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreUninstallStorePackageResult := IStoreUninstallStorePackageResult(outPtr)
        }

        return this.__IStoreUninstallStorePackageResult.get_Status()
    }

;@endregion Instance Methods
}
