#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGpioPinValueChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data about the [GpioPin.ValueChanged](gpiopin_valuechanged.md) event that occurs when the value of the general-purpose I/O (GPIO) pin changes, either because of an external stimulus when the pin is configured as an input, or when a value is written to the pin when the pin in configured as an output.
 * @remarks
 * GpioPinValueChangedEventArgs is passed to the event handler that you implement for the [GpioPin.ValueChanged](gpiopin_valuechanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiopinvaluechangedeventargs
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class GpioPinValueChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGpioPinValueChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGpioPinValueChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of change that occurred to the value of the general-purpose I/O (GPIO) pin for the [GpioPin.ValueChanged](gpiopin_valuechanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiopinvaluechangedeventargs.edge
     * @type {Integer} 
     */
    Edge {
        get => this.get_Edge()
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
    get_Edge() {
        if (!this.HasProp("__IGpioPinValueChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGpioPinValueChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioPinValueChangedEventArgs := IGpioPinValueChangedEventArgs(outPtr)
        }

        return this.__IGpioPinValueChangedEventArgs.get_Edge()
    }

;@endregion Instance Methods
}
