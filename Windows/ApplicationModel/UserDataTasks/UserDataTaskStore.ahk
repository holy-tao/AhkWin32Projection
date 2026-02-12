#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskStore.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a database that contains tasks.
 * @remarks
 * To get a UserDataTaskStore object, call the static utility method [UserDataTaskManager.RequestStoreAsync](userdatataskmanager_requeststoreasync_1330322877.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskstore
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskStore.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously creates a [UserDataTaskList](userdatatasklist.md) with the specified name.
     * @param {HSTRING} name A name for the new [UserDataTaskList](userdatatasklist.md).
     * @returns {IAsyncOperation<UserDataTaskList>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskstore.createlistasync
     */
    CreateListAsync(name) {
        if (!this.HasProp("__IUserDataTaskStore")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskStore := IUserDataTaskStore(outPtr)
        }

        return this.__IUserDataTaskStore.CreateListAsync(name)
    }

    /**
     * Asynchronously creates a [UserDataTaskList](userdatatasklist.md) with the specified name.
     * @param {HSTRING} name A name for the new [UserDataTaskList](userdatatasklist.md).
     * @param {HSTRING} userDataAccountId 
     * @returns {IAsyncOperation<UserDataTaskList>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskstore.createlistasync
     */
    CreateListInAccountAsync(name, userDataAccountId) {
        if (!this.HasProp("__IUserDataTaskStore")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskStore := IUserDataTaskStore(outPtr)
        }

        return this.__IUserDataTaskStore.CreateListInAccountAsync(name, userDataAccountId)
    }

    /**
     * Asynchronously returns the list of [UserDataTaskList](userdatatasklist.md) objects.
     * @returns {IAsyncOperation<IVectorView<UserDataTaskList>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskstore.findlistsasync
     */
    FindListsAsync() {
        if (!this.HasProp("__IUserDataTaskStore")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskStore := IUserDataTaskStore(outPtr)
        }

        return this.__IUserDataTaskStore.FindListsAsync()
    }

    /**
     * Asynchronously gets the [UserDataTaskList](userdatatasklist.md) with the specified ID.
     * @param {HSTRING} taskListId The ID of the [UserDataTaskList](userdatatasklist.md) to retrieve.
     * @returns {IAsyncOperation<UserDataTaskList>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatataskstore.getlistasync
     */
    GetListAsync(taskListId) {
        if (!this.HasProp("__IUserDataTaskStore")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskStore := IUserDataTaskStore(outPtr)
        }

        return this.__IUserDataTaskStore.GetListAsync(taskListId)
    }

;@endregion Instance Methods
}
