#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserDataTaskListSyncManagerSyncRequest.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Details of a request from a client to sync a task list.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistsyncmanagersyncrequest
 * @namespace Windows.ApplicationModel.UserDataTasks.DataProvider
 * @version WindowsRuntime 1.4
 */
class UserDataTaskListSyncManagerSyncRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserDataTaskListSyncManagerSyncRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserDataTaskListSyncManagerSyncRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the task list to be synced.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistsyncmanagersyncrequest.tasklistid
     * @type {HSTRING} 
     */
    TaskListId {
        get => this.get_TaskListId()
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
        if (!this.HasProp("__IUserDataTaskListSyncManagerSyncRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSyncManagerSyncRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSyncManagerSyncRequest := IUserDataTaskListSyncManagerSyncRequest(outPtr)
        }

        return this.__IUserDataTaskListSyncManagerSyncRequest.get_TaskListId()
    }

    /**
     * Informs the client app that the request was processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistsyncmanagersyncrequest.reportcompletedasync
     */
    ReportCompletedAsync() {
        if (!this.HasProp("__IUserDataTaskListSyncManagerSyncRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSyncManagerSyncRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSyncManagerSyncRequest := IUserDataTaskListSyncManagerSyncRequest(outPtr)
        }

        return this.__IUserDataTaskListSyncManagerSyncRequest.ReportCompletedAsync()
    }

    /**
     * Informs the client that the request was not processed successfully.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.userdatatasks.dataprovider.userdatatasklistsyncmanagersyncrequest.reportfailedasync
     */
    ReportFailedAsync() {
        if (!this.HasProp("__IUserDataTaskListSyncManagerSyncRequest")) {
            if ((queryResult := this.QueryInterface(IUserDataTaskListSyncManagerSyncRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserDataTaskListSyncManagerSyncRequest := IUserDataTaskListSyncManagerSyncRequest(outPtr)
        }

        return this.__IUserDataTaskListSyncManagerSyncRequest.ReportFailedAsync()
    }

;@endregion Instance Methods
}
