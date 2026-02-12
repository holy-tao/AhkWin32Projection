#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreQueueItemStatus.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides status info for a new or updated package that is in the download and installation queue for the current app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitemstatus
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreQueueItemStatus extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreQueueItemStatus

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreQueueItemStatus.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that specifies the overall state for a package that is in the queue for the current app.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitemstatus.packageinstallstate
     * @type {Integer} 
     */
    PackageInstallState {
        get => this.get_PackageInstallState()
    }

    /**
     * Gets a value that specifies additional info about the state for a package that is in the download and installation queue for the current app.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitemstatus.packageinstallextendedstate
     * @type {Integer} 
     */
    PackageInstallExtendedState {
        get => this.get_PackageInstallExtendedState()
    }

    /**
     * Gets a value that specifies the update status for a package that is in the queue for the current app.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitemstatus.updatestatus
     * @type {StorePackageUpdateStatus} 
     */
    UpdateStatus {
        get => this.get_UpdateStatus()
    }

    /**
     * Gets the error code for the download and installation request, if the operation encountered an error.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitemstatus.extendederror
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
     * @returns {Integer} 
     */
    get_PackageInstallState() {
        if (!this.HasProp("__IStoreQueueItemStatus")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItemStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItemStatus := IStoreQueueItemStatus(outPtr)
        }

        return this.__IStoreQueueItemStatus.get_PackageInstallState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PackageInstallExtendedState() {
        if (!this.HasProp("__IStoreQueueItemStatus")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItemStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItemStatus := IStoreQueueItemStatus(outPtr)
        }

        return this.__IStoreQueueItemStatus.get_PackageInstallExtendedState()
    }

    /**
     * 
     * @returns {StorePackageUpdateStatus} 
     */
    get_UpdateStatus() {
        if (!this.HasProp("__IStoreQueueItemStatus")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItemStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItemStatus := IStoreQueueItemStatus(outPtr)
        }

        return this.__IStoreQueueItemStatus.get_UpdateStatus()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ExtendedError() {
        if (!this.HasProp("__IStoreQueueItemStatus")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItemStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItemStatus := IStoreQueueItemStatus(outPtr)
        }

        return this.__IStoreQueueItemStatus.get_ExtendedError()
    }

;@endregion Instance Methods
}
