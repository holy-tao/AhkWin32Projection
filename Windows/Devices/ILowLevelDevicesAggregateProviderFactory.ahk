#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\LowLevelDevicesAggregateProvider.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices
 * @version WindowsRuntime 1.4
 */
class ILowLevelDevicesAggregateProviderFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILowLevelDevicesAggregateProviderFactory
     * @type {Guid}
     */
    static IID => Guid("{9ac4aaf6-3473-465e-96d5-36281a2c57af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {IAdcControllerProvider} adc 
     * @param {IPwmControllerProvider} pwm 
     * @param {IGpioControllerProvider} gpio 
     * @param {II2cControllerProvider} i2c 
     * @param {ISpiControllerProvider} spi 
     * @returns {LowLevelDevicesAggregateProvider} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(adc, pwm, gpio, i2c, spi) {
        result := ComCall(6, this, "ptr", adc, "ptr", pwm, "ptr", gpio, "ptr", i2c, "ptr", spi, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LowLevelDevicesAggregateProvider(value)
    }
}
