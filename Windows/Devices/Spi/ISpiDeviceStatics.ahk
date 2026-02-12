#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SpiBusInfo.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\SpiDevice.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents SPI device statistics common to SPI devices.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.ispidevicestatics
 * @namespace Windows.Devices.Spi
 * @version WindowsRuntime 1.4
 */
class ISpiDeviceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpiDeviceStatics
     * @type {Guid}
     */
    static IID => Guid("{a278e559-5720-4d3f-bd93-56f5ff5a5879}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSelector", "GetDeviceSelectorFromFriendlyName", "GetBusInfo", "FromIdAsync"]

    /**
     * Gets all the SPI buses found on the system that match the input parameter.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.ispidevicestatics.getdeviceselector
     */
    GetDeviceSelector() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Gets all the SPI buses found on the system.
     * @param {HSTRING} friendlyName 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.ispidevicestatics.getdeviceselector
     */
    GetDeviceSelectorFromFriendlyName(friendlyName) {
        if(friendlyName is String) {
            pin := HSTRING.Create(friendlyName)
            friendlyName := pin.Value
        }
        friendlyName := friendlyName is Win32Handle ? NumGet(friendlyName, "ptr") : friendlyName

        value := HSTRING()
        result := ComCall(7, this, "ptr", friendlyName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves the info about a certain bus.
     * @param {HSTRING} busId The id of the bus.
     * @returns {SpiBusInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.ispidevicestatics.getbusinfo
     */
    GetBusInfo(busId) {
        if(busId is String) {
            pin := HSTRING.Create(busId)
            busId := pin.Value
        }
        busId := busId is Win32Handle ? NumGet(busId, "ptr") : busId

        result := ComCall(8, this, "ptr", busId, "ptr*", &busInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpiBusInfo(busInfo)
    }

    /**
     * Opens a device with the connection settings provided.
     * @param {HSTRING} busId The id of the bus.
     * @param {SpiConnectionSettings} settings The connection settings.
     * @returns {IAsyncOperation<SpiDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.ispidevicestatics.fromidasync
     */
    FromIdAsync(busId, settings) {
        if(busId is String) {
            pin := HSTRING.Create(busId)
            busId := pin.Value
        }
        busId := busId is Win32Handle ? NumGet(busId, "ptr") : busId

        result := ComCall(9, this, "ptr", busId, "ptr", settings, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SpiDevice, operation)
    }
}
