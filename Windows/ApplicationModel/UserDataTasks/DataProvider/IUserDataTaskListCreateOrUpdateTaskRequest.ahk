#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\UserDataTask.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataTasks.DataProvider
 * @version WindowsRuntime 1.4
 */
class IUserDataTaskListCreateOrUpdateTaskRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataTaskListCreateOrUpdateTaskRequest
     * @type {Guid}
     */
    static IID => Guid("{2133772c-55c2-4300-8279-04326e07cce4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TaskListId", "get_Task", "ReportCompletedAsync", "ReportFailedAsync"]

    /**
     * @type {HSTRING} 
     */
    TaskListId {
        get => this.get_TaskListId()
    }

    /**
     * @type {UserDataTask} 
     */
    Task {
        get => this.get_Task()
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
     * @returns {UserDataTask} 
     */
    get_Task() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserDataTask(value)
    }

    /**
     * 
     * @param {UserDataTask} createdOrUpdatedUserDataTask 
     * @returns {IAsyncAction} 
     */
    ReportCompletedAsync(createdOrUpdatedUserDataTask) {
        result := ComCall(8, this, "ptr", createdOrUpdatedUserDataTask, "ptr*", &result_ := 0, "int")
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
