#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\UserActivitySession.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserActivities.Core
 * @version WindowsRuntime 1.4
 */
class ICoreUserActivityManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreUserActivityManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{ca3adb02-a4be-4d4d-bfa8-6795f4264efb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateUserActivitySessionInBackground", "DeleteUserActivitySessionsInTimeRangeAsync"]

    /**
     * 
     * @param {UserActivity} activity 
     * @returns {UserActivitySession} 
     */
    CreateUserActivitySessionInBackground(activity) {
        result := ComCall(6, this, "ptr", activity, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserActivitySession(result_)
    }

    /**
     * 
     * @param {UserActivityChannel} channel 
     * @param {DateTime} startTime 
     * @param {DateTime} endTime 
     * @returns {IAsyncAction} 
     */
    DeleteUserActivitySessionsInTimeRangeAsync(channel, startTime, endTime) {
        result := ComCall(7, this, "ptr", channel, "ptr", startTime, "ptr", endTime, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
