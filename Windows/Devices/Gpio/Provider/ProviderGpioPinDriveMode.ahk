#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes whether a general-purpose I/O (GPIO) pin is configured as an input or an output, and how values are driven onto the pin.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.provider.providergpiopindrivemode
 * @namespace Windows.Devices.Gpio.Provider
 * @version WindowsRuntime 1.4
 */
class ProviderGpioPinDriveMode extends Win32Enum{

    /**
     * Configures the GPIO pin in floating mode, with high impedance.
     * 
     * If you call the [IGpioPinProvider.Read](igpiopinprovider_read_431746835.md) method for this pin, the method returns the current state of the pin as driven externally.
     * 
     * If you call the [IGpioPinProvider.Write](igpiopinprovider_write_961135172.md) method, the method sets the latched output value for the pin. The pin takes on this latched output value when the pin is changed to an output.
     * @type {Integer (Int32)}
     */
    static Input => 0

    /**
     * Configures the GPIO pin in strong drive mode, with low impedance.
     * 
     * If you call the [IGpioPinProvider.Write](igpiopinprovider_write_961135172.md) method for this pin with a value of **ProviderGpioPinValue.High**, the method produces a low-impedance high value for the pin. If you call the [IGpioPinProvider.Write](igpiopinprovider_write_961135172.md) method for this pin with a value of **ProviderGpioPinValue.Low**, the method produces a low-impedance low value for the pin.
     * 
     * If you call the [IGpioPinProvider.Read](igpiopinprovider_read_431746835.md) method for this pin, the method returns the value previously written to the pin.
     * @type {Integer (Int32)}
     */
    static Output => 1

    /**
     * Configures the GPIO pin as high impedance with a pull-up resistor to the voltage charge connection (VCC).
     * 
     * If you call the [IGpioPinProvider.Read](igpiopinprovider_read_431746835.md) method for this pin, the method returns the value previously written to the pin.
     * @type {Integer (Int32)}
     */
    static InputPullUp => 2

    /**
     * Configures the GPIO pin as high impedance with a pull-down resistor to ground.
     * 
     * If you call the [IGpioPinProvider.Read](igpiopinprovider_read_431746835.md) method for this pin, the method returns the current value of the pin as driven externally.
     * @type {Integer (Int32)}
     */
    static InputPullDown => 3

    /**
     * Configures the GPIO in open drain mode.
     * 
     * If you call the [IGpioPinProvider.Write](igpiopinprovider_write_961135172.md) method for this pin with a value of **ProviderGpioPinValue.Low**, the method drives a value of low to the pin. If you call the [IGpioPinProvider.Write](igpiopinprovider_write_961135172.md) method for this pin with a value of **ProviderGpioPinValue.High**, the method places the pin in floating mode.
     * @type {Integer (Int32)}
     */
    static OutputOpenDrain => 4

    /**
     * Configures the GPIO pin in open drain mode with resistive pull-up mode.
     * 
     * If you call the [IGpioPinProvider.Write](igpiopinprovider_write_961135172.md) method for this pin with a value of **ProviderGpioPinValue.Low**, the method produces a low-impedance low state. If you call the [IGpioPinProvider.Write](igpiopinprovider_write_961135172.md) method for this pin with a value of **ProviderGpioPinValue.High**, the method configures the pin as high impedance with a pull-up resistor to VCC.
     * @type {Integer (Int32)}
     */
    static OutputOpenDrainPullUp => 5

    /**
     * Configures the GPIO pin in open collector mode.
     * 
     * If you call the [IGpioPinProvider.Write](igpiopinprovider_write_961135172.md) method for this pin with a value of **ProviderGpioPinValue.High**, the method drives a value of high onto the pin. If you call the [IGpioPinProvider.Write](igpiopinprovider_write_961135172.md) method for this pin with a value of **ProviderGpioPinValue.Low**, the method configures the pin in floating mode.
     * @type {Integer (Int32)}
     */
    static OutputOpenSource => 6

    /**
     * Configures the GPIO pin in open collector mode with resistive pull-down mode.
     * 
     * If you call the [IGpioPinProvider.Write](igpiopinprovider_write_961135172.md) method for this pin with a value of **ProviderGpioPinValue.High**, the method drives a value of high onto the pin. If you call the [IGpioPinProvider.Write](igpiopinprovider_write_961135172.md) method for this pin with a value of **ProviderGpioPinValue.Low**, the method configures the pin as high impedance with a pull-down resistor to ground.
     * @type {Integer (Int32)}
     */
    static OutputOpenSourcePullDown => 7
}
