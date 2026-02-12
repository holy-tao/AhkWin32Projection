#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\II2cController.ahk
#Include .\II2cControllerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the I<sup>2</sup> C controller for the system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2ccontroller
 * @namespace Windows.Devices.I2c
 * @version WindowsRuntime 1.4
 */
class I2cController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => II2cController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => II2cController.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets all the I<sup>2</sup> C controllers that are on the system.
     * @param {II2cProvider} provider The I<sup>2</sup> C provider for the controllers on the system.
     * @returns {IAsyncOperation<IVectorView<I2cController>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2ccontroller.getcontrollersasync
     */
    static GetControllersAsync(provider) {
        if (!I2cController.HasProp("__II2cControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.I2c.I2cController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, II2cControllerStatics.IID)
            I2cController.__II2cControllerStatics := II2cControllerStatics(factoryPtr)
        }

        return I2cController.__II2cControllerStatics.GetControllersAsync(provider)
    }

    /**
     * Gets the default I<sup>2</sup> C controller on the system.
     * @returns {IAsyncOperation<I2cController>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2ccontroller.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!I2cController.HasProp("__II2cControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.I2c.I2cController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, II2cControllerStatics.IID)
            I2cController.__II2cControllerStatics := II2cControllerStatics(factoryPtr)
        }

        return I2cController.__II2cControllerStatics.GetDefaultAsync()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the I<sup>2</sup> C device with the specified settings.
     * @param {I2cConnectionSettings} settings The desired connection settings.
     * @returns {I2cDevice} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.i2ccontroller.getdevice
     */
    GetDevice(settings) {
        if (!this.HasProp("__II2cController")) {
            if ((queryResult := this.QueryInterface(II2cController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__II2cController := II2cController(outPtr)
        }

        return this.__II2cController.GetDevice(settings)
    }

;@endregion Instance Methods
}
