#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayManagerEnabledEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents arguments for the [Enabled](displaymanager_enabled.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanagerenabledeventargs
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayManagerEnabledEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayManagerEnabledEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayManagerEnabledEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets a value indicating whether the [Enabled](displaymanager_enabled.md) event has been handled.
     * @remarks
     * This property's value must be set to `true` in order to indicate that the [Enabled](displaymanager_enabled.md) event has been handled. If you fail to handle the **Enabled** event, then the process is forced to exit.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanagerenabledeventargs.handled
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
        if (!this.HasProp("__IDisplayManagerEnabledEventArgs")) {
            if ((queryResult := this.QueryInterface(IDisplayManagerEnabledEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManagerEnabledEventArgs := IDisplayManagerEnabledEventArgs(outPtr)
        }

        return this.__IDisplayManagerEnabledEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IDisplayManagerEnabledEventArgs")) {
            if ((queryResult := this.QueryInterface(IDisplayManagerEnabledEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManagerEnabledEventArgs := IDisplayManagerEnabledEventArgs(outPtr)
        }

        return this.__IDisplayManagerEnabledEventArgs.put_Handled(value)
    }

    /**
     * A [Deferral](/uwp/api/windows.foundation.deferral) object representing the deferral.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanagerenabledeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IDisplayManagerEnabledEventArgs")) {
            if ((queryResult := this.QueryInterface(IDisplayManagerEnabledEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManagerEnabledEventArgs := IDisplayManagerEnabledEventArgs(outPtr)
        }

        return this.__IDisplayManagerEnabledEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
