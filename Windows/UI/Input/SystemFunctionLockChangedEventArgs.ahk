#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemFunctionLockChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [SystemFunctionLockChanged](systembuttoneventcontroller_systemfunctionlockchanged.md) event.
 * @remarks
 * This API is intended for use by Accessibility tools as a low level hook for intercepting events from hardware system buttons.
 * 
 * [SystemButtonEventController](systembuttoneventcontroller.md) event registration applies system wide and is first-come, first-served. If an application or service sets a SystemButtonEventController event Handled property to true, applications or services that registered after that app or service for the same event notification will not receive the notification.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.systemfunctionlockchangedeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class SystemFunctionLockChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemFunctionLockChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemFunctionLockChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the date and time of the [SystemFunctionLockChanged](systembuttoneventcontroller_systemfunctionlockchanged.md) event.
     * @remarks
     * This API is intended for use by Accessibility tools as a low level hook for intercepting events from hardware system buttons.
     * 
     * [SystemButtonEventController](systembuttoneventcontroller.md) event registration applies system wide and is first-come, first-served. If an application or service sets a SystemButtonEventController event Handled property to true, applications or services that registered after that app or service for the same event notification will not receive the notification.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.systemfunctionlockchangedeventargs.timestamp
     * @type {Integer} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the state of the **Fn** hardware system button lock for the [SystemFunctionLockChanged](systembuttoneventcontroller_systemfunctionlockchanged.md) event.
     * @remarks
     * This API is intended for use by Accessibility tools as a low level hook for intercepting events from hardware system buttons.
     * 
     * [SystemButtonEventController](systembuttoneventcontroller.md) event registration applies system wide and is first-come, first-served. If an application or service sets a SystemButtonEventController event Handled property to true, applications or services that registered after that app or service for the same event notification will not receive the notification.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.systemfunctionlockchangedeventargs.islocked
     * @type {Boolean} 
     */
    IsLocked {
        get => this.get_IsLocked()
    }

    /**
     * Gets or sets a value that marks the [SystemFunctionLockChanged](systembuttoneventcontroller_systemfunctionlockchanged.md) event as handled.
     * @remarks
     * This API is intended for use by Accessibility tools as a low level hook for intercepting events from hardware system buttons.
     * 
     * [SystemButtonEventController](systembuttoneventcontroller.md) event registration applies system wide and is first-come, first-served. If an application or service sets a SystemButtonEventController event Handled property to true, applications or services that registered after that app or service for the same event notification will not receive the notification.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.systemfunctionlockchangedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
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
    get_Timestamp() {
        if (!this.HasProp("__ISystemFunctionLockChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISystemFunctionLockChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemFunctionLockChangedEventArgs := ISystemFunctionLockChangedEventArgs(outPtr)
        }

        return this.__ISystemFunctionLockChangedEventArgs.get_Timestamp()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLocked() {
        if (!this.HasProp("__ISystemFunctionLockChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISystemFunctionLockChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemFunctionLockChangedEventArgs := ISystemFunctionLockChangedEventArgs(outPtr)
        }

        return this.__ISystemFunctionLockChangedEventArgs.get_IsLocked()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__ISystemFunctionLockChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISystemFunctionLockChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemFunctionLockChangedEventArgs := ISystemFunctionLockChangedEventArgs(outPtr)
        }

        return this.__ISystemFunctionLockChangedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ISystemFunctionLockChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISystemFunctionLockChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemFunctionLockChangedEventArgs := ISystemFunctionLockChangedEventArgs(outPtr)
        }

        return this.__ISystemFunctionLockChangedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
