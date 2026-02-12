#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserActivityRequestManager.ahk
#Include .\IUserActivityRequestManagerStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\UserActivityRequestManager.ahk
#Include .\UserActivityRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Handle external requests to create a [UserActivity](useractivity.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityrequestmanager
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class UserActivityRequestManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserActivityRequestManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserActivityRequestManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the [UserActivityRequestManager](useractivityrequestmanager.md) associated with the current view.
     * @returns {UserActivityRequestManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.useractivities.useractivityrequestmanager.getforcurrentview
     */
    static GetForCurrentView() {
        if (!UserActivityRequestManager.HasProp("__IUserActivityRequestManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.UserActivities.UserActivityRequestManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserActivityRequestManagerStatics.IID)
            UserActivityRequestManager.__IUserActivityRequestManagerStatics := IUserActivityRequestManagerStatics(factoryPtr)
        }

        return UserActivityRequestManager.__IUserActivityRequestManagerStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnUserActivityRequestedToken")) {
            this.remove_UserActivityRequested(this.__OnUserActivityRequestedToken)
            this.__OnUserActivityRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<UserActivityRequestManager, UserActivityRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UserActivityRequested(handler) {
        if (!this.HasProp("__IUserActivityRequestManager")) {
            if ((queryResult := this.QueryInterface(IUserActivityRequestManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityRequestManager := IUserActivityRequestManager(outPtr)
        }

        return this.__IUserActivityRequestManager.add_UserActivityRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UserActivityRequested(token) {
        if (!this.HasProp("__IUserActivityRequestManager")) {
            if ((queryResult := this.QueryInterface(IUserActivityRequestManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserActivityRequestManager := IUserActivityRequestManager(outPtr)
        }

        return this.__IUserActivityRequestManager.remove_UserActivityRequested(token)
    }

;@endregion Instance Methods
}
