#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserNotificationListener.ahk
#Include .\IUserNotificationListenerStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\UserNotificationListener.ahk
#Include ..\UserNotificationChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Reads and manages a user's notifications.
 * @remarks
 * UserNotificationListener requires explicit user permission to be granted before it may be used, so before attempting to access notifications be sure you call [RequestAccessAsync](usernotificationlistener_requestaccessasync_380675631.md) from a UI-thread.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.management.usernotificationlistener
 * @namespace Windows.UI.Notifications.Management
 * @version WindowsRuntime 1.4
 */
class UserNotificationListener extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserNotificationListener

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserNotificationListener.IID

    /**
     * Gets a [UserNotificationListener](usernotificationlistener.md) for the current user.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.management.usernotificationlistener.current
     * @type {UserNotificationListener} 
     */
    static Current {
        get => UserNotificationListener.get_Current()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {UserNotificationListener} 
     */
    static get_Current() {
        if (!UserNotificationListener.HasProp("__IUserNotificationListenerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.Management.UserNotificationListener")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUserNotificationListenerStatics.IID)
            UserNotificationListener.__IUserNotificationListenerStatics := IUserNotificationListenerStatics(factoryPtr)
        }

        return UserNotificationListener.__IUserNotificationListenerStatics.get_Current()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnNotificationChangedToken")) {
            this.remove_NotificationChanged(this.__OnNotificationChangedToken)
            this.__OnNotificationChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Requests the user's permission to manage notifications.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.management.usernotificationlistener.requestaccessasync
     */
    RequestAccessAsync() {
        if (!this.HasProp("__IUserNotificationListener")) {
            if ((queryResult := this.QueryInterface(IUserNotificationListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserNotificationListener := IUserNotificationListener(outPtr)
        }

        return this.__IUserNotificationListener.RequestAccessAsync()
    }

    /**
     * Gets a value that indicates whether the [UserNotificationListener](usernotificationlistener.md) has access to the user's notifications.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.management.usernotificationlistener.getaccessstatus
     */
    GetAccessStatus() {
        if (!this.HasProp("__IUserNotificationListener")) {
            if ((queryResult := this.QueryInterface(IUserNotificationListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserNotificationListener := IUserNotificationListener(outPtr)
        }

        return this.__IUserNotificationListener.GetAccessStatus()
    }

    /**
     * 
     * @param {TypedEventHandler<UserNotificationListener, UserNotificationChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NotificationChanged(handler) {
        if (!this.HasProp("__IUserNotificationListener")) {
            if ((queryResult := this.QueryInterface(IUserNotificationListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserNotificationListener := IUserNotificationListener(outPtr)
        }

        return this.__IUserNotificationListener.add_NotificationChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NotificationChanged(token) {
        if (!this.HasProp("__IUserNotificationListener")) {
            if ((queryResult := this.QueryInterface(IUserNotificationListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserNotificationListener := IUserNotificationListener(outPtr)
        }

        return this.__IUserNotificationListener.remove_NotificationChanged(token)
    }

    /**
     * Asynchronously retrieves notifications that match the specified notification kind.
     * @param {Integer} kinds The type of notification to retrieve.
     * @returns {IAsyncOperation<IVectorView<UserNotification>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.management.usernotificationlistener.getnotificationsasync
     */
    GetNotificationsAsync(kinds) {
        if (!this.HasProp("__IUserNotificationListener")) {
            if ((queryResult := this.QueryInterface(IUserNotificationListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserNotificationListener := IUserNotificationListener(outPtr)
        }

        return this.__IUserNotificationListener.GetNotificationsAsync(kinds)
    }

    /**
     * Retrieves the specified notification.
     * @param {Integer} notificationId The ID of the notification to retrieve.
     * @returns {UserNotification} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.management.usernotificationlistener.getnotification
     */
    GetNotification(notificationId) {
        if (!this.HasProp("__IUserNotificationListener")) {
            if ((queryResult := this.QueryInterface(IUserNotificationListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserNotificationListener := IUserNotificationListener(outPtr)
        }

        return this.__IUserNotificationListener.GetNotification(notificationId)
    }

    /**
     * Clears the notification.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.management.usernotificationlistener.clearnotifications
     */
    ClearNotifications() {
        if (!this.HasProp("__IUserNotificationListener")) {
            if ((queryResult := this.QueryInterface(IUserNotificationListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserNotificationListener := IUserNotificationListener(outPtr)
        }

        return this.__IUserNotificationListener.ClearNotifications()
    }

    /**
     * Removes the specified notification.
     * @param {Integer} notificationId The ID of the notification to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.management.usernotificationlistener.removenotification
     */
    RemoveNotification(notificationId) {
        if (!this.HasProp("__IUserNotificationListener")) {
            if ((queryResult := this.QueryInterface(IUserNotificationListener.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserNotificationListener := IUserNotificationListener(outPtr)
        }

        return this.__IUserNotificationListener.RemoveNotification(notificationId)
    }

;@endregion Instance Methods
}
