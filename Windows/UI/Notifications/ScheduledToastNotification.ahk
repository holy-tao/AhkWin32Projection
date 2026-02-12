#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IScheduledToastNotification.ahk
#Include .\IScheduledToastNotification2.ahk
#Include .\IScheduledToastNotification3.ahk
#Include .\IScheduledToastNotification4.ahk
#Include .\IScheduledToastNotificationFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the XML that defines the toast notification that will display at the scheduled time.
 * @remarks
 * Create and initialize a new instance of this object by calling [ScheduledToastNotification](scheduledtoastnotification_scheduledtoastnotification_1365784316.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotification
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ScheduledToastNotification extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScheduledToastNotification

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScheduledToastNotification.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates and initializes a new instance of a [ScheduledToastNotification](scheduledtoastnotification.md) that will be displayed only once.
     * @param {XmlDocument} content The XML that defines the toast notification content.
     * @param {DateTime} deliveryTime The date and time that Windows should display the toast notification. You must call [AddToSchedule](toastnotifier_addtoschedule_1355516744.md) before this time.
     * @returns {ScheduledToastNotification} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotification.#ctor
     */
    static CreateScheduledToastNotification(content, deliveryTime) {
        if (!ScheduledToastNotification.HasProp("__IScheduledToastNotificationFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.ScheduledToastNotification")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScheduledToastNotificationFactory.IID)
            ScheduledToastNotification.__IScheduledToastNotificationFactory := IScheduledToastNotificationFactory(factoryPtr)
        }

        return ScheduledToastNotification.__IScheduledToastNotificationFactory.CreateScheduledToastNotification(content, deliveryTime)
    }

    /**
     * Deprecated in Windows 10. On Windows 8 systems, creates and initializes a new instance of a [ScheduledToastNotification](scheduledtoastnotification.md) that re-appears after a specified time after initially appearing. On Windows 10, this functions equivalently to [ScheduledToastNotification(XmlDocument, DateTime)](windows.ui.notifications/scheduledtoastnotification_scheduledtoastnotification_1677895932.md). To achieve the same snooze interval behavior in Windows 10, you can use [buttons on your toasts](/windows/uwp/design/shell/tiles-and-notifications/adaptive-interactive-toasts#buttons).
     * @remarks
     * This type of snooze interval scheduled toast notification is good for a snooze alarm-like functionality. For instance, the notification could be displayed every five minutes until the maximum snooze count is reached, unless the notification is explicitly removed from the schedule by your app.
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > Your app is responsible for removing the notification from the schedule once the user activates the notification through a touch or click. Failure to do so can cause the notification to re-appear until the maximum snooze count is reached, even if the user has already dealt with it.
     * 
     * If you want to schedule long snooze intervals like months or years, we recommend that you use individual scheduled toasts rather than this method. That will avoid timing errors caused by daylight savings time or leap years.
     * 
     * The following code shows a call to this method that displays a toast beginning at *myData* every five minutes for a maximum of three times.
     * @param {XmlDocument} content The XML that defines the toast notification content.
     * @param {DateTime} deliveryTime The date and time that Windows should first display the toast notification. You must call [AddToSchedule](toastnotifier_addtoschedule_1355516744.md) before this time.
     * @param {TimeSpan} snoozeInterval The amount of time between occurrences of the notification. To be valid, this value must be no less than 60 seconds and no more than 60 minutes.
     * @param {Integer} maximumSnoozeCount The maximum number of times to display this notification. Valid values range from 1 to 5.
     * @returns {ScheduledToastNotification} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotification.#ctor
     */
    static CreateScheduledToastNotificationRecurring(content, deliveryTime, snoozeInterval, maximumSnoozeCount) {
        if (!ScheduledToastNotification.HasProp("__IScheduledToastNotificationFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Notifications.ScheduledToastNotification")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScheduledToastNotificationFactory.IID)
            ScheduledToastNotification.__IScheduledToastNotificationFactory := IScheduledToastNotificationFactory(factoryPtr)
        }

        return ScheduledToastNotification.__IScheduledToastNotificationFactory.CreateScheduledToastNotificationRecurring(content, deliveryTime, snoozeInterval, maximumSnoozeCount)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the XML that defines this scheduled toast notification.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotification.content
     * @type {XmlDocument} 
     */
    Content {
        get => this.get_Content()
    }

    /**
     * Gets the time that this toast notification is scheduled to be displayed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotification.deliverytime
     * @type {DateTime} 
     */
    DeliveryTime {
        get => this.get_DeliveryTime()
    }

    /**
     * Gets the amount of time between occurrences of the notification.
     * @remarks
     * This value is set when the [ScheduledToastNotification](scheduledtoastnotification.md) object is created.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotification.snoozeinterval
     * @type {IReference<TimeSpan>} 
     */
    SnoozeInterval {
        get => this.get_SnoozeInterval()
    }

    /**
     * Gets the maximum number of times to display this notification.
     * @remarks
     * Note that this is the number of repeat showings specified when the [ScheduledToastNotification](scheduledtoastnotification.md) is created. It is not the number of showings remaining if the toast has already been shown. There is no method to directly retrieve that information.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotification.maximumsnoozecount
     * @type {Integer} 
     */
    MaximumSnoozeCount {
        get => this.get_MaximumSnoozeCount()
    }

    /**
     * Gets a developer-specified value used to identify a specific scheduled toast.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotification.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * Gets or sets a string that uniquely identifies a toast notification inside a [Group](scheduledtoastnotification_group.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotification.tag
     * @type {HSTRING} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
    }

    /**
     * Gets or sets the group identifier for the notification.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotification.group
     * @type {HSTRING} 
     */
    Group {
        get => this.get_Group()
        set => this.put_Group(value)
    }

    /**
     * Gets or sets whether a toast's pop-up UI is displayed on the user's screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotification.suppresspopup
     * @type {Boolean} 
     */
    SuppressPopup {
        get => this.get_SuppressPopup()
        set => this.put_SuppressPopup(value)
    }

    /**
     * Gets or sets a value that specifies whether notification mirroring is enabled. (Notification mirroring enables a notification to appear on multiple devices.)
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotification.notificationmirroring
     * @type {Integer} 
     */
    NotificationMirroring {
        get => this.get_NotificationMirroring()
        set => this.put_NotificationMirroring(value)
    }

    /**
     * Gets or sets a remote id for the notification that enables the system to correlate this notification with another one generated on another device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotification.remoteid
     * @type {HSTRING} 
     */
    RemoteId {
        get => this.get_RemoteId()
        set => this.put_RemoteId(value)
    }

    /**
     * Gets or sets the expiration time of the notification.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotification.expirationtime
     * @type {IReference<DateTime>} 
     */
    ExpirationTime {
        get => this.get_ExpirationTime()
        set => this.put_ExpirationTime(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {XmlDocument} 
     */
    get_Content() {
        if (!this.HasProp("__IScheduledToastNotification")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification := IScheduledToastNotification(outPtr)
        }

        return this.__IScheduledToastNotification.get_Content()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DeliveryTime() {
        if (!this.HasProp("__IScheduledToastNotification")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification := IScheduledToastNotification(outPtr)
        }

        return this.__IScheduledToastNotification.get_DeliveryTime()
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_SnoozeInterval() {
        if (!this.HasProp("__IScheduledToastNotification")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification := IScheduledToastNotification(outPtr)
        }

        return this.__IScheduledToastNotification.get_SnoozeInterval()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaximumSnoozeCount() {
        if (!this.HasProp("__IScheduledToastNotification")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification := IScheduledToastNotification(outPtr)
        }

        return this.__IScheduledToastNotification.get_MaximumSnoozeCount()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IScheduledToastNotification")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification := IScheduledToastNotification(outPtr)
        }

        return this.__IScheduledToastNotification.put_Id(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IScheduledToastNotification")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification := IScheduledToastNotification(outPtr)
        }

        return this.__IScheduledToastNotification.get_Id()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Tag(value) {
        if (!this.HasProp("__IScheduledToastNotification2")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification2 := IScheduledToastNotification2(outPtr)
        }

        return this.__IScheduledToastNotification2.put_Tag(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Tag() {
        if (!this.HasProp("__IScheduledToastNotification2")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification2 := IScheduledToastNotification2(outPtr)
        }

        return this.__IScheduledToastNotification2.get_Tag()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Group(value) {
        if (!this.HasProp("__IScheduledToastNotification2")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification2 := IScheduledToastNotification2(outPtr)
        }

        return this.__IScheduledToastNotification2.put_Group(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Group() {
        if (!this.HasProp("__IScheduledToastNotification2")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification2 := IScheduledToastNotification2(outPtr)
        }

        return this.__IScheduledToastNotification2.get_Group()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SuppressPopup(value) {
        if (!this.HasProp("__IScheduledToastNotification2")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification2 := IScheduledToastNotification2(outPtr)
        }

        return this.__IScheduledToastNotification2.put_SuppressPopup(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SuppressPopup() {
        if (!this.HasProp("__IScheduledToastNotification2")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification2 := IScheduledToastNotification2(outPtr)
        }

        return this.__IScheduledToastNotification2.get_SuppressPopup()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NotificationMirroring() {
        if (!this.HasProp("__IScheduledToastNotification3")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification3 := IScheduledToastNotification3(outPtr)
        }

        return this.__IScheduledToastNotification3.get_NotificationMirroring()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_NotificationMirroring(value) {
        if (!this.HasProp("__IScheduledToastNotification3")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification3 := IScheduledToastNotification3(outPtr)
        }

        return this.__IScheduledToastNotification3.put_NotificationMirroring(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteId() {
        if (!this.HasProp("__IScheduledToastNotification3")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification3 := IScheduledToastNotification3(outPtr)
        }

        return this.__IScheduledToastNotification3.get_RemoteId()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_RemoteId(value) {
        if (!this.HasProp("__IScheduledToastNotification3")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification3 := IScheduledToastNotification3(outPtr)
        }

        return this.__IScheduledToastNotification3.put_RemoteId(value)
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_ExpirationTime() {
        if (!this.HasProp("__IScheduledToastNotification4")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification4 := IScheduledToastNotification4(outPtr)
        }

        return this.__IScheduledToastNotification4.get_ExpirationTime()
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_ExpirationTime(value) {
        if (!this.HasProp("__IScheduledToastNotification4")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotification4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotification4 := IScheduledToastNotification4(outPtr)
        }

        return this.__IScheduledToastNotification4.put_ExpirationTime(value)
    }

;@endregion Instance Methods
}
