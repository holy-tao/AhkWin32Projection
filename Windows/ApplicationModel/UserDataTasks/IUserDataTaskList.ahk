#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UserDataTaskListLimitedWriteOperations.ahk
#Include .\UserDataTaskListSyncManager.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\UserDataTaskReader.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\UserDataTask.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class IUserDataTaskList extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataTaskList
     * @type {Guid}
     */
    static IID => Guid("{49412e39-7c1d-4df1-bed3-314b7cbf5e4e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_UserDataAccountId", "get_DisplayName", "put_DisplayName", "get_SourceDisplayName", "get_OtherAppReadAccess", "put_OtherAppReadAccess", "get_OtherAppWriteAccess", "put_OtherAppWriteAccess", "get_LimitedWriteOperations", "get_SyncManager", "RegisterSyncManagerAsync", "GetTaskReader", "GetTaskReaderWithOptions", "GetTaskAsync", "SaveTaskAsync", "DeleteTaskAsync", "DeleteAsync", "SaveAsync"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    UserDataAccountId {
        get => this.get_UserDataAccountId()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * @type {HSTRING} 
     */
    SourceDisplayName {
        get => this.get_SourceDisplayName()
    }

    /**
     * @type {Integer} 
     */
    OtherAppReadAccess {
        get => this.get_OtherAppReadAccess()
        set => this.put_OtherAppReadAccess(value)
    }

    /**
     * @type {Integer} 
     */
    OtherAppWriteAccess {
        get => this.get_OtherAppWriteAccess()
        set => this.put_OtherAppWriteAccess(value)
    }

    /**
     * @type {UserDataTaskListLimitedWriteOperations} 
     */
    LimitedWriteOperations {
        get => this.get_LimitedWriteOperations()
    }

    /**
     * @type {UserDataTaskListSyncManager} 
     */
    SyncManager {
        get => this.get_SyncManager()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
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
    get_UserDataAccountId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SourceDisplayName() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppReadAccess() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppReadAccess(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OtherAppWriteAccess() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OtherAppWriteAccess(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {UserDataTaskListLimitedWriteOperations} 
     */
    get_LimitedWriteOperations() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserDataTaskListLimitedWriteOperations(value)
    }

    /**
     * 
     * @returns {UserDataTaskListSyncManager} 
     */
    get_SyncManager() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserDataTaskListSyncManager(value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    RegisterSyncManagerAsync() {
        result := ComCall(17, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(result_)
    }

    /**
     * 
     * @returns {UserDataTaskReader} 
     */
    GetTaskReader() {
        result := ComCall(18, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserDataTaskReader(result_)
    }

    /**
     * 
     * @param {UserDataTaskQueryOptions} options 
     * @returns {UserDataTaskReader} 
     */
    GetTaskReaderWithOptions(options) {
        result := ComCall(19, this, "ptr", options, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserDataTaskReader(value)
    }

    /**
     * 
     * @param {HSTRING} userDataTask_ 
     * @returns {IAsyncOperation<UserDataTask>} 
     */
    GetTaskAsync(userDataTask_) {
        if(userDataTask_ is String) {
            pin := HSTRING.Create(userDataTask_)
            userDataTask_ := pin.Value
        }
        userDataTask_ := userDataTask_ is Win32Handle ? NumGet(userDataTask_, "ptr") : userDataTask_

        result := ComCall(20, this, "ptr", userDataTask_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UserDataTask, operation)
    }

    /**
     * 
     * @param {UserDataTask} userDataTask_ 
     * @returns {IAsyncAction} 
     */
    SaveTaskAsync(userDataTask_) {
        result := ComCall(21, this, "ptr", userDataTask_, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @param {HSTRING} userDataTaskId 
     * @returns {IAsyncAction} 
     */
    DeleteTaskAsync(userDataTaskId) {
        if(userDataTaskId is String) {
            pin := HSTRING.Create(userDataTaskId)
            userDataTaskId := pin.Value
        }
        userDataTaskId := userDataTaskId is Win32Handle ? NumGet(userDataTaskId, "ptr") : userDataTaskId

        result := ComCall(22, this, "ptr", userDataTaskId, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(action)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    DeleteAsync() {
        result := ComCall(23, this, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SaveAsync() {
        result := ComCall(24, this, "ptr*", &asyncAction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(asyncAction)
    }
}
