#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorePackageUpdate.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides info about a package for the current app that has an update available for download from the Microsoft Store.
 * @remarks
 * The [StoreContext.GetAppAndOptionalStorePackageUpdatesAsync](storecontext_getappandoptionalstorepackageupdatesasync_399599716.md) method returns objects of this type. For more information, including a code example, see [Download and install package updates for your app](/windows/uwp/packaging/self-install-package-updates).
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackageupdate
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StorePackageUpdate extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorePackageUpdate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorePackageUpdate.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the package that has an update available for download from the Microsoft Store.
     * @remarks
     * For more information about using this property, including a code example, see [Download and install package updates for your app](/windows/uwp/packaging/self-install-package-updates).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackageupdate.package
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * Gets a value that indicates whether the package that has an update available for download from the Microsoft Store is a mandatory package, as specified by the developer in [Partner Center](https://partner.microsoft.com/dashboard).
     * @remarks
     * The mandatory status of a package is not enforced by Microsoft, and the OS does not provide a UI to indicate to users that a mandatory app must be installed. Developers are intended to use the mandatory setting to enforce mandatory app updates in their own code that uses [GetAppAndOptionalStorePackageUpdatesAsync](storecontext_getappandoptionalstorepackageupdatesasync_399599716.md) to determine which packages have updates available and [RequestDownloadStorePackageUpdatesAsync](storecontext_requestdownloadstorepackageupdatesasync_889669938.md) or [RequestDownloadAndInstallStorePackageUpdatesAsync](storecontext_requestdownloadandinstallstorepackageupdatesasync_1750789617.md) to download or install the updated packages.
     * 
     * For more information about using this property, including a code example, see [Download and install package updates for your app](/windows/uwp/packaging/self-install-package-updates).
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackageupdate.mandatory
     * @type {Boolean} 
     */
    Mandatory {
        get => this.get_Mandatory()
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
        if (!this.HasProp("__IStorePackageUpdate")) {
            if ((queryResult := this.QueryInterface(IStorePackageUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePackageUpdate := IStorePackageUpdate(outPtr)
        }

        return this.__IStorePackageUpdate.get_Package()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Mandatory() {
        if (!this.HasProp("__IStorePackageUpdate")) {
            if ((queryResult := this.QueryInterface(IStorePackageUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePackageUpdate := IStorePackageUpdate(outPtr)
        }

        return this.__IStorePackageUpdate.get_Mandatory()
    }

;@endregion Instance Methods
}
