#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStorePackageUpdateResult.ahk
#Include .\IStorePackageUpdateResult2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides response data for a request to download and install a package for the current app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackageupdateresult
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StorePackageUpdateResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStorePackageUpdateResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStorePackageUpdateResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the state of the completed package update request.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackageupdateresult.overallstate
     * @type {Integer} 
     */
    OverallState {
        get => this.get_OverallState()
    }

    /**
     * Gets info about the status of each of the package updates that are associated with the completed request.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackageupdateresult.storepackageupdatestatuses
     * @type {IVectorView<StorePackageUpdateStatus>} 
     */
    StorePackageUpdateStatuses {
        get => this.get_StorePackageUpdateStatuses()
    }

    /**
     * Gets installation queue info about each of the package updates that are associated with the completed request.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storepackageupdateresult.storequeueitems
     * @type {IVectorView<StoreQueueItem>} 
     */
    StoreQueueItems {
        get => this.get_StoreQueueItems()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OverallState() {
        if (!this.HasProp("__IStorePackageUpdateResult")) {
            if ((queryResult := this.QueryInterface(IStorePackageUpdateResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePackageUpdateResult := IStorePackageUpdateResult(outPtr)
        }

        return this.__IStorePackageUpdateResult.get_OverallState()
    }

    /**
     * 
     * @returns {IVectorView<StorePackageUpdateStatus>} 
     */
    get_StorePackageUpdateStatuses() {
        if (!this.HasProp("__IStorePackageUpdateResult")) {
            if ((queryResult := this.QueryInterface(IStorePackageUpdateResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePackageUpdateResult := IStorePackageUpdateResult(outPtr)
        }

        return this.__IStorePackageUpdateResult.get_StorePackageUpdateStatuses()
    }

    /**
     * 
     * @returns {IVectorView<StoreQueueItem>} 
     */
    get_StoreQueueItems() {
        if (!this.HasProp("__IStorePackageUpdateResult2")) {
            if ((queryResult := this.QueryInterface(IStorePackageUpdateResult2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStorePackageUpdateResult2 := IStorePackageUpdateResult2(outPtr)
        }

        return this.__IStorePackageUpdateResult2.get_StoreQueueItems()
    }

;@endregion Instance Methods
}
