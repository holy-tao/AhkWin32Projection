#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpiDeviceProvider.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents actions common to all SPI controllers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.ispicontrollerprovider
 * @namespace Windows.Devices.Spi.Provider
 * @version WindowsRuntime 1.4
 */
class ISpiControllerProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpiControllerProvider
     * @type {Guid}
     */
    static IID => Guid("{c1686504-02ce-4226-a385-4f11fb04b41b}")

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
     * Gets the SPI device with the specified settings.
     * @param {ProviderSpiConnectionSettings} settings The desired connection settings.
     * @returns {ISpiDeviceProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.ispicontrollerprovider.getdeviceprovider
     */
    GetDeviceProvider(settings) {
        result := ComCall(6, this, "ptr", settings, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpiDeviceProvider(result_)
    }
}
