#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskListSkipOccurrenceRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request to skip the current instance of a reoccurring task and move to the next instance.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistskipoccurrencerequest
 * @namespace Windows.ApplicationModel.UserDataTasks.DataProvider
 * @version WindowsRuntime 1.4
 */
class UserDataTaskListSkipOccurrenceRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskListSkipOccurrenceRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskListSkipOccurrenceRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the task list that contains the task to be skipped.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistskipoccurrencerequest.tasklistid
     * @type {HSTRING} 
     */
    TaskListId {
        get => this.get_TaskListId()
    }

    /**
     * Gets the task ID of the task to be skipped.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistskipoccurrencerequest.taskid
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
        if (!this.HasProp("__IUserDataTaskListSkipOccurrenceRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSkipOccurrenceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSkipOccurrenceRequest := IUserDataTaskListSkipOccurrenceRequest(outPtr)
        }

        return this.__IUserDataTaskListSkipOccurrenceRequest.get_TaskListId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TaskId() {
        if (!this.HasProp("__IUserDataTaskListSkipOccurrenceRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSkipOccurrenceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSkipOccurrenceRequest := IUserDataTaskListSkipOccurrenceRequest(outPtr)
        }

        return this.__IUserDataTaskListSkipOccurrenceRequest.get_TaskId()
    }

    /**
     * Informs the client app that the request was processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistskipoccurrencerequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IUserDataTaskListSkipOccurrenceRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSkipOccurrenceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSkipOccurrenceRequest := IUserDataTaskListSkipOccurrenceRequest(outPtr)
        }

        return this.__IUserDataTaskListSkipOccurrenceRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistskipoccurrencerequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IUserDataTaskListSkipOccurrenceRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSkipOccurrenceRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSkipOccurrenceRequest := IUserDataTaskListSkipOccurrenceRequest(outPtr)
        }

        return this.__IUserDataTaskListSkipOccurrenceRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
