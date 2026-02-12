#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the possible results of opening a pin with the [GpioController.TryOpenPin](gpiocontroller_tryopenpin_619900994.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpioopenstatus
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class GpioOpenStatus extends Win32Enum{

    /**
     * The GPIO pin was successfully opened.
     * @type {Integer (Int32)}
     */
    static PinOpened => 0

    /**
     * The pin is reserved by the system and is not available to apps that run in user mode.
     * @type {Integer (Int32)}
     */
    static PinUnavailable => 1

    /**
     * The pin is currently open in an incompatible sharing mode. For example:
     * 
     * 
     * + The pin is already open in **GpioSharingMode.Exclusive** mode.
     * + The pin is already open in **GpioSharingMode.SharedReadOnly** mode when you request to open it in **GpioSharingMode.Exclusive** mode.
     * @type {Integer (Int32)}
     */
    static SharingViolation => 2

    /**
     * The pin is currently opened for a different function, such as **I2c**, **Spi**, or **UART**. Ensure the pin is not in use by another function.
     * @type {Integer (Int32)}
     */
    static MuxingConflict => 3

    /**
     * The pin could not be opened.
     * @type {Integer (Int32)}
     */
    static UnknownError => 4
}
