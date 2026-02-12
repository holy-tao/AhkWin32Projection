#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IToastFailedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the error code that was generated in the process of raising a toast notification.
 * @remarks
 * Your app receives this class when processing the [ToastNotification.Failed](toastnotification_failed.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastfailedeventargs
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class ToastFailedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IToastFailedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IToastFailedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the error code that was generated in the process of raising a toast notification.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.toastfailedeventargs.errorcode
     * @type {HRESULT} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IToastFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(IToastFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IToastFailedEventArgs := IToastFailedEventArgs(outPtr)
        }

        return this.__IToastFailedEventArgs.get_ErrorCode()
    }

;@endregion Instance Methods
}
