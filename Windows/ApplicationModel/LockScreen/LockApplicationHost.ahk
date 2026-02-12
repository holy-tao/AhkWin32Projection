#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILockApplicationHost.ahk
#Include .\ILockApplicationHostStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\LockApplicationHost.ahk
#Include .\LockScreenUnlockingEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Allows the lock screen app to request that the device unlocks, and allows the app to register to be notified when the device begins to unlock.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockapplicationhost
 * @namespace Windows.ApplicationModel.LockScreen
 * @version WindowsRuntime 1.4
 */
class LockApplicationHost extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILockApplicationHost

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILockApplicationHost.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a [LockApplicationHost](lockapplicationhost.md) object.
     * @returns {LockApplicationHost} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockapplicationhost.getforcurrentview
     */
    static GetForCurrentView() {
        if (!LockApplicationHost.HasProp("__ILockApplicationHostStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.LockScreen.LockApplicationHost")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILockApplicationHostStatics.IID)
            LockApplicationHost.__ILockApplicationHostStatics := ILockApplicationHostStatics(factoryPtr)
        }

        return LockApplicationHost.__ILockApplicationHostStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnUnlockingToken")) {
            this.remove_Unlocking(this.__OnUnlockingToken)
            this.__OnUnlocking.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Requests that the device unlocks.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.lockscreen.lockapplicationhost.requestunlock
     */
    RequestUnlock() {
        if (!this.HasProp("__ILockApplicationHost")) {
            if ((queryResult := this.QueryInterface(ILockApplicationHost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockApplicationHost := ILockApplicationHost(outPtr)
        }

        return this.__ILockApplicationHost.RequestUnlock()
    }

    /**
     * 
     * @param {TypedEventHandler<LockApplicationHost, LockScreenUnlockingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Unlocking(handler) {
        if (!this.HasProp("__ILockApplicationHost")) {
            if ((queryResult := this.QueryInterface(ILockApplicationHost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockApplicationHost := ILockApplicationHost(outPtr)
        }

        return this.__ILockApplicationHost.add_Unlocking(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Unlocking(token) {
        if (!this.HasProp("__ILockApplicationHost")) {
            if ((queryResult := this.QueryInterface(ILockApplicationHost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILockApplicationHost := ILockApplicationHost(outPtr)
        }

        return this.__ILockApplicationHost.remove_Unlocking(token)
    }

;@endregion Instance Methods
}
