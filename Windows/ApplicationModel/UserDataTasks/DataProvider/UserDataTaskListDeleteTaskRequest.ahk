#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskListDeleteTaskRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to delete a task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistdeletetaskrequest
 * @namespace Windows.ApplicationModel.UserDataTasks.DataProvider
 * @version WindowsRuntime 1.4
 */
class UserDataTaskListDeleteTaskRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskListDeleteTaskRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskListDeleteTaskRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the task list that contains the task that is to be deleted.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistdeletetaskrequest.tasklistid
     * @type {HSTRING} 
     */
    TaskListId {
        get => this.get_TaskListId()
    }

    /**
     * Gets the task ID of the task to be deleted.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistdeletetaskrequest.taskid
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
        if (!this.HasProp("__IUserDataTaskListDeleteTaskRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListDeleteTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListDeleteTaskRequest := IUserDataTaskListDeleteTaskRequest(outPtr)
        }

        return this.__IUserDataTaskListDeleteTaskRequest.get_TaskListId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TaskId() {
        if (!this.HasProp("__IUserDataTaskListDeleteTaskRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListDeleteTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListDeleteTaskRequest := IUserDataTaskListDeleteTaskRequest(outPtr)
        }

        return this.__IUserDataTaskListDeleteTaskRequest.get_TaskId()
    }

    /**
     * Informs the client app that the request was processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistdeletetaskrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IUserDataTaskListDeleteTaskRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListDeleteTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListDeleteTaskRequest := IUserDataTaskListDeleteTaskRequest(outPtr)
        }

        return this.__IUserDataTaskListDeleteTaskRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistdeletetaskrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IUserDataTaskListDeleteTaskRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListDeleteTaskRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListDeleteTaskRequest := IUserDataTaskListDeleteTaskRequest(outPtr)
        }

        return this.__IUserDataTaskListDeleteTaskRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
