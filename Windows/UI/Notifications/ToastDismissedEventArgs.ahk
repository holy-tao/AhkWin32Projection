#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IToastDismissedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the reason that a toast notification is no longer displayed on-screen.
 * @remarks
 * Your app receives this class when processing the [ToastNotification.Dismissed](toastnotification_dismissed.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastdismissedeventargs
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastDismissedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToastDismissedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToastDismissedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the reason that a toast notification is no longer displayed on-screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastdismissedeventargs.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        if (!this.HasProp("__IToastDismissedEventArgs")) {
            if ((queryResult := this.QueryInterface(IToastDismissedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastDismissedEventArgs := IToastDismissedEventArgs(outPtr)
        }

        return this.__IToastDismissedEventArgs.get_Reason()
    }

;@endregion Instance Methods
}
