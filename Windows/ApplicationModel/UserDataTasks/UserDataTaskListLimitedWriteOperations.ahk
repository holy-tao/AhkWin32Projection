#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskListLimitedWriteOperations.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides operations that an app can perform on a task list that it has not created.
 * @remarks
 * Get an instance of this class by using the [LimitedWriteOperations](userdatatasklist_limitedwriteoperations.md) property of a [UserDataTaskList](userdatatasklist.md).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklistlimitedwriteoperations
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class UserDataTaskListLimitedWriteOperations extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskListLimitedWriteOperations

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskListLimitedWriteOperations.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Asynchronously attempts to mark a task as completed.
     * @param {HSTRING} userDataTaskId The ID of the task to mark as completed.
     * @returns {IAsyncOperation<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklistlimitedwriteoperations.trycompletetaskasync
     */
    TryCompleteTaskAsync(userDataTaskId) {
        if (!this.HasProp("__IUserDataTaskListLimitedWriteOperations")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListLimitedWriteOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListLimitedWriteOperations := IUserDataTaskListLimitedWriteOperations(outPtr)
        }

        return this.__IUserDataTaskListLimitedWriteOperations.TryCompleteTaskAsync(userDataTaskId)
    }

    /**
     * Asynchronously attempts to create or update a task.
     * @param {UserDataTask} userDataTask_ The task to create or update.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklistlimitedwriteoperations.trycreateorupdatetaskasync
     */
    TryCreateOrUpdateTaskAsync(userDataTask_) {
        if (!this.HasProp("__IUserDataTaskListLimitedWriteOperations")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListLimitedWriteOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListLimitedWriteOperations := IUserDataTaskListLimitedWriteOperations(outPtr)
        }

        return this.__IUserDataTaskListLimitedWriteOperations.TryCreateOrUpdateTaskAsync(userDataTask_)
    }

    /**
     * Asynchronously attempts to delete a task.
     * @param {HSTRING} userDataTaskId The ID of the task to delete.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklistlimitedwriteoperations.trydeletetaskasync
     */
    TryDeleteTaskAsync(userDataTaskId) {
        if (!this.HasProp("__IUserDataTaskListLimitedWriteOperations")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListLimitedWriteOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListLimitedWriteOperations := IUserDataTaskListLimitedWriteOperations(outPtr)
        }

        return this.__IUserDataTaskListLimitedWriteOperations.TryDeleteTaskAsync(userDataTaskId)
    }

    /**
     * Asynchronously attempts to skip the current instance of a reoccurring task and move to the next instance.
     * @param {HSTRING} userDataTaskId The ID of the reoccurring task.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.userdatatasklistlimitedwriteoperations.tryskipoccurrenceasync
     */
    TrySkipOccurrenceAsync(userDataTaskId) {
        if (!this.HasProp("__IUserDataTaskListLimitedWriteOperations")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListLimitedWriteOperations.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListLimitedWriteOperations := IUserDataTaskListLimitedWriteOperations(outPtr)
        }

        return this.__IUserDataTaskListLimitedWriteOperations.TrySkipOccurrenceAsync(userDataTaskId)
    }

;@endregion Instance Methods
}
