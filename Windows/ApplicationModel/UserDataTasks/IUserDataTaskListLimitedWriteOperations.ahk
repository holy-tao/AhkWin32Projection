#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class IUserDataTaskListLimitedWriteOperations extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataTaskListLimitedWriteOperations
     * @type {Guid}
     */
    static IID => Guid("{7aa267f2-6078-4183-919e-4f29f19cfae9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryCompleteTaskAsync", "TryCreateOrUpdateTaskAsync", "TryDeleteTaskAsync", "TrySkipOccurrenceAsync"]

    /**
     * 
     * @param {HSTRING} userDataTaskId 
     * @returns {IAsyncOperation<HSTRING>} 
     */
    TryCompleteTaskAsync(userDataTaskId) {
        if(userDataTaskId is String) {
            pin := HSTRING.Create(userDataTaskId)
            userDataTaskId := pin.Value
        }
        userDataTaskId := userDataTaskId is Win32Handle ? NumGet(userDataTaskId, "ptr") : userDataTaskId

        result := ComCall(6, this, "ptr", userDataTaskId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => HSTRING({ Value: ptr }), operation)
    }

    /**
     * 
     * @param {UserDataTask} userDataTask_ 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryCreateOrUpdateTaskAsync(userDataTask_) {
        result := ComCall(7, this, "ptr", userDataTask_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} userDataTaskId 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TryDeleteTaskAsync(userDataTaskId) {
        if(userDataTaskId is String) {
            pin := HSTRING.Create(userDataTaskId)
            userDataTaskId := pin.Value
        }
        userDataTaskId := userDataTaskId is Win32Handle ? NumGet(userDataTaskId, "ptr") : userDataTaskId

        result := ComCall(8, this, "ptr", userDataTaskId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @param {HSTRING} userDataTaskId 
     * @returns {IAsyncOperation<Boolean>} 
     */
    TrySkipOccurrenceAsync(userDataTaskId) {
        if(userDataTaskId is String) {
            pin := HSTRING.Create(userDataTaskId)
            userDataTaskId := pin.Value
        }
        userDataTaskId := userDataTaskId is Win32Handle ? NumGet(userDataTaskId, "ptr") : userDataTaskId

        result := ComCall(9, this, "ptr", userDataTaskId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
