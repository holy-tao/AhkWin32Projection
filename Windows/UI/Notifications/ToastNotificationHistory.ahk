#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IToastNotificationHistory2.ahk
#Include .\IToastNotificationHistory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages the toast notifications for an app including the ability the clear all toast history and removing individual toasts.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationhistory
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastNotificationHistory extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToastNotificationHistory2

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToastNotificationHistory2.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets notification history, for a toast with the specified tag label, from action center.
     * @returns {IVectorView<ToastNotification>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationhistory.gethistory
     */
    GetHistory() {
        if (!this.HasProp("__IToastNotificationHistory2")) {
            if ((queryResult := this.QueryInterface(IToastNotificationHistory2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationHistory2 := IToastNotificationHistory2(outPtr)
        }

        return this.__IToastNotificationHistory2.GetHistory()
    }

    /**
     * Gets notification history, for all notifications sent by this app, from action center.
     * @param {HSTRING} applicationId 
     * @returns {IVectorView<ToastNotification>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationhistory.gethistory
     */
    GetHistoryWithId(applicationId) {
        if (!this.HasProp("__IToastNotificationHistory2")) {
            if ((queryResult := this.QueryInterface(IToastNotificationHistory2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationHistory2 := IToastNotificationHistory2(outPtr)
        }

        return this.__IToastNotificationHistory2.GetHistoryWithId(applicationId)
    }

    /**
     * Removes a group of toast notifications, identified by the specified group label, from action center.
     * @param {HSTRING} group The group label of the toast notifications to be removed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationhistory.removegroup
     */
    RemoveGroup(group) {
        if (!this.HasProp("__IToastNotificationHistory")) {
            if ((queryResult := this.QueryInterface(IToastNotificationHistory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationHistory := IToastNotificationHistory(outPtr)
        }

        return this.__IToastNotificationHistory.RemoveGroup(group)
    }

    /**
     * Removes a group of toast notifications sent by the another app inside the same app package from action center using the group label.
     * @param {HSTRING} group The group label of the toast notifications to be removed.
     * @param {HSTRING} applicationId The app ID of the app within the same app package of the calling app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationhistory.removegroup
     */
    RemoveGroupWithId(group, applicationId) {
        if (!this.HasProp("__IToastNotificationHistory")) {
            if ((queryResult := this.QueryInterface(IToastNotificationHistory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationHistory := IToastNotificationHistory(outPtr)
        }

        return this.__IToastNotificationHistory.RemoveGroupWithId(group, applicationId)
    }

    /**
     * Removes an individual toast notification from action center, identified by the combination of tag label, group label and app ID.
     * @remarks
     * You should use this overload to remove notifications for a specific app in your app package, as specified by the *applicationId* parameter. If your app only uses tags, you can pass in an empty string for the *group* parameter.
     * @param {HSTRING} tag The tag label of the toast notification to be removed.
     * @param {HSTRING} group The group label of the toast notification to be removed.
     * @param {HSTRING} applicationId The app ID of the app that sent the specified toast notification. This app must be part of the same app package as the app making this remove request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationhistory.remove
     */
    RemoveGroupedTagWithId(tag, group, applicationId) {
        if (!this.HasProp("__IToastNotificationHistory")) {
            if ((queryResult := this.QueryInterface(IToastNotificationHistory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationHistory := IToastNotificationHistory(outPtr)
        }

        return this.__IToastNotificationHistory.RemoveGroupedTagWithId(tag, group, applicationId)
    }

    /**
     * Removes a toast notification from the action using the notification's tag and group labels.
     * @remarks
     * You should use this overload to remove notifications when your app's toast notification categorization system was built using tags and groups.
     * @param {HSTRING} tag The tag label of the toast notification to be removed.
     * @param {HSTRING} group The group label of the toast notification to be removed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationhistory.remove
     */
    RemoveGroupedTag(tag, group) {
        if (!this.HasProp("__IToastNotificationHistory")) {
            if ((queryResult := this.QueryInterface(IToastNotificationHistory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationHistory := IToastNotificationHistory(outPtr)
        }

        return this.__IToastNotificationHistory.RemoveGroupedTag(tag, group)
    }

    /**
     * Removes an individual toast, with the specified tag label, from action center.
     * @remarks
     * You should use this overload to remove notifications when your app's toast notification categorization system was built using only tags.
     * @param {HSTRING} tag The tag label of the toast notification to be removed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationhistory.remove
     */
    Remove(tag) {
        if (!this.HasProp("__IToastNotificationHistory")) {
            if ((queryResult := this.QueryInterface(IToastNotificationHistory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationHistory := IToastNotificationHistory(outPtr)
        }

        return this.__IToastNotificationHistory.Remove2(tag)
    }

    /**
     * Removes all notifications sent by this app from action center.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationhistory.clear
     */
    Clear() {
        if (!this.HasProp("__IToastNotificationHistory")) {
            if ((queryResult := this.QueryInterface(IToastNotificationHistory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationHistory := IToastNotificationHistory(outPtr)
        }

        return this.__IToastNotificationHistory.Clear()
    }

    /**
     * Removes all notifications from action center that were sent by another app inside the same app package.
     * @param {HSTRING} applicationId The ID of the app inside the app package whose notifications are to be deleted.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastnotificationhistory.clear
     */
    ClearWithId(applicationId) {
        if (!this.HasProp("__IToastNotificationHistory")) {
            if ((queryResult := this.QueryInterface(IToastNotificationHistory.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastNotificationHistory := IToastNotificationHistory(outPtr)
        }

        return this.__IToastNotificationHistory.ClearWithId(applicationId)
    }

;@endregion Instance Methods
}
