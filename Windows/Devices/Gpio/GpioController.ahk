#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGpioController.ahk
#Include .\IGpioControllerStatics2.ahk
#Include .\IGpioControllerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the default general-purpose I/O (GPIO) controller for the system.
 * @remarks
 * To get a GpioController object, use the [GpioController.GetDefault](gpiocontroller_getdefault_846721868.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiocontroller
 * @namespace Windows.Devices.Gpio
 * @version WindowsRuntime 1.4
 */
class GpioController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGpioController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGpioController.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets all the controllers that are connected to the system asynchronously.
     * @param {IGpioProvider} provider The GPIO provider for the controllers on the system.
     * 
     * > [!NOTE]
     * > For info about providers, see the note at the beginning of the [Windows.Devices.Gpio.Provider](/uwp/api/windows.devices.gpio.provider) namespace topic.
     * @returns {IAsyncOperation<IVectorView<GpioController>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiocontroller.getcontrollersasync
     */
    static GetControllersAsync(provider) {
        if (!GpioController.HasProp("__IGpioControllerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Gpio.GpioController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGpioControllerStatics2.IID)
            GpioController.__IGpioControllerStatics2 := IGpioControllerStatics2(factoryPtr)
        }

        return GpioController.__IGpioControllerStatics2.GetControllersAsync(provider)
    }

    /**
     * Gets the default general-purpose I/O (GPIO) controller for the system.
     * @returns {IAsyncOperation<GpioController>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiocontroller.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!GpioController.HasProp("__IGpioControllerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Gpio.GpioController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGpioControllerStatics2.IID)
            GpioController.__IGpioControllerStatics2 := IGpioControllerStatics2(factoryPtr)
        }

        return GpioController.__IGpioControllerStatics2.GetDefaultAsync()
    }

    /**
     * Gets the default general-purpose I/O (GPIO) controller for the system.
     * @returns {GpioController} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiocontroller.getdefault
     */
    static GetDefault() {
        if (!GpioController.HasProp("__IGpioControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Gpio.GpioController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGpioControllerStatics.IID)
            GpioController.__IGpioControllerStatics := IGpioControllerStatics(factoryPtr)
        }

        return GpioController.__IGpioControllerStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the number of pins on the general-purpose I/O (GPIO) controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiocontroller.pincount
     * @type {Integer} 
     */
    PinCount {
        get => this.get_PinCount()
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
    get_PinCount() {
        if (!this.HasProp("__IGpioController")) {
            if ((queryResult := this.QueryInterface(IGpioController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioController := IGpioController(outPtr)
        }

        return this.__IGpioController.get_PinCount()
    }

    /**
     * Opens the specified general-purpose I/O (GPIO) pin in the specified mode.
     * @remarks
     * **Error Codes:**
     * 
     * **E_INVALIDARG  (0x80070057)**
     * 
     * An invalid parameter was specified. This error will be returned if the pin number is out of range. Pin numbers start at 0 and increase to the maximum pin number, which is one less than the value returned by [GpioController.PinCount](gpiocontroller_pincount.md).
     * 
     * **HRESULT_FROM_WIN32(ERROR_NOT_FOUND) (0x80070490)**
     * 
     * The pin is not available to usermode applications; it is reserved by the system. See the documentation for your circuit board to find out which pins are available to usermode applications.
     * 
     * **HRESULT_FROM_WIN32(ERROR_SHARING_VIOLATION) (0x80070020)**
     * 
     * The pin is currently open in an incompatible sharing mode. For example:
     * 
     * * The pin is already open in **GpioSharingMode.Exclusive** mode.
     * * The pin is already open in **GpioSharingMode.SharedReadOnly** mode when you request to open it in **GpioSharingMode.Exclusive** mode.
     * 
     * **HRESULT_FROM_WIN32(ERROR_GPIO_INCOMPATIBLE_CONNECT_MODE) (0x80073bde)**
     * 
     * The pin is currently muxed to a different function; for example I2C, SPI, or UART. Ensure the pin is not in use by another function.
     * 
     * **HRESULT_FROM_WIN32(ERROR_GEN_FAILURE) (0x8007001f)**
     * 
     * The GPIO driver returned an error. Ensure that the GPIO driver is running and configured correctly.
     * @param {Integer} pinNumber The pin number of the GPIO pin that you want to open. The pin number must be
     * + in range
     * + available to usermode applications
     * 
     * 
     * Pin numbers start at 0, and increase to the maximum pin number, which is one less than the value returned by [GpioController.PinCount](gpiocontroller_pincount.md).
     * 
     * Which pins are available to usermode depends on the circuit board on which the code is running. For information about how pin numbers correspond to physical pins, see the documentation for your circuit board. Pin mappings for boards such as the Raspberry Pi are available at the [IoT developer center](https://developer.microsoft.com/en-us/windows/iot/).
     * @returns {GpioPin} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiocontroller.openpin
     */
    OpenPin(pinNumber) {
        if (!this.HasProp("__IGpioController")) {
            if ((queryResult := this.QueryInterface(IGpioController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioController := IGpioController(outPtr)
        }

        return this.__IGpioController.OpenPin(pinNumber)
    }

    /**
     * Opens a connection to the specified general-purpose I/O (GPIO) pin in exclusive mode.
     * @remarks
     * **Error codes:**
     * 
     * **E_INVALIDARG  (0x80070057)**
     * 
     * An invalid parameter was specified. This error will be returned if the pin number is out of range. Pin numbers start at 0 and increase to the maximum pin number, which is one less than the value returned by [GpioController.PinCount](gpiocontroller_pincount.md).
     * 
     * **HRESULT_FROM_WIN32(ERROR_NOT_FOUND) (0x80070490)**
     * 
     * The pin is not available to usermode applications; it is reserved by the system. See the documentation for your circuit board to find out which pins are available to usermode applications.
     * 
     * **HRESULT_FROM_WIN32(ERROR_SHARING_VIOLATION) (0x80070020)**
     * 
     * The pin is currently open in an incompatible sharing mode. For example:
     * 
     * * The pin is already open in **GpioSharingMode.Exclusive** mode.
     * * The pin is already open in **GpioSharingMode.SharedReadOnly** mode when you request to open it in **GpioSharingMode.Exclusive** mode.
     * 
     * **HRESULT_FROM_WIN32(ERROR_GPIO_INCOMPATIBLE_CONNECT_MODE) (0x80073bde)**
     * 
     * The pin is currently muxed to a different function; for example I2C, SPI, or UART. Ensure the pin is not in use by another function.
     * 
     * **HRESULT_FROM_WIN32(ERROR_GEN_FAILURE) (0x8007001f)**
     * 
     * The GPIO driver returned an error. Ensure that the GPIO driver is running and configured correctly.
     * @param {Integer} pinNumber The pin number of the GPIO pin that you want to open. The pin number must be
     * + in range
     * + available to usermode applications
     * 
     * 
     * Pin numbers start at 0, and increase to the maximum pin number, which is one less than the value returned by [GpioController.PinCount](gpiocontroller_pincount.md).
     * 
     * Which pins are available to usermode depends on the circuit board on which the code is running. For information about how pin numbers correspond to physical pins, see the documentation for your circuit board. Pin mappings for boards such as the Raspberry Pi are available at the [IoT developer center](https://developer.microsoft.com/en-us/windows/iot/).
     * @param {Integer} sharingMode 
     * @returns {GpioPin} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiocontroller.openpin
     */
    OpenPinWithSharingMode(pinNumber, sharingMode) {
        if (!this.HasProp("__IGpioController")) {
            if ((queryResult := this.QueryInterface(IGpioController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioController := IGpioController(outPtr)
        }

        return this.__IGpioController.OpenPinWithSharingMode(pinNumber, sharingMode)
    }

    /**
     * Opens the specified general-purpose I/O (GPIO) pin in the specified mode, and gets a status value that you can use to handle a failure to open the pin programmatically.
     * @param {Integer} pinNumber The pin number of the GPIO pin that you want to open. Some pins may not be available in user mode. For information about how the pin numbers correspond to physical pins, see the documentation for your circuit board.
     * @param {Integer} sharingMode The mode in which you want to open the GPIO pin, which determines whether other connections to the pin can be opened while you have the pin open.
     * @param {Pointer<GpioPin>} pin The opened GPIO pin if the return value is true; otherwise null.
     * @param {Pointer<Int32>} openStatus An enumeration value that indicates either that the attempt to open the GPIO pin succeeded, or the reason that the attempt to open the GPIO pin failed.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.gpio.gpiocontroller.tryopenpin
     */
    TryOpenPin(pinNumber, sharingMode, pin, openStatus) {
        if (!this.HasProp("__IGpioController")) {
            if ((queryResult := this.QueryInterface(IGpioController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGpioController := IGpioController(outPtr)
        }

        return this.__IGpioController.TryOpenPin(pinNumber, sharingMode, pin, openStatus)
    }

;@endregion Instance Methods
}
