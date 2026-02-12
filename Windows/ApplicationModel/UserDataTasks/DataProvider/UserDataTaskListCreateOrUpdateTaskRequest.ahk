#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskListCreateOrUpdateTaskRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to create or update a task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcreateorupdatetaskrequest
 * @namespace Windows.ApplicationModel.UserDataTasks.DataProvider
 * @version WindowsRuntime 1.4
 */
class UserDataTaskListCreateOrUpdateTaskRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskListCreateOrUpdateTaskRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskListCreateOrUpdateTaskRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the task list that contains the task that is to created or updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcreateorupdatetaskrequest.tasklistid
     * @type {HSTRING} 
     */
    TaskListId {
        get => this.get_TaskListId()
    }

    /**
     * Gets the [UserDataTask](../windows.applicationmodel.userdatatasks/userdatatask.md) of the task to be created or updated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcreateorupdatetaskrequest.task
     * @type {UserDataTask} 
     */
    Task {
        get => this.get_Task()
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
        if (!this.HasProp("__IUserDataTaskListCreateOrUpdateTaskRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListCreateOrUpdateTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListCreateOrUpdateTaskRequest := IUserDataTaskListCreateOrUpdateTaskRequest(outPtr)
        }

        return this.__IUserDataTaskListCreateOrUpdateTaskRequest.get_TaskListId()
    }

    /**
     * 
     * @returns {UserDataTask} 
     */
    get_Task() {
        if (!this.HasProp("__IUserDataTaskListCreateOrUpdateTaskRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListCreateOrUpdateTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListCreateOrUpdateTaskRequest := IUserDataTaskListCreateOrUpdateTaskRequest(outPtr)
        }

        return this.__IUserDataTaskListCreateOrUpdateTaskRequest.get_Task()
    }

    /**
     * Informs the client app that the request was processed successfully.
     * @param {UserDataTask} createdOrUpdatedUserDataTask The [UserDataTask](../windows.applicationmodel.userdatatasks/userdatatask.md) of the task that was created or updated.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcreateorupdatetaskrequest.reportcompletedasync
     */
    ReportCompletedAsync(createdOrUpdatedUserDataTask) {
        if (!this.HasProp("__IUserDataTaskListCreateOrUpdateTaskRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListCreateOrUpdateTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListCreateOrUpdateTaskRequest := IUserDataTaskListCreateOrUpdateTaskRequest(outPtr)
        }

        return this.__IUserDataTaskListCreateOrUpdateTaskRequest.ReportCompletedAsync(createdOrUpdatedUserDataTask)
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistcreateorupdatetaskrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IUserDataTaskListCreateOrUpdateTaskRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListCreateOrUpdateTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListCreateOrUpdateTaskRequest := IUserDataTaskListCreateOrUpdateTaskRequest(outPtr)
        }

        return this.__IUserDataTaskListCreateOrUpdateTaskRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
