#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPushNotificationReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Encapsulates a push notification that has been received from the app server, identifying the type and supplying the content of the notification. Windows passes this information in the [PushNotificationReceived](pushnotificationchannel_pushnotificationreceived.md) event.
 * @remarks
 * Your app receives this class when processing the [PushNotificationReceived](pushnotificationchannel_pushnotificationreceived.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationreceivedeventargs
 * @namespace Windows.Networking.PushNotifications
 * @version WindowsRuntime 1.4
 */
class PushNotificationReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPushNotificationReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPushNotificationReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets whether Windows should perform its default handling of the notification.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationreceivedeventargs.cancel
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
    }

    /**
     * Gets the type of push notification that has been received from the app server.
     * @remarks
     * Channels bound to secondary tiles will only accept push notifications for **Tile** and **Badge** updates. **Toast** and **Raw** notifications must use a channel bound to an application.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationreceivedeventargs.notificationtype
     * @type {Integer} 
     */
    NotificationType {
        get => this.get_NotificationType()
    }

    /**
     * Gets the content of a toast to display in response to this push notification.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationreceivedeventargs.toastnotification
     * @type {ToastNotification} 
     */
    ToastNotification {
        get => this.get_ToastNotification()
    }

    /**
     * Gets the content of a tile update to perform in response to this push notification.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationreceivedeventargs.tilenotification
     * @type {TileNotification} 
     */
    TileNotification {
        get => this.get_TileNotification()
    }

    /**
     * Gets the content of a badge update to perform in response to this push notification.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationreceivedeventargs.badgenotification
     * @type {BadgeNotification} 
     */
    BadgeNotification {
        get => this.get_BadgeNotification()
    }

    /**
     * Gets the app-defined content contained in this push notification, the contents of which are used to perform a background task on the app.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.pushnotifications.pushnotificationreceivedeventargs.rawnotification
     * @type {RawNotification} 
     */
    RawNotification {
        get => this.get_RawNotification()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__IPushNotificationReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPushNotificationReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationReceivedEventArgs := IPushNotificationReceivedEventArgs(outPtr)
        }

        return this.__IPushNotificationReceivedEventArgs.put_Cancel(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
        if (!this.HasProp("__IPushNotificationReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPushNotificationReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationReceivedEventArgs := IPushNotificationReceivedEventArgs(outPtr)
        }

        return this.__IPushNotificationReceivedEventArgs.get_Cancel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NotificationType() {
        if (!this.HasProp("__IPushNotificationReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPushNotificationReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationReceivedEventArgs := IPushNotificationReceivedEventArgs(outPtr)
        }

        return this.__IPushNotificationReceivedEventArgs.get_NotificationType()
    }

    /**
     * 
     * @returns {ToastNotification} 
     */
    get_ToastNotification() {
        if (!this.HasProp("__IPushNotificationReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPushNotificationReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationReceivedEventArgs := IPushNotificationReceivedEventArgs(outPtr)
        }

        return this.__IPushNotificationReceivedEventArgs.get_ToastNotification()
    }

    /**
     * 
     * @returns {TileNotification} 
     */
    get_TileNotification() {
        if (!this.HasProp("__IPushNotificationReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPushNotificationReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationReceivedEventArgs := IPushNotificationReceivedEventArgs(outPtr)
        }

        return this.__IPushNotificationReceivedEventArgs.get_TileNotification()
    }

    /**
     * 
     * @returns {BadgeNotification} 
     */
    get_BadgeNotification() {
        if (!this.HasProp("__IPushNotificationReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPushNotificationReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationReceivedEventArgs := IPushNotificationReceivedEventArgs(outPtr)
        }

        return this.__IPushNotificationReceivedEventArgs.get_BadgeNotification()
    }

    /**
     * 
     * @returns {RawNotification} 
     */
    get_RawNotification() {
        if (!this.HasProp("__IPushNotificationReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPushNotificationReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPushNotificationReceivedEventArgs := IPushNotificationReceivedEventArgs(outPtr)
        }

        return this.__IPushNotificationReceivedEventArgs.get_RawNotification()
    }

;@endregion Instance Methods
}
