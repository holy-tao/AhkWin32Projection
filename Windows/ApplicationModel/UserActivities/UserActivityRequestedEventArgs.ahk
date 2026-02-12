#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserActivityRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Passed to the [UserActivityRequestManager.UserActivityRequested](useractivityrequestmanager_useractivityrequested.md) event. Allows the handler of the event to pass back a [UserActivity](useractivity.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityrequestedeventargs
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class UserActivityRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserActivityRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserActivityRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [UserActivityRequest](useractivityrequest.md) associated with a call to the [UserActivityRequestManager.UserActivityRequested](useractivityrequestmanager_useractivityrequested.md) event handler.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityrequestedeventargs.request
     * @type {UserActivityRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {UserActivityRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IUserActivityRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserActivityRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityRequestedEventArgs := IUserActivityRequestedEventArgs(outPtr)
        }

        return this.__IUserActivityRequestedEventArgs.get_Request()
    }

    /**
     * Gets a deferral object so that you can have more time to handle the [UserActivityRequestManager.UserActivityRequested](useractivityrequestmanager_useractivityrequested.md) event.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IUserActivityRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IUserActivityRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityRequestedEventArgs := IUserActivityRequestedEventArgs(outPtr)
        }

        return this.__IUserActivityRequestedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
