#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILowLevelDevicesAggregateProvider.ahk
#Include .\ILowLevelDevicesAggregateProviderFactory.ahk
#Include ..\..\Guid.ahk

/**
 * Represents the low level bus device providers. This class gives access to the default provider for the low level bus controllers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lowleveldevicesaggregateprovider
 * @namespace Windows.Devices
 * @version WindowsRuntime 1.4
 */
class LowLevelDevicesAggregateProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILowLevelDevicesAggregateProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILowLevelDevicesAggregateProvider.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [LowLevelDevicesAggregateProvider](lowleveldevicesaggregateprovider.md) and sets the supplied providers as defaults for the respective bus.
     * @param {IAdcControllerProvider} adc The ADC provider.
     * @param {IPwmControllerProvider} pwm The PWM provider.
     * @param {IGpioControllerProvider} gpio The GPIO provider.
     * @param {II2cControllerProvider} i2c The I<sup>2</sup> C provider.
     * @param {ISpiControllerProvider} spi The SPI provider.
     * @returns {LowLevelDevicesAggregateProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lowleveldevicesaggregateprovider.#ctor
     */
    static Create(adc, pwm, gpio, i2c, spi) {
        if (!LowLevelDevicesAggregateProvider.HasProp("__ILowLevelDevicesAggregateProviderFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.LowLevelDevicesAggregateProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILowLevelDevicesAggregateProviderFactory.IID)
            LowLevelDevicesAggregateProvider.__ILowLevelDevicesAggregateProviderFactory := ILowLevelDevicesAggregateProviderFactory(factoryPtr)
        }

        return LowLevelDevicesAggregateProvider.__ILowLevelDevicesAggregateProviderFactory.Create(adc, pwm, gpio, i2c, spi)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the default ADC provider. If the default provider is not explicitly set, it will fall back to the normal driver/controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lowleveldevicesaggregateprovider.adccontrollerprovider
     * @type {IAdcControllerProvider} 
     */
    AdcControllerProvider {
        get => this.get_AdcControllerProvider()
    }

    /**
     * Gets the default PWM provider. If the default provider is not explicitly set, it will fall back to the normal driver/controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lowleveldevicesaggregateprovider.pwmcontrollerprovider
     * @type {IPwmControllerProvider} 
     */
    PwmControllerProvider {
        get => this.get_PwmControllerProvider()
    }

    /**
     * Gets the default GPIO provider. If the default provider is not explicitly set, it will fall back to the normal driver/controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lowleveldevicesaggregateprovider.gpiocontrollerprovider
     * @type {IGpioControllerProvider} 
     */
    GpioControllerProvider {
        get => this.get_GpioControllerProvider()
    }

    /**
     * Gets the default I<sup>2</sup> C provider. If the default provider is not explicitly set, it will fall back to the normal driver/controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lowleveldevicesaggregateprovider.i2ccontrollerprovider
     * @type {II2cControllerProvider} 
     */
    I2cControllerProvider {
        get => this.get_I2cControllerProvider()
    }

    /**
     * Gets the default SPI provider. If the default provider is not explicitly set, it will fall back to the normal driver/controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lowleveldevicesaggregateprovider.spicontrollerprovider
     * @type {ISpiControllerProvider} 
     */
    SpiControllerProvider {
        get => this.get_SpiControllerProvider()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IAdcControllerProvider} 
     */
    get_AdcControllerProvider() {
        if (!this.HasProp("__ILowLevelDevicesAggregateProvider")) {
            if ((queryResult := this.QueryInterface(ILowLevelDevicesAggregateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLevelDevicesAggregateProvider := ILowLevelDevicesAggregateProvider(outPtr)
        }

        return this.__ILowLevelDevicesAggregateProvider.get_AdcControllerProvider()
    }

    /**
     * 
     * @returns {IPwmControllerProvider} 
     */
    get_PwmControllerProvider() {
        if (!this.HasProp("__ILowLevelDevicesAggregateProvider")) {
            if ((queryResult := this.QueryInterface(ILowLevelDevicesAggregateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLevelDevicesAggregateProvider := ILowLevelDevicesAggregateProvider(outPtr)
        }

        return this.__ILowLevelDevicesAggregateProvider.get_PwmControllerProvider()
    }

    /**
     * 
     * @returns {IGpioControllerProvider} 
     */
    get_GpioControllerProvider() {
        if (!this.HasProp("__ILowLevelDevicesAggregateProvider")) {
            if ((queryResult := this.QueryInterface(ILowLevelDevicesAggregateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLevelDevicesAggregateProvider := ILowLevelDevicesAggregateProvider(outPtr)
        }

        return this.__ILowLevelDevicesAggregateProvider.get_GpioControllerProvider()
    }

    /**
     * 
     * @returns {II2cControllerProvider} 
     */
    get_I2cControllerProvider() {
        if (!this.HasProp("__ILowLevelDevicesAggregateProvider")) {
            if ((queryResult := this.QueryInterface(ILowLevelDevicesAggregateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLevelDevicesAggregateProvider := ILowLevelDevicesAggregateProvider(outPtr)
        }

        return this.__ILowLevelDevicesAggregateProvider.get_I2cControllerProvider()
    }

    /**
     * 
     * @returns {ISpiControllerProvider} 
     */
    get_SpiControllerProvider() {
        if (!this.HasProp("__ILowLevelDevicesAggregateProvider")) {
            if ((queryResult := this.QueryInterface(ILowLevelDevicesAggregateProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILowLevelDevicesAggregateProvider := ILowLevelDevicesAggregateProvider(outPtr)
        }

        return this.__ILowLevelDevicesAggregateProvider.get_SpiControllerProvider()
    }

;@endregion Instance Methods
}
