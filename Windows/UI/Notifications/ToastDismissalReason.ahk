#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the reason that a toast notification is no longer being shown. Used with [ToastDismissedEventArgs.Reason](toastdismissedeventargs_reason.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastdismissalreason
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastDismissalReason extends Win32Enum{

    /**
     * The user dismissed the toast notification.
     * @type {Integer (Int32)}
     */
    static UserCanceled => 0

    /**
     * The app explicitly hid the toast notification by calling the [ToastNotifier.hide](toastnotifier_hide_1807990681.md) method.
     * @type {Integer (Int32)}
     */
    static ApplicationHidden => 1

    /**
     * The toast notification had been shown for the maximum allowed time and was faded out. The maximum time to show a toast notification is 7 seconds except in the case of long-duration toasts, in which case it is 25 seconds.
     * @type {Integer (Int32)}
     */
    static TimedOut => 2
}
