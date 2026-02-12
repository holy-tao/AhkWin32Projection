#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILockScreenUnlockingDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an unlock deferral.
  * To show an unlock animation, your lock screen app must:
  * 
  * + Register to be notified of unlocking via the [Unlocking](lockapplicationhost_unlocking.md) event.
  * + In the Unlocking event handler, call [GetDeferral](lockscreenunlockingeventargs_getdeferral_254836512.md).
  * + Kick off an animation.+ When that animation completes, call [Complete](lockscreenunlockingdeferral_complete_1807836922.md) on the deferral to end the deferral.
  * + Note: If the animation takes too long, your lock screen app will be terminated by the system and potentially removed as the user’s default lock app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreenunlockingdeferral
 * @namespace Windows.ApplicationModel.LockScreen
 * @version WindowsRuntime 1.4
 */
class LockScreenUnlockingDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILockScreenUnlockingDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILockScreenUnlockingDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Notifies the system that your deferral is complete. If your deferral takes too long to complete, your lock screen app will be terminated by the system and potentially removed as the user’s default lock app.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreenunlockingdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__ILockScreenUnlockingDeferral")) {
            if ((queryResult := this.QueryInterface(ILockScreenUnlockingDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenUnlockingDeferral := ILockScreenUnlockingDeferral(outPtr)
        }

        return this.__ILockScreenUnlockingDeferral.Complete()
    }

;@endregion Instance Methods
}
