#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreAcquireLicenseResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides response data for a request to acquire the license for a downloadable content (DLC) add-on package for the current app.
 * @remarks
 * The [StoreContext.AcquireStoreLicenseForOptionalPackageAsync](storecontext_acquirestorelicenseforoptionalpackageasync_1044105908.md) method returns an object of this type.
 * 
 * > [!NOTE]
 * > Downloadable content (DLC) packages are not available to all developer accounts.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeacquirelicenseresult
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreAcquireLicenseResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreAcquireLicenseResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreAcquireLicenseResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets an object that represents the license for a downloadable content (DLC) add-on package for the current app.
     * @remarks
     * > [!NOTE]
     * > Downloadable content (DLC) packages are not available to all developer accounts.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeacquirelicenseresult.storepackagelicense
     * @type {StorePackageLicense} 
     */
    StorePackageLicense {
        get => this.get_StorePackageLicense()
    }

    /**
     * Gets the error code for the request, if the operation encountered an error.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storeacquirelicenseresult.extendederror
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
     * @returns {StorePackageLicense} 
     */
    get_StorePackageLicense() {
        if (!this.HasProp("__IStoreAcquireLicenseResult")) {
            if ((queryResult := this.QueryInterface(IStoreAcquireLicenseResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAcquireLicenseResult := IStoreAcquireLicenseResult(outPtr)
        }

        return this.__IStoreAcquireLicenseResult.get_StorePackageLicense()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IStoreAcquireLicenseResult")) {
            if ((queryResult := this.QueryInterface(IStoreAcquireLicenseResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreAcquireLicenseResult := IStoreAcquireLicenseResult(outPtr)
        }

        return this.__IStoreAcquireLicenseResult.get_ExtendedError()
    }

;@endregion Instance Methods
}
