#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpiController.ahk
#Include .\ISpiControllerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the SPI controller on the system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spicontroller
 * @namespace Windows.Devices.Spi
 * @version WindowsRuntime 1.4
 */
class SpiController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpiController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpiController.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the default SPI controller on the system.
     * @returns {IAsyncOperation<SpiController>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spicontroller.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!SpiController.HasProp("__ISpiControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Spi.SpiController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpiControllerStatics.IID)
            SpiController.__ISpiControllerStatics := ISpiControllerStatics(factoryPtr)
        }

        return SpiController.__ISpiControllerStatics.GetDefaultAsync()
    }

    /**
     * Gets all the SPI controllers that are on the system.
     * @param {ISpiProvider} provider The SPI provider for the controllers on the system.
     * @returns {IAsyncOperation<IVectorView<SpiController>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spicontroller.getcontrollersasync
     */
    static GetControllersAsync(provider) {
        if (!SpiController.HasProp("__ISpiControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Spi.SpiController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpiControllerStatics.IID)
            SpiController.__ISpiControllerStatics := ISpiControllerStatics(factoryPtr)
        }

        return SpiController.__ISpiControllerStatics.GetControllersAsync(provider)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the SPI device with the specified settings.
     * @param {SpiConnectionSettings} settings The desired connection settings.
     * @returns {SpiDevice} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spicontroller.getdevice
     */
    GetDevice(settings) {
        if (!this.HasProp("__ISpiController")) {
            if ((queryResult := this.QueryInterface(ISpiController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiController := ISpiController(outPtr)
        }

        return this.__ISpiController.GetDevice(settings)
    }

;@endregion Instance Methods
}
