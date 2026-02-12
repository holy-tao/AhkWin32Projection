#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayManagerDisabledEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents arguments for the [Disabled](displaymanager_disabled.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanagerdisabledeventargs
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayManagerDisabledEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayManagerDisabledEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayManagerDisabledEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets a value indicating whether the [Disabled](displaymanager_disabled.md) event has been handled.
     * @remarks
     * This property's value must be set to `true` in order to indicate that the [Disabled](displaymanager_disabled.md) event has been handled. If you fail to handle the **Disabled** event, then the process is forced to exit.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanagerdisabledeventargs.handled
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
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IDisplayManagerDisabledEventArgs")) {
            if ((queryResult := this.QueryInterface(IDisplayManagerDisabledEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManagerDisabledEventArgs := IDisplayManagerDisabledEventArgs(outPtr)
        }

        return this.__IDisplayManagerDisabledEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IDisplayManagerDisabledEventArgs")) {
            if ((queryResult := this.QueryInterface(IDisplayManagerDisabledEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManagerDisabledEventArgs := IDisplayManagerDisabledEventArgs(outPtr)
        }

        return this.__IDisplayManagerDisabledEventArgs.put_Handled(value)
    }

    /**
     * A [Deferral](/uwp/api/windows.foundation.deferral) object representing the deferral.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanagerdisabledeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IDisplayManagerDisabledEventArgs")) {
            if ((queryResult := this.QueryInterface(IDisplayManagerDisabledEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManagerDisabledEventArgs := IDisplayManagerDisabledEventArgs(outPtr)
        }

        return this.__IDisplayManagerDisabledEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
