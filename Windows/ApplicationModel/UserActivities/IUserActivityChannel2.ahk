#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\UserActivitySessionHistoryItem.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class IUserActivityChannel2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserActivityChannel2
     * @type {Guid}
     */
    static IID => Guid("{1698e35b-eb7e-4ea0-bf17-a459e8be706c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRecentUserActivitiesAsync", "GetSessionHistoryItemsForUserActivityAsync"]

    /**
     * 
     * @param {Integer} maxUniqueActivities 
     * @returns {IAsyncOperation<IVector<UserActivitySessionHistoryItem>>} 
     */
    GetRecentUserActivitiesAsync(maxUniqueActivities) {
        result := ComCall(6, this, "int", maxUniqueActivities, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, UserActivitySessionHistoryItem), operation)
    }

    /**
     * 
     * @param {HSTRING} activityId 
     * @param {DateTime} startTime 
     * @returns {IAsyncOperation<IVector<UserActivitySessionHistoryItem>>} 
     */
    GetSessionHistoryItemsForUserActivityAsync(activityId, startTime) {
        if(activityId is String) {
            pin := HSTRING.Create(activityId)
            activityId := pin.Value
        }
        activityId := activityId is Win32Handle ? NumGet(activityId, "ptr") : activityId

        result := ComCall(7, this, "ptr", activityId, "ptr", startTime, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVector.Call.Bind(IVector, UserActivitySessionHistoryItem), operation)
    }
}
