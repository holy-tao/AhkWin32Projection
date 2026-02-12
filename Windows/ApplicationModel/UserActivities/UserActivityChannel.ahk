#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserActivityChannel.ahk
#Include .\IUserActivityChannel2.ahk
#Include .\IUserActivityChannelStatics3.ahk
#Include .\IUserActivityChannelStatics.ahk
#Include .\IUserActivityChannelStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Creates or gets [UserActivity](useractivity.md) objects created on this or another device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitychannel
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class UserActivityChannel extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserActivityChannel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserActivityChannel.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a UserActivityChannel object that can be used to get or create UserActivity objects for the specified user in the context of the current app.
     * @param {User} user_ The User that you want to get or create UserActivity objects for.
     * @returns {UserActivityChannel} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitychannel.getforuser
     */
    static GetForUser(user_) {
        if (!UserActivityChannel.HasProp("__IUserActivityChannelStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserActivities.UserActivityChannel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserActivityChannelStatics3.IID)
            UserActivityChannel.__IUserActivityChannelStatics3 := IUserActivityChannelStatics3(factoryPtr)
        }

        return UserActivityChannel.__IUserActivityChannelStatics3.GetForUser(user_)
    }

    /**
     * Provides access to the User Activities associated with the user's Managed Service Account (MSA).
     * @returns {UserActivityChannel} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitychannel.getdefault
     */
    static GetDefault() {
        if (!UserActivityChannel.HasProp("__IUserActivityChannelStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserActivities.UserActivityChannel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserActivityChannelStatics.IID)
            UserActivityChannel.__IUserActivityChannelStatics := IUserActivityChannelStatics(factoryPtr)
        }

        return UserActivityChannel.__IUserActivityChannelStatics.GetDefault()
    }

    /**
     * Disable the automatic creation of a session when a new UserActivity is created.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitychannel.disableautosessioncreation
     */
    static DisableAutoSessionCreation() {
        if (!UserActivityChannel.HasProp("__IUserActivityChannelStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserActivities.UserActivityChannel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserActivityChannelStatics2.IID)
            UserActivityChannel.__IUserActivityChannelStatics2 := IUserActivityChannelStatics2(factoryPtr)
        }

        return UserActivityChannel.__IUserActivityChannelStatics2.DisableAutoSessionCreation()
    }

    /**
     * Get a channel, specific to a specified web account, to use to record user activity.
     * @remarks
     * Some apps, such as Mail, support multiple user accounts within a single instance of the app. If the user has a Microsoft Account (MSA) and an Azure Active Directory account (AAD), the app can choose to write to the activity feed associated with the MSA account or the AAD account.
     * @param {WebAccount} account The web account to associate user activity with.
     * @returns {UserActivityChannel} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitychannel.trygetforwebaccount
     */
    static TryGetForWebAccount(account) {
        if (!UserActivityChannel.HasProp("__IUserActivityChannelStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserActivities.UserActivityChannel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserActivityChannelStatics2.IID)
            UserActivityChannel.__IUserActivityChannelStatics2 := IUserActivityChannelStatics2(factoryPtr)
        }

        return UserActivityChannel.__IUserActivityChannelStatics2.TryGetForWebAccount(account)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Create (or get) a [UserActivity](useractivity.md) with the specified id.
     * @param {HSTRING} activityId The identifier for the **UserActivity**.
     * @returns {IAsyncOperation<UserActivity>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitychannel.getorcreateuseractivityasync
     */
    GetOrCreateUserActivityAsync(activityId) {
        if (!this.HasProp("__IUserActivityChannel")) {
            if ((queryResult := this.QueryInterface(IUserActivityChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityChannel := IUserActivityChannel(outPtr)
        }

        return this.__IUserActivityChannel.GetOrCreateUserActivityAsync(activityId)
    }

    /**
     * Delete a specific user activity.
     * @remarks
     * You can get the identifier of the user activity from [UserActivity.ActivityId](useractivity_activityid.md).
     * @param {HSTRING} activityId The identifier of the user activity to delete.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitychannel.deleteactivityasync
     */
    DeleteActivityAsync(activityId) {
        if (!this.HasProp("__IUserActivityChannel")) {
            if ((queryResult := this.QueryInterface(IUserActivityChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityChannel := IUserActivityChannel(outPtr)
        }

        return this.__IUserActivityChannel.DeleteActivityAsync(activityId)
    }

    /**
     * Deletes all of the user activities registered by this app.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitychannel.deleteallactivitiesasync
     */
    DeleteAllActivitiesAsync() {
        if (!this.HasProp("__IUserActivityChannel")) {
            if ((queryResult := this.QueryInterface(IUserActivityChannel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityChannel := IUserActivityChannel(outPtr)
        }

        return this.__IUserActivityChannel.DeleteAllActivitiesAsync()
    }

    /**
     * Get up to the specified number of the most recently engaged user activities, sorted by the time each user activity ended.
     * @remarks
     * User activities with a `null` end time appear first in the list.
     * @param {Integer} maxUniqueActivities The maximum number of user activities to get. Fewer may be returned if there aren't as many user activities as requested.
     * @returns {IAsyncOperation<IVector<UserActivitySessionHistoryItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitychannel.getrecentuseractivitiesasync
     */
    GetRecentUserActivitiesAsync(maxUniqueActivities) {
        if (!this.HasProp("__IUserActivityChannel2")) {
            if ((queryResult := this.QueryInterface(IUserActivityChannel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityChannel2 := IUserActivityChannel2(outPtr)
        }

        return this.__IUserActivityChannel2.GetRecentUserActivitiesAsync(maxUniqueActivities)
    }

    /**
     * Gets the session history for a user activity.
     * @param {HSTRING} activityId Identifies the user activity to get session history for.
     * @param {DateTime} startTime Get user activity sessions that were active between **startTime** and now.
     * @returns {IAsyncOperation<IVector<UserActivitySessionHistoryItem>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivitychannel.getsessionhistoryitemsforuseractivityasync
     */
    GetSessionHistoryItemsForUserActivityAsync(activityId, startTime) {
        if (!this.HasProp("__IUserActivityChannel2")) {
            if ((queryResult := this.QueryInterface(IUserActivityChannel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityChannel2 := IUserActivityChannel2(outPtr)
        }

        return this.__IUserActivityChannel2.GetSessionHistoryItemsForUserActivityAsync(activityId, startTime)
    }

;@endregion Instance Methods
}
