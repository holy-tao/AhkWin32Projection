#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\UserDataTaskList.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class IUserDataTaskStore extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataTaskStore
     * @type {Guid}
     */
    static IID => Guid("{f06a9cb0-f1db-45ba-8a62-086004c0213d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateListAsync", "CreateListInAccountAsync", "FindListsAsync", "GetListAsync"]

    /**
     * 
     * @param {HSTRING} name 
     * @returns {IAsyncOperation<UserDataTaskList>} 
     */
    CreateListAsync(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UserDataTaskList, operation)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {HSTRING} userDataAccountId 
     * @returns {IAsyncOperation<UserDataTaskList>} 
     */
    CreateListInAccountAsync(name, userDataAccountId) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(userDataAccountId is String) {
            pin := HSTRING.Create(userDataAccountId)
            userDataAccountId := pin.Value
        }
        userDataAccountId := userDataAccountId is Win32Handle ? NumGet(userDataAccountId, "ptr") : userDataAccountId

        result := ComCall(7, this, "ptr", name, "ptr", userDataAccountId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UserDataTaskList, result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<UserDataTaskList>>} 
     */
    FindListsAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, UserDataTaskList), operation)
    }

    /**
     * 
     * @param {HSTRING} taskListId 
     * @returns {IAsyncOperation<UserDataTaskList>} 
     */
    GetListAsync(taskListId) {
        if(taskListId is String) {
            pin := HSTRING.Create(taskListId)
            taskListId := pin.Value
        }
        taskListId := taskListId is Win32Handle ? NumGet(taskListId, "ptr") : taskListId

        result := ComCall(9, this, "ptr", taskListId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UserDataTaskList, operation)
    }
}
