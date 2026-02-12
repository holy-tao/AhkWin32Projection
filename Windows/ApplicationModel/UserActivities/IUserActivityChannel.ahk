#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\UserActivity.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class IUserActivityChannel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserActivityChannel
     * @type {Guid}
     */
    static IID => Guid("{bac0f8b8-a0e4-483b-b948-9cbabd06070c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOrCreateUserActivityAsync", "DeleteActivityAsync", "DeleteAllActivitiesAsync"]

    /**
     * 
     * @param {HSTRING} activityId 
     * @returns {IAsyncOperation<UserActivity>} 
     */
    GetOrCreateUserActivityAsync(activityId) {
        if(activityId is String) {
            pin := HSTRING.Create(activityId)
            activityId := pin.Value
        }
        activityId := activityId is Win32Handle ? NumGet(activityId, "ptr") : activityId

        result := ComCall(6, this, "ptr", activityId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UserActivity, operation)
    }

    /**
     * 
     * @param {HSTRING} activityId 
     * @returns {IAsyncAction} 
     */
    DeleteActivityAsync(activityId) {
        if(activityId is String) {
            pin := HSTRING.Create(activityId)
            activityId := pin.Value
        }
        activityId := activityId is Win32Handle ? NumGet(activityId, "ptr") : activityId

        result := ComCall(7, this, "ptr", activityId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    DeleteAllActivitiesAsync() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
