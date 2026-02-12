#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IScheduledToastNotificationShowingEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides info when the system is in the process of showing a scheduled toast notification.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotificationshowingeventargs
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ScheduledToastNotificationShowingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScheduledToastNotificationShowingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScheduledToastNotificationShowingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets whether Windows should perform its default handling of the notification.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotificationshowingeventargs.cancel
     * @type {Boolean} 
     */
    Cancel {
        get => this.get_Cancel()
        set => this.put_Cancel(value)
    }

    /**
     * Gets the scheduled toast notification being shown.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotificationshowingeventargs.scheduledtoastnotification
     * @type {ScheduledToastNotification} 
     */
    ScheduledToastNotification {
        get => this.get_ScheduledToastNotification()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Cancel() {
        if (!this.HasProp("__IScheduledToastNotificationShowingEventArgs")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotificationShowingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotificationShowingEventArgs := IScheduledToastNotificationShowingEventArgs(outPtr)
        }

        return this.__IScheduledToastNotificationShowingEventArgs.get_Cancel()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Cancel(value) {
        if (!this.HasProp("__IScheduledToastNotificationShowingEventArgs")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotificationShowingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotificationShowingEventArgs := IScheduledToastNotificationShowingEventArgs(outPtr)
        }

        return this.__IScheduledToastNotificationShowingEventArgs.put_Cancel(value)
    }

    /**
     * 
     * @returns {ScheduledToastNotification} 
     */
    get_ScheduledToastNotification() {
        if (!this.HasProp("__IScheduledToastNotificationShowingEventArgs")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotificationShowingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotificationShowingEventArgs := IScheduledToastNotificationShowingEventArgs(outPtr)
        }

        return this.__IScheduledToastNotificationShowingEventArgs.get_ScheduledToastNotification()
    }

    /**
     * Requests that the app delay showing the scheduled toast notification.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.scheduledtoastnotificationshowingeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IScheduledToastNotificationShowingEventArgs")) {
            if ((queryResult := this.QueryInterface(IScheduledToastNotificationShowingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScheduledToastNotificationShowingEventArgs := IScheduledToastNotificationShowingEventArgs(outPtr)
        }

        return this.__IScheduledToastNotificationShowingEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
