#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILockScreenCallEndRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Controls the removal of an app from the lock screen.
 * @remarks
 * If the app doesn't call [GetDeferral](lockscreencallendrequestedeventargs_getdeferral_254836512.md) to request a deferral, the app is removed from the lock screen as soon as the [LockScreenCallUI.EndRequested](lockscreencallui_endrequested.md) event handler returns.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.lockscreencallendrequestedeventargs
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class LockScreenCallEndRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILockScreenCallEndRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILockScreenCallEndRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the deadline by which the app must complete the deferral.
     * @remarks
     * If the deadline passes and the app hasn't called [Complete](lockscreencallendcalldeferral_complete_1807836922.md), the operating system acts as if the deferral completed.
     * 
     * The current deadline is 5 seconds after the user initiates the action that triggers the [LockScreenCallUI.EndRequested](lockscreencallui_endrequested.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.lockscreencallendrequestedeventargs.deadline
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Requests to defer the default behavior of removing the app from the lock screen.
     * @remarks
     * An app can extend its time on the lock screen by calling GetDeferral to request a deferral. If the app requested a deferral, the app is removed from the lock screen when the deferral completes or the deadline passes.
     * @returns {LockScreenCallEndCallDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.lockscreencallendrequestedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ILockScreenCallEndRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILockScreenCallEndRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenCallEndRequestedEventArgs := ILockScreenCallEndRequestedEventArgs(outPtr)
        }

        return this.__ILockScreenCallEndRequestedEventArgs.GetDeferral()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        if (!this.HasProp("__ILockScreenCallEndRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILockScreenCallEndRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenCallEndRequestedEventArgs := ILockScreenCallEndRequestedEventArgs(outPtr)
        }

        return this.__ILockScreenCallEndRequestedEventArgs.get_Deadline()
    }

;@endregion Instance Methods
}
