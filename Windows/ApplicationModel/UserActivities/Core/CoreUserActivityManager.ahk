#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreUserActivityManagerStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Manages the creation and deletion of user activities.
 * @remarks
 * A [UserActivity](../windows.applicationmodel.useractivities/useractivity.md) encapsulates a user's task that can be continued at a later time, and potentially on a different device. For example, a mail app could create a UserActivity when the user starts creating a new email message. The user could pause working on the email and then work on it later on the same machine, or even another device.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.core.coreuseractivitymanager
 * @namespace Windows.ApplicationModel.UserActivities.Core
 * @version WindowsRuntime 1.4
 */
class CoreUserActivityManager extends IInspectable {
;@region Static Methods
    /**
     * Creates a user activity session.
     * @remarks
     * The *background* in this API name refers to the fact that the session is not associated with a window.
     * 
     * A session allows you to group user activities together so that you can do things such as delete all user activities created during a given timeframe.
     * @param {UserActivity} activity 
     * @returns {UserActivitySession} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.core.coreuseractivitymanager.createuseractivitysessioninbackground
     */
    static CreateUserActivitySessionInBackground(activity) {
        if (!CoreUserActivityManager.HasProp("__ICoreUserActivityManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserActivities.Core.CoreUserActivityManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreUserActivityManagerStatics.IID)
            CoreUserActivityManager.__ICoreUserActivityManagerStatics := ICoreUserActivityManagerStatics(factoryPtr)
        }

        return CoreUserActivityManager.__ICoreUserActivityManagerStatics.CreateUserActivitySessionInBackground(activity)
    }

    /**
     * Delete user activities created during a specified timeframe.
     * @param {UserActivityChannel} channel The channel that was used to create the user activities.
     * @param {DateTime} startTime The beginning of the time range in which to delete user activities.
     * @param {DateTime} endTime The end of the time range in which to delete user activities.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.core.coreuseractivitymanager.deleteuseractivitysessionsintimerangeasync
     */
    static DeleteUserActivitySessionsInTimeRangeAsync(channel, startTime, endTime) {
        if (!CoreUserActivityManager.HasProp("__ICoreUserActivityManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserActivities.Core.CoreUserActivityManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreUserActivityManagerStatics.IID)
            CoreUserActivityManager.__ICoreUserActivityManagerStatics := ICoreUserActivityManagerStatics(factoryPtr)
        }

        return CoreUserActivityManager.__ICoreUserActivityManagerStatics.DeleteUserActivitySessionsInTimeRangeAsync(channel, startTime, endTime)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
