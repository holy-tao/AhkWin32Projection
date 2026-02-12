#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserNotification.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a notification for a specific user.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.usernotification
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class UserNotification extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserNotification

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserNotification.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the notification content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.usernotification.notification
     * @type {Notification} 
     */
    Notification {
        get => this.get_Notification()
    }

    /**
     * Gets info about the app that owns the notification.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.usernotification.appinfo
     * @type {AppInfo} 
     */
    AppInfo {
        get => this.get_AppInfo()
    }

    /**
     * Gets the ID of the notification.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.usernotification.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the time at which the notification was created.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.usernotification.creationtime
     * @type {DateTime} 
     */
    CreationTime {
        get => this.get_CreationTime()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Notification} 
     */
    get_Notification() {
        if (!this.HasProp("__IUserNotification")) {
            if ((queryResult := this.QueryInterface(IUserNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserNotification := IUserNotification(outPtr)
        }

        return this.__IUserNotification.get_Notification()
    }

    /**
     * 
     * @returns {AppInfo} 
     */
    get_AppInfo() {
        if (!this.HasProp("__IUserNotification")) {
            if ((queryResult := this.QueryInterface(IUserNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserNotification := IUserNotification(outPtr)
        }

        return this.__IUserNotification.get_AppInfo()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IUserNotification")) {
            if ((queryResult := this.QueryInterface(IUserNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserNotification := IUserNotification(outPtr)
        }

        return this.__IUserNotification.get_Id()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_CreationTime() {
        if (!this.HasProp("__IUserNotification")) {
            if ((queryResult := this.QueryInterface(IUserNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserNotification := IUserNotification(outPtr)
        }

        return this.__IUserNotification.get_CreationTime()
    }

;@endregion Instance Methods
}
