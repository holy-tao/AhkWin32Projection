#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserActivityRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Passed as an argument to the [UserActivityRequestManager.UserActivityRequested](useractivityrequestmanager_useractivityrequested.md) event. Used to return a [UserActivity](useractivity.md) to the caller.
 * @remarks
 * If the system is taking action that it wants to associate with a new user activity within an app, the system raises the [UserActivityRequestManager.UserActivityRequested](useractivityrequestmanager_useractivityrequested.md) event, and the app returns a **UserActivity** via the event args.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityrequest
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class UserActivityRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserActivityRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserActivityRequest.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Sets the [UserActivity](useractivity.md) to return when the [UserActivityRequested](useractivityrequestmanager_useractivityrequested.md) event is raised.
     * @remarks
     * [UserActivity.ActivationUri](/uwp/api/windows.applicationmodel.useractivities.useractivity.ActivationUri) and **[UserActivity.VisualElements.DisplayText](/uwp/api/windows.applicationmodel.useractivities.useractivityvisualelements.DisplayText)** must be set or this method will fail.
     * @param {UserActivity} activity The user activity to store.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityrequest.setuseractivity
     */
    SetUserActivity(activity) {
        if (!this.HasProp("__IUserActivityRequest")) {
            if ((queryResult := this.QueryInterface(IUserActivityRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityRequest := IUserActivityRequest(outPtr)
        }

        return this.__IUserActivityRequest.SetUserActivity(activity)
    }

;@endregion Instance Methods
}
