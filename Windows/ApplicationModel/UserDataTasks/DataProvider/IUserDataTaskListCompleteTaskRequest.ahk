#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataTasks.DataProvider
 * @version WindowsRuntime 1.4
 */
class IUserDataTaskListCompleteTaskRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataTaskListCompleteTaskRequest
     * @type {Guid}
     */
    static IID => Guid("{f65e14a3-1a42-49da-8552-2873e52c55eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TaskListId", "get_TaskId", "ReportCompletedAsync", "ReportFailedAsync"]

    /**
     * @type {HSTRING} 
     */
    TaskListId {
        get => this.get_TaskListId()
    }

    /**
     * @type {HSTRING} 
     */
    TaskId {
        get => this.get_TaskId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TaskListId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TaskId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} completedTaskId 
     * @returns {IAsyncAction} 
     */
    ReportCompletedAsync(completedTaskId) {
        if(completedTaskId is String) {
            pin := HSTRING.Create(completedTaskId)
            completedTaskId := pin.Value
        }
        completedTaskId := completedTaskId is Win32Handle ? NumGet(completedTaskId, "ptr") : completedTaskId

        result := ComCall(8, this, "ptr", completedTaskId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    ReportFailedAsync() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }
}
