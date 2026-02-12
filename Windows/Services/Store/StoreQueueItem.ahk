#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStoreQueueItem.ahk
#Include .\IStoreQueueItem2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\StoreQueueItem.ahk
#Include .\StoreQueueItemCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents info about a new or updated package that is in the download and installation queue for the current app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitem
 * @namespace Windows.Services.Store
 * @version WindowsRuntime 1.4
 */
class StoreQueueItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStoreQueueItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStoreQueueItem.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the add-on product ID of the current package in the queue, if the package corresponds to an add-on.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitem.productid
     * @type {HSTRING} 
     */
    ProductId {
        get => this.get_ProductId()
    }

    /**
     * Gets the package family name of the current package in the queue.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitem.packagefamilyname
     * @type {HSTRING} 
     */
    PackageFamilyName {
        get => this.get_PackageFamilyName()
    }

    /**
     * Gets a value that describes the operation being performed for the current package in the download and installation queue.
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitem.installkind
     * @type {Integer} 
     */
    InstallKind {
        get => this.get_InstallKind()
    }

    /**
     * Raised when the download and installation of the current package in the queue is completed.
     * @type {TypedEventHandler<StoreQueueItem, StoreQueueItemCompletedEventArgs>}
    */
    OnCompleted {
        get {
            if(!this.HasProp("__OnCompleted")){
                this.__OnCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2bac2880-78fd-5cbe-8271-7d583e4ec2c4}"),
                    StoreQueueItem,
                    StoreQueueItemCompletedEventArgs
                )
                this.__OnCompletedToken := this.add_Completed(this.__OnCompleted.iface)
            }
            return this.__OnCompleted
        }
    }

    /**
     * Raised when the status of the current package in the queue changes.
     * @type {TypedEventHandler<StoreQueueItem, IInspectable>}
    */
    OnStatusChanged {
        get {
            if(!this.HasProp("__OnStatusChanged")){
                this.__OnStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f8ae3690-f9db-57e8-843e-244c0a6a13e0}"),
                    StoreQueueItem,
                    IInspectable
                )
                this.__OnStatusChangedToken := this.add_StatusChanged(this.__OnStatusChanged.iface)
            }
            return this.__OnStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCompletedToken")) {
            this.remove_Completed(this.__OnCompletedToken)
            this.__OnCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnStatusChangedToken")) {
            this.remove_StatusChanged(this.__OnStatusChangedToken)
            this.__OnStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProductId() {
        if (!this.HasProp("__IStoreQueueItem")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItem := IStoreQueueItem(outPtr)
        }

        return this.__IStoreQueueItem.get_ProductId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PackageFamilyName() {
        if (!this.HasProp("__IStoreQueueItem")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItem := IStoreQueueItem(outPtr)
        }

        return this.__IStoreQueueItem.get_PackageFamilyName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstallKind() {
        if (!this.HasProp("__IStoreQueueItem")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItem := IStoreQueueItem(outPtr)
        }

        return this.__IStoreQueueItem.get_InstallKind()
    }

    /**
     * Returns the status of the current package in the queue.
     * @returns {StoreQueueItemStatus} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitem.getcurrentstatus
     */
    GetCurrentStatus() {
        if (!this.HasProp("__IStoreQueueItem")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItem := IStoreQueueItem(outPtr)
        }

        return this.__IStoreQueueItem.GetCurrentStatus()
    }

    /**
     * 
     * @param {TypedEventHandler<StoreQueueItem, StoreQueueItemCompletedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Completed(handler) {
        if (!this.HasProp("__IStoreQueueItem")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItem := IStoreQueueItem(outPtr)
        }

        return this.__IStoreQueueItem.add_Completed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Completed(token) {
        if (!this.HasProp("__IStoreQueueItem")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItem := IStoreQueueItem(outPtr)
        }

        return this.__IStoreQueueItem.remove_Completed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<StoreQueueItem, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(handler) {
        if (!this.HasProp("__IStoreQueueItem")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItem := IStoreQueueItem(outPtr)
        }

        return this.__IStoreQueueItem.add_StatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusChanged(token) {
        if (!this.HasProp("__IStoreQueueItem")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItem := IStoreQueueItem(outPtr)
        }

        return this.__IStoreQueueItem.remove_StatusChanged(token)
    }

    /**
     * Cancels the install for the current package in the queue.
     * @remarks
     * To resume the install for the current package in the queue, use [ResumeInstallAsync](storequeueitem_resumeinstallasync_1544665090.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitem.cancelinstallasync
     */
    CancelInstallAsync() {
        if (!this.HasProp("__IStoreQueueItem2")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItem2 := IStoreQueueItem2(outPtr)
        }

        return this.__IStoreQueueItem2.CancelInstallAsync()
    }

    /**
     * Pauses the install for the current package in the queue.
     * @remarks
     * To resume the install for the current package in the queue, use [ResumeInstallAsync](storequeueitem_resumeinstallasync_1544665090.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitem.pauseinstallasync
     */
    PauseInstallAsync() {
        if (!this.HasProp("__IStoreQueueItem2")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItem2 := IStoreQueueItem2(outPtr)
        }

        return this.__IStoreQueueItem2.PauseInstallAsync()
    }

    /**
     * Resumes the install for the current package in the queue.
     * @remarks
     * If you pause or cancel the install for the current package in the queue by using the [PauseInstallAsync](storequeueitem_pauseinstallasync_1526538422.md) or [CancelInstallAsync](storequeueitem_cancelinstallasync_474034196.md) methods, you can use this method to resume the install.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.store.storequeueitem.resumeinstallasync
     */
    ResumeInstallAsync() {
        if (!this.HasProp("__IStoreQueueItem2")) {
            if ((queryResult := this.QueryInterface(IStoreQueueItem2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStoreQueueItem2 := IStoreQueueItem2(outPtr)
        }

        return this.__IStoreQueueItem2.ResumeInstallAsync()
    }

;@endregion Instance Methods
}
