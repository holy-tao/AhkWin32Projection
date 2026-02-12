#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskListCompleteTaskRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to mark at task as completed.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcompletetaskrequest
 * @namespace Windows.ApplicationModel.UserDataTasks.DataProvider
 * @version WindowsRuntime 1.4
 */
class UserDataTaskListCompleteTaskRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskListCompleteTaskRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskListCompleteTaskRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the task list that contains the task that is to be marked as completed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcompletetaskrequest.tasklistid
     * @type {HSTRING} 
     */
    TaskListId {
        get => this.get_TaskListId()
    }

    /**
     * Gets the task ID of the task to be marked as completed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcompletetaskrequest.taskid
     * @type {HSTRING} 
     */
    TaskId {
        get => this.get_TaskId()
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
    get_TaskListId() {
        if (!this.HasProp("__IUserDataTaskListCompleteTaskRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListCompleteTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListCompleteTaskRequest := IUserDataTaskListCompleteTaskRequest(outPtr)
        }

        return this.__IUserDataTaskListCompleteTaskRequest.get_TaskListId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TaskId() {
        if (!this.HasProp("__IUserDataTaskListCompleteTaskRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListCompleteTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListCompleteTaskRequest := IUserDataTaskListCompleteTaskRequest(outPtr)
        }

        return this.__IUserDataTaskListCompleteTaskRequest.get_TaskId()
    }

    /**
     * Informs the client app that the request was processed successfully.
     * @param {HSTRING} completedTaskId The ID of the task that was processed.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcompletetaskrequest.reportcompletedasync
     */
    ReportCompletedAsync(completedTaskId) {
        if (!this.HasProp("__IUserDataTaskListCompleteTaskRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListCompleteTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListCompleteTaskRequest := IUserDataTaskListCompleteTaskRequest(outPtr)
        }

        return this.__IUserDataTaskListCompleteTaskRequest.ReportCompletedAsync(completedTaskId)
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcompletetaskrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IUserDataTaskListCompleteTaskRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListCompleteTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListCompleteTaskRequest := IUserDataTaskListCompleteTaskRequest(outPtr)
        }

        return this.__IUserDataTaskListCompleteTaskRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
