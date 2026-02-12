#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskList.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a list of [UserDataTask](userdatatask.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskList extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskList

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskList.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the locally unique identifier for this [UserDataTaskList](userdatatasklist.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a string that represents the ID of the user data account for this [UserDataTaskList](userdatatasklist.md).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.userdataaccountid
     * @type {HSTRING} 
     */
    UserDataAccountId {
        get => this.get_UserDataAccountId()
    }

    /**
     * Gets or sets the name of the [UserDataTaskList](userdatatasklist.md), suitable for display in the user interface.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets the name of the source of the [UserDataTaskList](userdatatasklist.md), suitable for display in the user interface.
     * @remarks
     * This is usually the name of the app or service from which the contacts originate.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.sourcedisplayname
     * @type {HSTRING} 
     */
    SourceDisplayName {
        get => this.get_SourceDisplayName()
    }

    /**
     * Gets or sets a value indicating the read access level to this [UserDataTaskList](userdatatasklist.md) for other apps on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.otherappreadaccess
     * @type {Integer} 
     */
    OtherAppReadAccess {
        get => this.get_OtherAppReadAccess()
        set => this.put_OtherAppReadAccess(value)
    }

    /**
     * Gets or sets a value indicating the write access level to this [UserDataTaskList](userdatatasklist.md) for other apps on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.otherappwriteaccess
     * @type {Integer} 
     */
    OtherAppWriteAccess {
        get => this.get_OtherAppWriteAccess()
        set => this.put_OtherAppWriteAccess(value)
    }

    /**
     * Gets an object that provides operations that an app can perform on a task list that it has not created.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.limitedwriteoperations
     * @type {UserDataTaskListLimitedWriteOperations} 
     */
    LimitedWriteOperations {
        get => this.get_LimitedWriteOperations()
    }

    /**
     * Gets the [UserDataTaskListSyncManager](userdatatasklistsyncstatus.md) used to communicate with the server.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.syncmanager
     * @type {UserDataTaskListSyncManager} 
     */
    SyncManager {
        get => this.get_SyncManager()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UserDataAccountId() {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.get_UserDataAccountId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceDisplayName() {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.get_SourceDisplayName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppReadAccess() {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.get_OtherAppReadAccess()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppReadAccess(value) {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.put_OtherAppReadAccess(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppWriteAccess() {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.get_OtherAppWriteAccess()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppWriteAccess(value) {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.put_OtherAppWriteAccess(value)
    }

    /**
     * 
     * @returns {UserDataTaskListLimitedWriteOperations} 
     */
    get_LimitedWriteOperations() {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.get_LimitedWriteOperations()
    }

    /**
     * 
     * @returns {UserDataTaskListSyncManager} 
     */
    get_SyncManager() {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.get_SyncManager()
    }

    /**
     * Adds a [SyncManager](userdatatasklist_syncmanager.md) to the [UserDataTaskList](userdatatasklist.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.registersyncmanagerasync
     */
    RegisterSyncManagerAsync() {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.RegisterSyncManagerAsync()
    }

    /**
     * Gets a [UserDataTaskReader](userdatataskreader.md) object associated with this [UserDataTaskList](userdatatasklist.md) by using the specified [UserDataTaskQueryOptions](userdatataskqueryoptions.md).
     * @returns {UserDataTaskReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.gettaskreader
     */
    GetTaskReader() {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.GetTaskReader()
    }

    /**
     * Gets a [UserDataTaskReader](userdatataskreader.md) object associated with this [UserDataTaskList](userdatatasklist.md).
     * @param {UserDataTaskQueryOptions} options 
     * @returns {UserDataTaskReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.gettaskreader
     */
    GetTaskReaderWithOptions(options) {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.GetTaskReaderWithOptions(options)
    }

    /**
     * Asynchronously retrieves the specified [UserDataTask](userdatatask.md) object from the [UserDataTaskList](userdatatasklist.md).
     * @param {HSTRING} userDataTask_ The string that identifies the [UserDataTask](userdatatask.md) to return.
     * @returns {IAsyncOperation<UserDataTask>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.gettaskasync
     */
    GetTaskAsync(userDataTask_) {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.GetTaskAsync(userDataTask_)
    }

    /**
     * Asynchronously saves the specified [UserDataTask](userdatatask.md) to the [UserDataTaskStore](userdatataskstore.md).
     * @param {UserDataTask} userDataTask_ The task to save.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.savetaskasync
     */
    SaveTaskAsync(userDataTask_) {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.SaveTaskAsync(userDataTask_)
    }

    /**
     * Asynchronously deletes and individual [UserDataTask](userdatatask.md) from this [UserDataTaskList](userdatatasklist.md) and the [UserDataTaskStore](userdatataskstore.md).
     * @param {HSTRING} userDataTaskId The [UserDataTask](userdatatask.md) to delete.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.deletetaskasync
     */
    DeleteTaskAsync(userDataTaskId) {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.DeleteTaskAsync(userDataTaskId)
    }

    /**
     * Asynchronously deletes this [UserDataTaskList](userdatatasklist.md), including all [UserDataTask](userdatatask.md) objects in the [UserDataTaskStore](userdatataskstore.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.deleteasync
     */
    DeleteAsync() {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.DeleteAsync()
    }

    /**
     * Asynchronously saves this [UserDataTaskList](userdatatasklist.md).
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklist.saveasync
     */
    SaveAsync() {
        if (!this.HasProp("__IUserDataTaskList")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskList.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskList := IUserDataTaskList(outPtr)
        }

        return this.__IUserDataTaskList.SaveAsync()
    }

;@endregion Instance Methods
}
