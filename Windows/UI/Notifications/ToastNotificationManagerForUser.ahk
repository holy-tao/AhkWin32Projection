#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IToastNotificationManagerForUser.ahk
#Include .\IToastNotificationManagerForUser2.ahk
#Include .\IToastNotificationManagerForUser3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ToastNotificationManagerForUser.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Creates [ToastNotifier](toastnotifier.md) objects that you use to raise toast notifications for the bound [user](toastnotificationmanagerforuser_user.md). This class also provides access to the XML content of the system-provided toast templates so that you can customize that content for use in your notifications.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanagerforuser
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastNotificationManagerForUser extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToastNotificationManagerForUser

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToastNotificationManagerForUser.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [ToastNotificationHistory](toastnotificationhistory.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanagerforuser.history
     * @type {ToastNotificationHistory} 
     */
    History {
        get => this.get_History()
    }

    /**
     * Gets the user that receives the toast notifications created by this object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanagerforuser.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Gets a value that indicates the current notification mode for the associated user which determines which notifications are displayed.
     * @remarks
     * Register for the [ToastNotificationManagerForUser.NotificationModeChanged](toastnotificationmanagerforuser_notificationmodechanged.md) event to be notified when the notification mode changes.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanagerforuser.notificationmode
     * @type {Integer} 
     */
    NotificationMode {
        get => this.get_NotificationMode()
    }

    /**
     * Occurs when the value of [ToastNotificationManagerForUser.NotificationMode](toastnotificationmanagerforuser_notificationmode.md) property changes.
     * @type {TypedEventHandler<ToastNotificationManagerForUser, IInspectable>}
    */
    OnNotificationModeChanged {
        get {
            if(!this.HasProp("__OnNotificationModeChanged")){
                this.__OnNotificationModeChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{821bdf6b-029a-5299-93f3-3077b2ee5e33}"),
                    ToastNotificationManagerForUser,
                    IInspectable
                )
                this.__OnNotificationModeChangedToken := this.add_NotificationModeChanged(this.__OnNotificationModeChanged.iface)
            }
            return this.__OnNotificationModeChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnNotificationModeChangedToken")) {
            this.remove_NotificationModeChanged(this.__OnNotificationModeChangedToken)
            this.__OnNotificationModeChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Creates a new [ToastNotification](toastnotification.md) for the bound [user](toastnotificationmanagerforuser_user.md) and the specified app, usually another app in the same package.
     * @returns {ToastNotifier} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanagerforuser.createtoastnotifier
     */
    CreateToastNotifier() {
        if (!this.HasProp("__IToastNotificationManagerForUser")) {
            if ((queryResult := this.QueryInterface(IToastNotificationManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationManagerForUser := IToastNotificationManagerForUser(outPtr)
        }

        return this.__IToastNotificationManagerForUser.CreateToastNotifier()
    }

    /**
     * Creates a new [ToastNotifier](toastnotifier.md) for the calling application and the bound [user](toastnotificationmanagerforuser_user.md) that lets you raise a toast notification.
     * @param {HSTRING} applicationId 
     * @returns {ToastNotifier} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanagerforuser.createtoastnotifier
     */
    CreateToastNotifierWithId(applicationId) {
        if (!this.HasProp("__IToastNotificationManagerForUser")) {
            if ((queryResult := this.QueryInterface(IToastNotificationManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationManagerForUser := IToastNotificationManagerForUser(outPtr)
        }

        return this.__IToastNotificationManagerForUser.CreateToastNotifierWithId(applicationId)
    }

    /**
     * 
     * @returns {ToastNotificationHistory} 
     */
    get_History() {
        if (!this.HasProp("__IToastNotificationManagerForUser")) {
            if ((queryResult := this.QueryInterface(IToastNotificationManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationManagerForUser := IToastNotificationManagerForUser(outPtr)
        }

        return this.__IToastNotificationManagerForUser.get_History()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IToastNotificationManagerForUser")) {
            if ((queryResult := this.QueryInterface(IToastNotificationManagerForUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationManagerForUser := IToastNotificationManagerForUser(outPtr)
        }

        return this.__IToastNotificationManagerForUser.get_User()
    }

    /**
     * Creates a new [ToastNotification](toastnotification.md) for the bound [user](toastnotificationmanagerforuser_user.md) and app for the specified notification group.
     * @param {HSTRING} collectionId The ID of the notification group you want to send.
     * @returns {IAsyncOperation<ToastNotifier>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanagerforuser.gettoastnotifierfortoastcollectionidasync
     */
    GetToastNotifierForToastCollectionIdAsync(collectionId) {
        if (!this.HasProp("__IToastNotificationManagerForUser2")) {
            if ((queryResult := this.QueryInterface(IToastNotificationManagerForUser2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationManagerForUser2 := IToastNotificationManagerForUser2(outPtr)
        }

        return this.__IToastNotificationManagerForUser2.GetToastNotifierForToastCollectionIdAsync(collectionId)
    }

    /**
     * Starts the retrieval of notification history for the specified notification group.
     * @param {HSTRING} collectionId The ID of the notification group whose history you want to retrieve.
     * @returns {IAsyncOperation<ToastNotificationHistory>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanagerforuser.gethistoryfortoastcollectionidasync
     */
    GetHistoryForToastCollectionIdAsync(collectionId) {
        if (!this.HasProp("__IToastNotificationManagerForUser2")) {
            if ((queryResult := this.QueryInterface(IToastNotificationManagerForUser2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationManagerForUser2 := IToastNotificationManagerForUser2(outPtr)
        }

        return this.__IToastNotificationManagerForUser2.GetHistoryForToastCollectionIdAsync(collectionId)
    }

    /**
     * Creates a [ToastCollectionManager](toastcollectionmanager.md) that you can use to save, update, and clear notification groups for the specified app.
     * @returns {ToastCollectionManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanagerforuser.gettoastcollectionmanager
     */
    GetToastCollectionManager() {
        if (!this.HasProp("__IToastNotificationManagerForUser2")) {
            if ((queryResult := this.QueryInterface(IToastNotificationManagerForUser2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationManagerForUser2 := IToastNotificationManagerForUser2(outPtr)
        }

        return this.__IToastNotificationManagerForUser2.GetToastCollectionManager()
    }

    /**
     * Creates a [ToastCollectionManager](toastcollectionmanager.md) that you can use to save, update, and clear notification groups for the current app.
     * @param {HSTRING} appId 
     * @returns {ToastCollectionManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationmanagerforuser.gettoastcollectionmanager
     */
    GetToastCollectionManagerWithAppId(appId) {
        if (!this.HasProp("__IToastNotificationManagerForUser2")) {
            if ((queryResult := this.QueryInterface(IToastNotificationManagerForUser2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationManagerForUser2 := IToastNotificationManagerForUser2(outPtr)
        }

        return this.__IToastNotificationManagerForUser2.GetToastCollectionManagerWithAppId(appId)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NotificationMode() {
        if (!this.HasProp("__IToastNotificationManagerForUser3")) {
            if ((queryResult := this.QueryInterface(IToastNotificationManagerForUser3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationManagerForUser3 := IToastNotificationManagerForUser3(outPtr)
        }

        return this.__IToastNotificationManagerForUser3.get_NotificationMode()
    }

    /**
     * 
     * @param {TypedEventHandler<ToastNotificationManagerForUser, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NotificationModeChanged(handler) {
        if (!this.HasProp("__IToastNotificationManagerForUser3")) {
            if ((queryResult := this.QueryInterface(IToastNotificationManagerForUser3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationManagerForUser3 := IToastNotificationManagerForUser3(outPtr)
        }

        return this.__IToastNotificationManagerForUser3.add_NotificationModeChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_NotificationModeChanged(token) {
        if (!this.HasProp("__IToastNotificationManagerForUser3")) {
            if ((queryResult := this.QueryInterface(IToastNotificationManagerForUser3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationManagerForUser3 := IToastNotificationManagerForUser3(outPtr)
        }

        return this.__IToastNotificationManagerForUser3.remove_NotificationModeChanged(token)
    }

;@endregion Instance Methods
}
