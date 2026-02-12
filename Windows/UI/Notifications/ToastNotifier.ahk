#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IToastNotifier.ahk
#Include .\IToastNotifier2.ahk
#Include .\IToastNotifier3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\ToastNotifier.ahk
#Include .\ScheduledToastNotificationShowingEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Raises a toast notification to the specific app to which the ToastNotifier is bound. This class also lets you schedule and remove toast notifications.
 * @remarks
 * When it is created, ToastNotifier is bound to a specific app, so the methods of this class affect only that app.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotifier
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastNotifier extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToastNotifier

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToastNotifier.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that tells you whether there is an app, user, or system block that prevents the display of a toast notification.
     * @remarks
     * When toast notifications have been disabled at more than one level, this property value reflects the setting with the largest scope. Precedence is as follows, from largest scope to smallest: 
     * 1. DisabledByManifest
     * 1. DisabledByGroupPolicy
     * 1. DisabledForUser
     * 1. DisabledForApplication
     * If toast notifications have been disabled both by the user and by group policy, this property returns DisabledByGroupPolicy.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotifier.setting
     * @type {Integer} 
     */
    Setting {
        get => this.get_Setting()
    }

    /**
     * Occurs when the system shows the scheduled toast notification.
     * @type {TypedEventHandler<ToastNotifier, ScheduledToastNotificationShowingEventArgs>}
    */
    OnScheduledToastNotificationShowing {
        get {
            if(!this.HasProp("__OnScheduledToastNotificationShowing")){
                this.__OnScheduledToastNotificationShowing := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b1bb0cab-f8b9-5909-a872-ef29e05a8c7a}"),
                    ToastNotifier,
                    ScheduledToastNotificationShowingEventArgs
                )
                this.__OnScheduledToastNotificationShowingToken := this.add_ScheduledToastNotificationShowing(this.__OnScheduledToastNotificationShowing.iface)
            }
            return this.__OnScheduledToastNotificationShowing
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnScheduledToastNotificationShowingToken")) {
            this.remove_ScheduledToastNotificationShowing(this.__OnScheduledToastNotificationShowingToken)
            this.__OnScheduledToastNotificationShowing.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Displays the specified toast notification.
     * @param {ToastNotification} notification_ The object that contains the content of the toast notification to display.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotifier.show
     */
    Show(notification_) {
        if (!this.HasProp("__IToastNotifier")) {
            if ((queryResult := this.QueryInterface(IToastNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotifier := IToastNotifier(outPtr)
        }

        return this.__IToastNotifier.Show(notification_)
    }

    /**
     * Removes the specified toast notification from the screen.
     * @remarks
     * Call Hide if the situation or action that caused the app to raise the toast is no longer an issue. This method should only be called when the app is in the foreground.
     * 
     * > For Windows Phone 8.x app: this method also removes the toast notification from the action center.
     * @param {ToastNotification} notification_ The object that specifies the toast to hide.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotifier.hide
     */
    Hide(notification_) {
        if (!this.HasProp("__IToastNotifier")) {
            if ((queryResult := this.QueryInterface(IToastNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotifier := IToastNotifier(outPtr)
        }

        return this.__IToastNotifier.Hide(notification_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Setting() {
        if (!this.HasProp("__IToastNotifier")) {
            if ((queryResult := this.QueryInterface(IToastNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotifier := IToastNotifier(outPtr)
        }

        return this.__IToastNotifier.get_Setting()
    }

    /**
     * Adds a [ScheduledToastNotification](scheduledtoastnotification.md) for later display by Windows.
     * 
     * > [!IMPORTANT]
     * > This method is only supported in applications which use WinRT as their default application framework.
     * @remarks
     * This method passes the toast notification to the schedule but doesn't specify the time the toast should display. That information is included in the [ScheduledToastNotification](scheduledtoastnotification.md).
     * 
     * Be sure to handle these exceptions when calling **AddToSchedule**:
     * 
     * * **Exception**: `System.Exception: 'Not enough quota is available to process this command. (Exception from HRESULT: 0x80070718)'`
     * + **Possible cause**: You've exceeded the maximum allowed number of scheduled notifications.
     * 
     * **Fix**: ToastNotifier.addToSchedule will fail if you attempt to schedule more than 4096 notifications. Reduce your number of scheduled notifications.
     * + **Possible cause**: Your notification is scheduled for a time in the past relative to the current system clock time.
     * 
     * **Fix**: Make sure that the scheduled notification time specified in your [ScheduledToastNotification](scheduledtoastnotification.md) is in the future. Examine the system clock time.
     * @param {ScheduledToastNotification} scheduledToast The scheduled toast notification, which includes its content and timing instructions.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotifier.addtoschedule
     */
    AddToSchedule(scheduledToast) {
        if (!this.HasProp("__IToastNotifier")) {
            if ((queryResult := this.QueryInterface(IToastNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotifier := IToastNotifier(outPtr)
        }

        return this.__IToastNotifier.AddToSchedule(scheduledToast)
    }

    /**
     * Cancels the scheduled display of a specified [ScheduledToastNotification](scheduledtoastnotification.md).
     * 
     * > [!IMPORTANT]
     * > This method is only supported in applications which use WinRT as their default application framework.
     * @remarks
     * If you want to cancel one or more scheduled toast notifications, you can use the [GetScheduledToastNotifications](toastnotifier_getscheduledtoastnotifications_1959697028.md) method to get the full list.
     * @param {ScheduledToastNotification} scheduledToast The notification to remove from the schedule.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotifier.removefromschedule
     */
    RemoveFromSchedule(scheduledToast) {
        if (!this.HasProp("__IToastNotifier")) {
            if ((queryResult := this.QueryInterface(IToastNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotifier := IToastNotifier(outPtr)
        }

        return this.__IToastNotifier.RemoveFromSchedule(scheduledToast)
    }

    /**
     * Gets the collection of [ScheduledToastNotification](scheduledtoastnotification.md) objects that this app has scheduled for display.
     * 
     * > [!IMPORTANT]
     * > This method is only supported in applications which use WinRT as their default application framework.
     * @returns {IVectorView<ScheduledToastNotification>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotifier.getscheduledtoastnotifications
     */
    GetScheduledToastNotifications() {
        if (!this.HasProp("__IToastNotifier")) {
            if ((queryResult := this.QueryInterface(IToastNotifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotifier := IToastNotifier(outPtr)
        }

        return this.__IToastNotifier.GetScheduledToastNotifications()
    }

    /**
     * Updates the existing toast notification that has the specified tag.
     * @param {NotificationData} data An object that contains the updated info.
     * @param {HSTRING} tag The identifier of the toast notification to update.
     * @param {HSTRING} group 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotifier.update
     */
    UpdateWithTagAndGroup(data, tag, group) {
        if (!this.HasProp("__IToastNotifier2")) {
            if ((queryResult := this.QueryInterface(IToastNotifier2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotifier2 := IToastNotifier2(outPtr)
        }

        return this.__IToastNotifier2.UpdateWithTagAndGroup(data, tag, group)
    }

    /**
     * Updates the existing toast notification that has the specified tag and belongs to the specified notification group.
     * @param {NotificationData} data An object that contains the updated info.
     * @param {HSTRING} tag The identifier of the toast notification to update.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotifier.update
     */
    UpdateWithTag(data, tag) {
        if (!this.HasProp("__IToastNotifier2")) {
            if ((queryResult := this.QueryInterface(IToastNotifier2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotifier2 := IToastNotifier2(outPtr)
        }

        return this.__IToastNotifier2.UpdateWithTag(data, tag)
    }

    /**
     * 
     * @param {TypedEventHandler<ToastNotifier, ScheduledToastNotificationShowingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScheduledToastNotificationShowing(handler) {
        if (!this.HasProp("__IToastNotifier3")) {
            if ((queryResult := this.QueryInterface(IToastNotifier3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotifier3 := IToastNotifier3(outPtr)
        }

        return this.__IToastNotifier3.add_ScheduledToastNotificationShowing(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ScheduledToastNotificationShowing(token) {
        if (!this.HasProp("__IToastNotifier3")) {
            if ((queryResult := this.QueryInterface(IToastNotifier3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotifier3 := IToastNotifier3(outPtr)
        }

        return this.__IToastNotifier3.remove_ScheduledToastNotificationShowing(token)
    }

;@endregion Instance Methods
}
