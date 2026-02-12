#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpiDevice.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ISpiDeviceStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a device connected through the SPI bus.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spidevice
 * @namespace Windows.Devices.Spi
 * @version WindowsRuntime 1.4
 */
class SpiDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpiDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpiDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets all the SPI buses found on the system that match the input parameter.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spidevice.getdeviceselector
     */
    static GetDeviceSelector() {
        if (!SpiDevice.HasProp("__ISpiDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Spi.SpiDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpiDeviceStatics.IID)
            SpiDevice.__ISpiDeviceStatics := ISpiDeviceStatics(factoryPtr)
        }

        return SpiDevice.__ISpiDeviceStatics.GetDeviceSelector()
    }

    /**
     * Gets all the SPI buses found on the system.
     * @param {HSTRING} friendlyName 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spidevice.getdeviceselector
     */
    static GetDeviceSelectorFromFriendlyName(friendlyName) {
        if (!SpiDevice.HasProp("__ISpiDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Spi.SpiDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpiDeviceStatics.IID)
            SpiDevice.__ISpiDeviceStatics := ISpiDeviceStatics(factoryPtr)
        }

        return SpiDevice.__ISpiDeviceStatics.GetDeviceSelectorFromFriendlyName(friendlyName)
    }

    /**
     * Retrieves the info about a certain bus.
     * @param {HSTRING} busId The id of the bus.
     * @returns {SpiBusInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spidevice.getbusinfo
     */
    static GetBusInfo(busId) {
        if (!SpiDevice.HasProp("__ISpiDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Spi.SpiDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpiDeviceStatics.IID)
            SpiDevice.__ISpiDeviceStatics := ISpiDeviceStatics(factoryPtr)
        }

        return SpiDevice.__ISpiDeviceStatics.GetBusInfo(busId)
    }

    /**
     * Opens a device with the connection settings provided.
     * @param {HSTRING} busId The id of the bus.
     * @param {SpiConnectionSettings} settings The connection settings.
     * @returns {IAsyncOperation<SpiDevice>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spidevice.fromidasync
     */
    static FromIdAsync(busId, settings) {
        if (!SpiDevice.HasProp("__ISpiDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Spi.SpiDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpiDeviceStatics.IID)
            SpiDevice.__ISpiDeviceStatics := ISpiDeviceStatics(factoryPtr)
        }

        return SpiDevice.__ISpiDeviceStatics.FromIdAsync(busId, settings)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the unique ID associated with the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spidevice.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the connection settings for the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spidevice.connectionsettings
     * @type {SpiConnectionSettings} 
     */
    ConnectionSettings {
        get => this.get_ConnectionSettings()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__ISpiDevice")) {
            if ((queryResult := this.QueryInterface(ISpiDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiDevice := ISpiDevice(outPtr)
        }

        return this.__ISpiDevice.get_DeviceId()
    }

    /**
     * 
     * @returns {SpiConnectionSettings} 
     */
    get_ConnectionSettings() {
        if (!this.HasProp("__ISpiDevice")) {
            if ((queryResult := this.QueryInterface(ISpiDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiDevice := ISpiDevice(outPtr)
        }

        return this.__ISpiDevice.get_ConnectionSettings()
    }

    /**
     * Writes to the connected device.
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer Array containing the data to write to the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spidevice.write
     */
    Write(buffer_length, buffer) {
        if (!this.HasProp("__ISpiDevice")) {
            if ((queryResult := this.QueryInterface(ISpiDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiDevice := ISpiDevice(outPtr)
        }

        return this.__ISpiDevice.Write(buffer_length, buffer)
    }

    /**
     * Reads from the connected device.
     * @param {Pointer<Integer>} buffer_length 
     * @param {Pointer<Pointer<Integer>>} buffer Array containing data read from the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spidevice.read
     */
    Read(buffer_length, buffer) {
        if (!this.HasProp("__ISpiDevice")) {
            if ((queryResult := this.QueryInterface(ISpiDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiDevice := ISpiDevice(outPtr)
        }

        return this.__ISpiDevice.Read(buffer_length, buffer)
    }

    /**
     * Transfer data sequentially to the device.
     * @param {Integer} writeBuffer_length 
     * @param {Pointer<Integer>} writeBuffer Array containing data to write to the device.
     * @param {Pointer<Integer>} readBuffer_length 
     * @param {Pointer<Pointer<Integer>>} readBuffer Array containing data read from the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spidevice.transfersequential
     */
    TransferSequential(writeBuffer_length, writeBuffer, readBuffer_length, readBuffer) {
        if (!this.HasProp("__ISpiDevice")) {
            if ((queryResult := this.QueryInterface(ISpiDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiDevice := ISpiDevice(outPtr)
        }

        return this.__ISpiDevice.TransferSequential(writeBuffer_length, writeBuffer, readBuffer_length, readBuffer)
    }

    /**
     * Transfer data using a full duplex communication system. Full duplex allows both the host and the peripheral to communicate simultaneously.
     * 
     * For definitions of *host* and *peripheral*, see [Windows.Devices.Spi namespace](/uwp/api/windows.devices.spi).
     * @param {Integer} writeBuffer_length 
     * @param {Pointer<Integer>} writeBuffer Array containing data to write to the device.
     * @param {Pointer<Integer>} readBuffer_length 
     * @param {Pointer<Pointer<Integer>>} readBuffer Array containing data read from the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spidevice.transferfullduplex
     */
    TransferFullDuplex(writeBuffer_length, writeBuffer, readBuffer_length, readBuffer) {
        if (!this.HasProp("__ISpiDevice")) {
            if ((queryResult := this.QueryInterface(ISpiDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpiDevice := ISpiDevice(outPtr)
        }

        return this.__ISpiDevice.TransferFullDuplex(writeBuffer_length, writeBuffer, readBuffer_length, readBuffer)
    }

    /**
     * Closes the connection to the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.spidevice.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
