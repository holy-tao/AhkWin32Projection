#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILockScreenUnlockingEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the lock screen unlocking events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreenunlockingeventargs
 * @namespace Windows.ApplicationModel.LockScreen
 * @version WindowsRuntime 1.4
 */
class LockScreenUnlockingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILockScreenUnlockingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILockScreenUnlockingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the deadline by which the lock screen app must unlock the device. If your unlocking deferral takes too long, your lock screen app will be terminated by the system and potentially removed as the user’s default lock app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreenunlockingeventargs.deadline
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
     * Gets a [LockScreenUnlockingDeferral](lockscreenunlockingdeferral.md), which defers the unlocking of the device.
     * To show an unlock animation, your lock screen app must:
     * 
     * + Register to be notified of unlocking via the [Unlocking](lockapplicationhost_unlocking.md) event.
     * + In the Unlocking event handler, call GetDeferral.
     * + Kick off an animation.   + When that animation completes, call [Complete](lockscreenunlockingdeferral_complete_1807836922.md) on the deferral to end the deferral.
     *    + Note: If the animation takes too long, your lock screen app will be terminated by the system and potentially removed as the user’s default lock app.
     * @returns {LockScreenUnlockingDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockscreenunlockingeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ILockScreenUnlockingEventArgs")) {
            if ((queryResult := this.QueryInterface(ILockScreenUnlockingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenUnlockingEventArgs := ILockScreenUnlockingEventArgs(outPtr)
        }

        return this.__ILockScreenUnlockingEventArgs.GetDeferral()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        if (!this.HasProp("__ILockScreenUnlockingEventArgs")) {
            if ((queryResult := this.QueryInterface(ILockScreenUnlockingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockScreenUnlockingEventArgs := ILockScreenUnlockingEventArgs(outPtr)
        }

        return this.__ILockScreenUnlockingEventArgs.get_Deadline()
    }

;@endregion Instance Methods
}
