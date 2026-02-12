#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreCanAcquireLicenseResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides response data for a request to determine whether a license can be acquired for a downloadable content (DLC) add-on package.
 * @remarks
 * > [!NOTE]
 * > Downloadable content (DLC) packages are not available to all developer accounts.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecanacquirelicenseresult
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreCanAcquireLicenseResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreCanAcquireLicenseResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreCanAcquireLicenseResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error code for the request, if the operation encountered an error.
     * @remarks
     * If the **ErrorCode** property of the exception has the value 0x80070005 (E_ACCESSDENIED), this indicates that the specified downloadable content (DLC) add-on is not sellable by the current app.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecanacquirelicenseresult.extendederror
     * @type {HRESULT} 
     */
    ExtendedError {
        get => this.get_ExtendedError()
    }

    /**
     * Gets the [SKU Store ID](/windows/uwp/monetize/in-app-purchases-and-trials#store-ids) of the downloadable content (DLC) add-on, if a license can be acquired for the add-on for the current user.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecanacquirelicenseresult.licensablesku
     * @type {HSTRING} 
     */
    LicensableSku {
        get => this.get_LicensableSku()
    }

    /**
     * Gets the license status for the downloadable content (DLC) add-on package.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storecanacquirelicenseresult.status
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
        if (!this.HasProp("__IStoreCanAcquireLicenseResult")) {
            if ((queryResult := this.QueryInterface(IStoreCanAcquireLicenseResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreCanAcquireLicenseResult := IStoreCanAcquireLicenseResult(outPtr)
        }

        return this.__IStoreCanAcquireLicenseResult.get_ExtendedError()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LicensableSku() {
        if (!this.HasProp("__IStoreCanAcquireLicenseResult")) {
            if ((queryResult := this.QueryInterface(IStoreCanAcquireLicenseResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreCanAcquireLicenseResult := IStoreCanAcquireLicenseResult(outPtr)
        }

        return this.__IStoreCanAcquireLicenseResult.get_LicensableSku()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IStoreCanAcquireLicenseResult")) {
            if ((queryResult := this.QueryInterface(IStoreCanAcquireLicenseResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreCanAcquireLicenseResult := IStoreCanAcquireLicenseResult(outPtr)
        }

        return this.__IStoreCanAcquireLicenseResult.get_Status()
    }

;@endregion Instance Methods
}
