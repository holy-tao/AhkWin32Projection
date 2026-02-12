#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorePackageLicense.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\StorePackageLicense.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides license info for a downloadable content (DLC) package for the current app.
 * @remarks
 * The [StoreAcquireLicenseResult.StorePackageLicense](storeacquirelicenseresult_storepackagelicense.md) property returns an object of this type.
 * 
 * > [!NOTE]  
 * > Downloadable content (DLC) packages are not available to all developer accounts.
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackagelicense
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StorePackageLicense extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorePackageLicense

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorePackageLicense.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the downloadable content (DLC) package that is associated with the license.
     * @remarks
     * > [!NOTE]
     * > Downloadable content (DLC) packages are not available to all developer accounts.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackagelicense.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * Gets a value that indicates whether the license is valid.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackagelicense.isvalid
     * @type {Boolean} 
     */
    IsValid {
        get => this.get_IsValid()
    }

    /**
     * Raised when user no longer has rights to the license on the current device (for example, the user has acquired the license on a different device).
     * @type {TypedEventHandler<StorePackageLicense, IInspectable>}
    */
    OnLicenseLost {
        get {
            if(!this.HasProp("__OnLicenseLost")){
                this.__OnLicenseLost := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6c59d637-2970-5f64-9511-d39ac245bc94}"),
                    StorePackageLicense,
                    IInspectable
                )
                this.__OnLicenseLostToken := this.add_LicenseLost(this.__OnLicenseLost.iface)
            }
            return this.__OnLicenseLost
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnLicenseLostToken")) {
            this.remove_LicenseLost(this.__OnLicenseLostToken)
            this.__OnLicenseLost.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<StorePackageLicense, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LicenseLost(handler) {
        if (!this.HasProp("__IStorePackageLicense")) {
            if ((queryResult := this.QueryInterface(IStorePackageLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePackageLicense := IStorePackageLicense(outPtr)
        }

        return this.__IStorePackageLicense.add_LicenseLost(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_LicenseLost(token) {
        if (!this.HasProp("__IStorePackageLicense")) {
            if ((queryResult := this.QueryInterface(IStorePackageLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePackageLicense := IStorePackageLicense(outPtr)
        }

        return this.__IStorePackageLicense.remove_LicenseLost(token)
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IStorePackageLicense")) {
            if ((queryResult := this.QueryInterface(IStorePackageLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePackageLicense := IStorePackageLicense(outPtr)
        }

        return this.__IStorePackageLicense.get_Package()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsValid() {
        if (!this.HasProp("__IStorePackageLicense")) {
            if ((queryResult := this.QueryInterface(IStorePackageLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePackageLicense := IStorePackageLicense(outPtr)
        }

        return this.__IStorePackageLicense.get_IsValid()
    }

    /**
     * Releases the license for the downloadable content (DLC) package.
     * @remarks
     * > [!NOTE]
     * > Downloadable content (DLC) packages are not available to all developer accounts.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackagelicense.releaselicense
     */
    ReleaseLicense() {
        if (!this.HasProp("__IStorePackageLicense")) {
            if ((queryResult := this.QueryInterface(IStorePackageLicense.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePackageLicense := IStorePackageLicense(outPtr)
        }

        return this.__IStorePackageLicense.ReleaseLicense()
    }

    /**
     * Closes and releases any resources used by this [StorePackageLicense.](storepackagelicense.md)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackagelicense.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
