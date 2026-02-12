#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\II2cDeviceProvider.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents properties and methods common to all I<sup>2</sup> C controllers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.ii2ccontrollerprovider
 * @namespace Windows.Devices.I2c.Provider
 * @version WindowsRuntime 1.4
 */
class II2cControllerProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for II2cControllerProvider
     * @type {Guid}
     */
    static IID => Guid("{61c2bb82-4510-4163-a87c-4e15a9558980}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceProvider"]

    /**
     * Gets the I<sup>2</sup> C device provider with the specified settings.
     * @param {ProviderI2cConnectionSettings} settings The desired settings.
     * @returns {II2cDeviceProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.ii2ccontrollerprovider.getdeviceprovider
     */
    GetDeviceProvider(settings) {
        result := ComCall(6, this, "ptr", settings, "ptr*", &device := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return II2cDeviceProvider(device)
    }
}
