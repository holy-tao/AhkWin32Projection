#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskListSyncManager.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\UserDataTaskListSyncManager.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides functionality for syncing task information with the server.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklistsyncmanager
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskListSyncManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskListSyncManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskListSyncManager.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the last time a sync was attempted with the server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklistsyncmanager.lastattemptedsynctime
     * @type {DateTime} 
     */
    LastAttemptedSyncTime {
        get => this.get_LastAttemptedSyncTime()
        set => this.put_LastAttemptedSyncTime(value)
    }

    /**
     * Gets or sets the last time the [UserDataTaskList](userdatatasklist.md) was successfully synced with the server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklistsyncmanager.lastsuccessfulsynctime
     * @type {DateTime} 
     */
    LastSuccessfulSyncTime {
        get => this.get_LastSuccessfulSyncTime()
        set => this.put_LastSuccessfulSyncTime(value)
    }

    /**
     * Gets or sets the [UserDataTaskListSyncStatus](userdatatasklistsyncstatus.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklistsyncmanager.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * Occurs when the sync status with the server has changed.
     * @type {TypedEventHandler<UserDataTaskListSyncManager, IInspectable>}
    */
    OnSyncStatusChanged {
        get {
            if(!this.HasProp("__OnSyncStatusChanged")){
                this.__OnSyncStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{03e790f2-eacf-53eb-9060-6bfeec5bc375}"),
                    UserDataTaskListSyncManager,
                    IInspectable
                )
                this.__OnSyncStatusChangedToken := this.add_SyncStatusChanged(this.__OnSyncStatusChanged.iface)
            }
            return this.__OnSyncStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSyncStatusChangedToken")) {
            this.remove_SyncStatusChanged(this.__OnSyncStatusChangedToken)
            this.__OnSyncStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastAttemptedSyncTime() {
        if (!this.HasProp("__IUserDataTaskListSyncManager")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSyncManager := IUserDataTaskListSyncManager(outPtr)
        }

        return this.__IUserDataTaskListSyncManager.get_LastAttemptedSyncTime()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LastAttemptedSyncTime(value) {
        if (!this.HasProp("__IUserDataTaskListSyncManager")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSyncManager := IUserDataTaskListSyncManager(outPtr)
        }

        return this.__IUserDataTaskListSyncManager.put_LastAttemptedSyncTime(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastSuccessfulSyncTime() {
        if (!this.HasProp("__IUserDataTaskListSyncManager")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSyncManager := IUserDataTaskListSyncManager(outPtr)
        }

        return this.__IUserDataTaskListSyncManager.get_LastSuccessfulSyncTime()
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_LastSuccessfulSyncTime(value) {
        if (!this.HasProp("__IUserDataTaskListSyncManager")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSyncManager := IUserDataTaskListSyncManager(outPtr)
        }

        return this.__IUserDataTaskListSyncManager.put_LastSuccessfulSyncTime(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IUserDataTaskListSyncManager")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSyncManager := IUserDataTaskListSyncManager(outPtr)
        }

        return this.__IUserDataTaskListSyncManager.get_Status()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        if (!this.HasProp("__IUserDataTaskListSyncManager")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSyncManager := IUserDataTaskListSyncManager(outPtr)
        }

        return this.__IUserDataTaskListSyncManager.put_Status(value)
    }

    /**
     * Asynchronously attempts to sync with the tasks server.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklistsyncmanager.syncasync
     */
    SyncAsync() {
        if (!this.HasProp("__IUserDataTaskListSyncManager")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSyncManager := IUserDataTaskListSyncManager(outPtr)
        }

        return this.__IUserDataTaskListSyncManager.SyncAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<UserDataTaskListSyncManager, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SyncStatusChanged(handler) {
        if (!this.HasProp("__IUserDataTaskListSyncManager")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSyncManager := IUserDataTaskListSyncManager(outPtr)
        }

        return this.__IUserDataTaskListSyncManager.add_SyncStatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SyncStatusChanged(token) {
        if (!this.HasProp("__IUserDataTaskListSyncManager")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSyncManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSyncManager := IUserDataTaskListSyncManager(outPtr)
        }

        return this.__IUserDataTaskListSyncManager.remove_SyncStatusChanged(token)
    }

;@endregion Instance Methods
}
