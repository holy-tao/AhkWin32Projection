#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include Adc\Provider\IAdcControllerProvider.ahk
#Include Pwm\Provider\IPwmControllerProvider.ahk
#Include Gpio\Provider\IGpioControllerProvider.ahk
#Include I2c\Provider\II2cControllerProvider.ahk
#Include Spi\Provider\ISpiControllerProvider.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents properties common to all low level device aggregate providers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.ilowleveldevicesaggregateprovider
 * @namespace Windows.Devices
 * @version WindowsRuntime 1.4
 */
class ILowLevelDevicesAggregateProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILowLevelDevicesAggregateProvider
     * @type {Guid}
     */
    static IID => Guid("{a73e561c-aac1-4ec7-a852-479f7060d01f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AdcControllerProvider", "get_PwmControllerProvider", "get_GpioControllerProvider", "get_I2cControllerProvider", "get_SpiControllerProvider"]

    /**
     * Gets the default ADC provider. If the default provider is not explicitly set, it will fall back to the normal driver/controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.ilowleveldevicesaggregateprovider.adccontrollerprovider
     * @type {IAdcControllerProvider} 
     */
    AdcControllerProvider {
        get => this.get_AdcControllerProvider()
    }

    /**
     * Gets the default PWM provider. If the default provider is not explicitly set, it will fall back to the normal driver/controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.ilowleveldevicesaggregateprovider.pwmcontrollerprovider
     * @type {IPwmControllerProvider} 
     */
    PwmControllerProvider {
        get => this.get_PwmControllerProvider()
    }

    /**
     * Gets the default GPIO provider. If the default provider is not explicitly set, it will fall back to the normal driver/controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.ilowleveldevicesaggregateprovider.gpiocontrollerprovider
     * @type {IGpioControllerProvider} 
     */
    GpioControllerProvider {
        get => this.get_GpioControllerProvider()
    }

    /**
     * Gets the default I<sup>2</sup> C provider. If the default provider is not explicitly set, it will fall back to the normal driver/controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.ilowleveldevicesaggregateprovider.i2ccontrollerprovider
     * @type {II2cControllerProvider} 
     */
    I2cControllerProvider {
        get => this.get_I2cControllerProvider()
    }

    /**
     * Gets the default SPI provider. If the default provider is not explicitly set, it will fall back to the normal driver/controller.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.ilowleveldevicesaggregateprovider.spicontrollerprovider
     * @type {ISpiControllerProvider} 
     */
    SpiControllerProvider {
        get => this.get_SpiControllerProvider()
    }

    /**
     * 
     * @returns {IAdcControllerProvider} 
     */
    get_AdcControllerProvider() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAdcControllerProvider(value)
    }

    /**
     * 
     * @returns {IPwmControllerProvider} 
     */
    get_PwmControllerProvider() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPwmControllerProvider(value)
    }

    /**
     * 
     * @returns {IGpioControllerProvider} 
     */
    get_GpioControllerProvider() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IGpioControllerProvider(value)
    }

    /**
     * 
     * @returns {II2cControllerProvider} 
     */
    get_I2cControllerProvider() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return II2cControllerProvider(value)
    }

    /**
     * 
     * @returns {ISpiControllerProvider} 
     */
    get_SpiControllerProvider() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpiControllerProvider(value)
    }
}
