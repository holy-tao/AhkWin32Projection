#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGpioPin.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\GpioPin.ahk
#Include .\GpioPinValueChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a general-purpose I/O (GPIO) pin.
 * @remarks
 * To get a GpioPin object, use the [GpioController.OpenPin](gpiocontroller_openpin_1000658948.md) or [GpioController.TryOpenPin](gpiocontroller_tryopenpin_619900994.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiopin
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class GpioPin extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGpioPin

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGpioPin.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the debounce timeout for the general-purpose I/O (GPIO) pin, which is an interval during which changes to the value of the pin are filtered out, and do not generate [ValueChanged](gpiopin_valuechanged.md) events.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiopin.debouncetimeout
     * @type {TimeSpan} 
     */
    DebounceTimeout {
        get => this.get_DebounceTimeout()
        set => this.put_DebounceTimeout(value)
    }

    /**
     * Gets the pin number of the general-purpose I/O (GPIO) pin.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiopin.pinnumber
     * @type {Integer} 
     */
    PinNumber {
        get => this.get_PinNumber()
    }

    /**
     * Gets the sharing mode in which the general-purpose I/O (GPIO) pin is open.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiopin.sharingmode
     * @type {Integer} 
     */
    SharingMode {
        get => this.get_SharingMode()
    }

    /**
     * Occurs when the value of the general-purpose I/O (GPIO) pin changes, either because of an external stimulus when the pin is configured as an input, or when a value is written to the pin when the pin is configured as an output.
     * @type {TypedEventHandler<GpioPin, GpioPinValueChangedEventArgs>}
    */
    OnValueChanged {
        get {
            if(!this.HasProp("__OnValueChanged")){
                this.__OnValueChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{44ba689b-7d42-5374-add9-ab41e877a34b}"),
                    GpioPin,
                    GpioPinValueChangedEventArgs
                )
                this.__OnValueChangedToken := this.add_ValueChanged(this.__OnValueChanged.iface)
            }
            return this.__OnValueChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnValueChangedToken")) {
            this.remove_ValueChanged(this.__OnValueChangedToken)
            this.__OnValueChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<GpioPin, GpioPinValueChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ValueChanged(handler) {
        if (!this.HasProp("__IGpioPin")) {
            if ((queryResult := this.QueryInterface(IGpioPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioPin := IGpioPin(outPtr)
        }

        return this.__IGpioPin.add_ValueChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ValueChanged(token) {
        if (!this.HasProp("__IGpioPin")) {
            if ((queryResult := this.QueryInterface(IGpioPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioPin := IGpioPin(outPtr)
        }

        return this.__IGpioPin.remove_ValueChanged(token)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DebounceTimeout() {
        if (!this.HasProp("__IGpioPin")) {
            if ((queryResult := this.QueryInterface(IGpioPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioPin := IGpioPin(outPtr)
        }

        return this.__IGpioPin.get_DebounceTimeout()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DebounceTimeout(value) {
        if (!this.HasProp("__IGpioPin")) {
            if ((queryResult := this.QueryInterface(IGpioPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioPin := IGpioPin(outPtr)
        }

        return this.__IGpioPin.put_DebounceTimeout(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PinNumber() {
        if (!this.HasProp("__IGpioPin")) {
            if ((queryResult := this.QueryInterface(IGpioPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioPin := IGpioPin(outPtr)
        }

        return this.__IGpioPin.get_PinNumber()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SharingMode() {
        if (!this.HasProp("__IGpioPin")) {
            if ((queryResult := this.QueryInterface(IGpioPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioPin := IGpioPin(outPtr)
        }

        return this.__IGpioPin.get_SharingMode()
    }

    /**
     * Gets whether the general-purpose I/O (GPIO) pin supports the specified drive mode.
     * @param {Integer} driveMode The drive mode that you want to check for support.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiopin.isdrivemodesupported
     */
    IsDriveModeSupported(driveMode) {
        if (!this.HasProp("__IGpioPin")) {
            if ((queryResult := this.QueryInterface(IGpioPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioPin := IGpioPin(outPtr)
        }

        return this.__IGpioPin.IsDriveModeSupported(driveMode)
    }

    /**
     * Gets the current drive mode for the general-purpose I/O (GPIO) pin. The drive mode specifies whether the pin is configured as an input or an output, and determines how values are driven onto the pin.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiopin.getdrivemode
     */
    GetDriveMode() {
        if (!this.HasProp("__IGpioPin")) {
            if ((queryResult := this.QueryInterface(IGpioPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioPin := IGpioPin(outPtr)
        }

        return this.__IGpioPin.GetDriveMode()
    }

    /**
     * Sets the drive mode of the general-purpose I/O (GPIO) pin. The drive mode specifies whether the pin is configured as an input or an output, and determines how values are driven onto the pin.
     * @remarks
     * The following exceptions can be thrown by this method:
     * @param {Integer} value An enumeration value that specifies drive mode to use for the GPIO pin. The drive mode specifies whether the pin is configured as an input or an output, and determines how values are driven onto the pin.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiopin.setdrivemode
     */
    SetDriveMode(value) {
        if (!this.HasProp("__IGpioPin")) {
            if ((queryResult := this.QueryInterface(IGpioPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioPin := IGpioPin(outPtr)
        }

        return this.__IGpioPin.SetDriveMode(value)
    }

    /**
     * Drives the specified value onto the general purpose I/O (GPIO) pin according to the current drive mode for the pin if the pin is configured as an output, or updates the latched output value for the pin if the pin is configured as an input.
     * @remarks
     * The following exceptions can be thrown by this method:
     * @param {Integer} value The enumeration value to write to the GPIO pin.
     * 
     * If the GPIO pin is configured as an output, the method drives the specified value onto the pin according to the current drive mode for the pin.
     * 
     * If the GPIO pin is configured as an input, the method updates the latched output value for the pin. The latched output value is driven onto the pin when the configuration for the pin changes to output.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiopin.write
     */
    Write(value) {
        if (!this.HasProp("__IGpioPin")) {
            if ((queryResult := this.QueryInterface(IGpioPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioPin := IGpioPin(outPtr)
        }

        return this.__IGpioPin.Write(value)
    }

    /**
     * Reads the current value of the general-purpose I/O (GPIO) pin.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiopin.read
     */
    Read() {
        if (!this.HasProp("__IGpioPin")) {
            if ((queryResult := this.QueryInterface(IGpioPin.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioPin := IGpioPin(outPtr)
        }

        return this.__IGpioPin.Read()
    }

    /**
     * Closes the general-purpose I/O (GPIO) pin and releases the resources associated with it.
     * @remarks
     * You cannot call [Close](../windows.foundation/iclosable_close_811482585.md) methods through Visual C++ component extensions (C++/CX) on Windows Runtime class instances where the class implemented [IClosable](../windows.foundation/iclosable.md). Instead, Visual C++ component extensions (C++/CX) code for runtime classes should call the destructor or set the last reference to **null**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiopin.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
