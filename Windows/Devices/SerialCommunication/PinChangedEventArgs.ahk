#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPinChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the object that is passed as a parameter to the event handler that is invoked when the state of a signal line changes on the serial port.
 * @remarks
 * At times, the state of a signal line can change on the serial port. For example, when the break state is enabled on the serial port causing data transmission to stop. The event is reported by invoking the app-implemented [PinChanged](serialdevice_pinchanged.md) event handler. That event handler's parameter is a PinChangedEventArgs object. Inspect the [PinChange](pinchangedeventargs_pinchange.md) property to determine the type of signal line. Those values are defined in the [SerialPinChange](serialpinchange.md) enumeration.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.pinchangedeventargs
 * @namespace Windows.Devices.SerialCommunication
 * @version WindowsRuntime 1.4
 */
class PinChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPinChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPinChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of signal change that caused the event on the serial port.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.serialcommunication.pinchangedeventargs.pinchange
     * @type {Integer} 
     */
    PinChange {
        get => this.get_PinChange()
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
    get_PinChange() {
        if (!this.HasProp("__IPinChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPinChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPinChangedEventArgs := IPinChangedEventArgs(outPtr)
        }

        return this.__IPinChangedEventArgs.get_PinChange()
    }

;@endregion Instance Methods
}
