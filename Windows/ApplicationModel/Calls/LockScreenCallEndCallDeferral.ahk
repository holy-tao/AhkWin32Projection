#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILockScreenCallEndCallDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * The LockScreenCallEndCallDeferral object signals when the app no longer needs to defer the removal of itself from the lock screen.
 * @remarks
 * An app gets a LockScreenCallEndCallDeferral object when it calls the [LockScreenCallEndRequestedEventArgs.GetDeferral](lockscreencallendrequestedeventargs_getdeferral_254836512.md) method to defer the default behavior of removing the app from the lock screen.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.lockscreencallendcalldeferral
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class LockScreenCallEndCallDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILockScreenCallEndCallDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILockScreenCallEndCallDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Completes the deferral of the removal of the app from the lock screen, which causes the app to be removed from the lock screen if it hasn't already been removed by other means.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.lockscreencallendcalldeferral.complete
     */
    Complete() {
        if (!this.HasProp("__ILockScreenCallEndCallDeferral")) {
            if ((queryResult := this.QueryInterface(ILockScreenCallEndCallDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenCallEndCallDeferral := ILockScreenCallEndCallDeferral(outPtr)
        }

        return this.__ILockScreenCallEndCallDeferral.Complete()
    }

;@endregion Instance Methods
}
