#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayManagerPathsFailedOrInvalidatedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents arguments for the [PathsFailedOrInvalidated](displaymanager_pathsfailedorinvalidated.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanagerpathsfailedorinvalidatedeventargs
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayManagerPathsFailedOrInvalidatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayManagerPathsFailedOrInvalidatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayManagerPathsFailedOrInvalidatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets a value indicating whether the [PathsFailedOrInvalidated](displaymanager_pathsfailedorinvalidated.md) event has been handled.
     * @remarks
     * This property's value must be set to `true` in order to indicate that the [PathsFailedOrInvalidated](displaymanager_pathsfailedorinvalidated.md) event has been handled. If you fail to handle the **PathsFailedOrInvalidated** event, then the process is forced to exit.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanagerpathsfailedorinvalidatedeventargs.handled
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
        if (!this.HasProp("__IDisplayManagerPathsFailedOrInvalidatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDisplayManagerPathsFailedOrInvalidatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManagerPathsFailedOrInvalidatedEventArgs := IDisplayManagerPathsFailedOrInvalidatedEventArgs(outPtr)
        }

        return this.__IDisplayManagerPathsFailedOrInvalidatedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IDisplayManagerPathsFailedOrInvalidatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDisplayManagerPathsFailedOrInvalidatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManagerPathsFailedOrInvalidatedEventArgs := IDisplayManagerPathsFailedOrInvalidatedEventArgs(outPtr)
        }

        return this.__IDisplayManagerPathsFailedOrInvalidatedEventArgs.put_Handled(value)
    }

    /**
     * A [Deferral](/uwp/api/windows.foundation.deferral) object representing the deferral.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaymanagerpathsfailedorinvalidatedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IDisplayManagerPathsFailedOrInvalidatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDisplayManagerPathsFailedOrInvalidatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayManagerPathsFailedOrInvalidatedEventArgs := IDisplayManagerPathsFailedOrInvalidatedEventArgs(outPtr)
        }

        return this.__IDisplayManagerPathsFailedOrInvalidatedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
