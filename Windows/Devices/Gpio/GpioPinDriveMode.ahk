#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes whether a general-purpose I/O (GPIO) pin is configured as an input or an output, and how values are driven onto the pin.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiopindrivemode
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class GpioPinDriveMode extends Win32Enum{

    /**
     * Configures the GPIO pin in floating mode, with high impedance.
     * 
     * <img src="images/input_pindrive.png" alt="input pin drive image" />
     * 
     * If you call the [GpioPin.Read](gpiopin_read_431746835.md) method for this pin, the method returns the current state of the pin as driven externally.
     * 
     * If you call the [GpioPin.Write](gpiopin_write_1817827092.md) method, the method sets the latched output value for the pin. The pin takes on this latched output value when the pin is changed to an output.
     * @type {Integer (Int32)}
     */
    static Input => 0

    /**
     * Configures the GPIO pin in strong drive mode, with low impedance.
     * 
     * <img src="images/output_pindrive.PNG" alt="output pin drive image" />
     * 
     * If you call the [GpioPin.Write](gpiopin_write_1817827092.md) method for this pin with a value of **GpioPinValue.High**, the method produces a low-impedance high value for the pin. If you call the [GpioPin.Write](gpiopin_write_1817827092.md) method for this pin with a value of **GpioPinValue.Low**, the method produces a low-impedance low value for the pin.
     * 
     * If you call the [GpioPin.Read](gpiopin_read_431746835.md) method for this pin, the method returns the value previously written to the pin.
     * @type {Integer (Int32)}
     */
    static Output => 1

    /**
     * Configures the GPIO pin as high impedance with a pull-up resistor to the voltage charge connection (VCC).
     * 
     * <img src="images/inputpullup_pindrive.png" alt="input pull up image" />
     * 
     * If you call the [GpioPin.Read](gpiopin_read_431746835.md) method for this pin, the method returns the value previously written to the pin.
     * @type {Integer (Int32)}
     */
    static InputPullUp => 2

    /**
     * Configures the GPIO pin as high impedance with a pull-down resistor to ground.
     * 
     * <img src="images/inputpulldown_pindrive.PNG" alt="input pull down image" />
     * 
     * If you call the [GpioPin.Read](gpiopin_read_431746835.md) method for this pin, the method returns the current value of the pin as driven externally.
     * @type {Integer (Int32)}
     */
    static InputPullDown => 3

    /**
     * Configures the GPIO in open drain mode.
     * 
     * <img src="images/outputopendrain_pindrive.PNG" alt="output open drain image" />
     * 
     * If you call the [GpioPin.Write](gpiopin_write_1817827092.md) method for this pin with a value of **GpioPinValue.Low**, the method drives a value of low to the pin. If you call the [GpioPin.Write](gpiopin_write_1817827092.md) method for this pin with a value of **GpioPinValue.High**, the method places the pin in floating mode.
     * @type {Integer (Int32)}
     */
    static OutputOpenDrain => 4

    /**
     * Configures the GPIO pin in open drain mode with resistive pull-up mode.
     * 
     * <img src="images/outputopendrainpullup_pindrive.PNG" alt="output open drain pull up image" />
     * 
     * If you call the [GpioPin.Write](gpiopin_write_1817827092.md) method for this pin with a value of **GpioPinValue.Low**, the method produces a low-impedance low state. If you call the [GpioPin.Write](gpiopin_write_1817827092.md) method for this pin with a value of **GpioPinValue.High**, the method configures the pin as high impedance with a pull-up resistor to VCC.
     * @type {Integer (Int32)}
     */
    static OutputOpenDrainPullUp => 5

    /**
     * Configures the GPIO pin in open collector mode.
     * 
     * <img src="images/outputopensource_pindrive.PNG" alt="output open source image" />
     * 
     * If you call the [GpioPin.Write](gpiopin_write_1817827092.md) method for this pin with a value of **GpioPinValue.High**, the method drives a value of high onto the pin. If you call the [GpioPin.Write](gpiopin_write_1817827092.md) method for this pin with a value of **GpioPinValue.Low**, the method configures the pin in floating mode.
     * @type {Integer (Int32)}
     */
    static OutputOpenSource => 6

    /**
     * Configures the GPIO pin in open collector mode with resistive pull-down mode.
     * 
     * <img src="images/outputopensourcepulldown_pindrive.PNG" alt="output open source pull down image" />
     * 
     * If you call the [GpioPin.Write](gpiopin_write_1817827092.md) method for this pin with a value of **GpioPinValue.High**, the method drives a value of high onto the pin. If you call the [GpioPin.Write](gpiopin_write_1817827092.md) method for this pin with a value of **GpioPinValue.Low**, the method configures the pin as high impedance with a pull-down resistor to ground.
     * @type {Integer (Int32)}
     */
    static OutputOpenSourcePullDown => 7
}
