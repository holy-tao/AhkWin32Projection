#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ProviderSpiConnectionSettings.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents actions common to a device connected through the SPI bus.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.ispideviceprovider
 * @namespace Windows.Devices.Spi.Provider
 * @version WindowsRuntime 1.4
 */
class ISpiDeviceProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpiDeviceProvider
     * @type {Guid}
     */
    static IID => Guid("{0d1c3443-304b-405c-b4f7-f5ab1074461e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_ConnectionSettings", "Write", "Read", "TransferSequential", "TransferFullDuplex"]

    /**
     * Gets the unique ID associated with the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.ispideviceprovider.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Gets the connection settings for the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.ispideviceprovider.connectionsettings
     * @type {ProviderSpiConnectionSettings} 
     */
    ConnectionSettings {
        get => this.get_ConnectionSettings()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ProviderSpiConnectionSettings} 
     */
    get_ConnectionSettings() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ProviderSpiConnectionSettings(value)
    }

    /**
     * Writes to the connected device.
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer Array containing the data to write to the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.ispideviceprovider.write
     */
    Write(buffer_length, buffer) {
        bufferMarshal := buffer is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, "uint", buffer_length, bufferMarshal, buffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reads from the connected device.
     * @param {Pointer<Integer>} buffer_length 
     * @param {Pointer<Pointer<Integer>>} buffer Array containing data read from the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.ispideviceprovider.read
     */
    Read(buffer_length, buffer) {
        buffer_lengthMarshal := buffer_length is VarRef ? "uint*" : "ptr"
        bufferMarshal := buffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, buffer_lengthMarshal, buffer_length, bufferMarshal, buffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Transfer data sequentially to the device.
     * @param {Integer} writeBuffer_length 
     * @param {Pointer<Integer>} writeBuffer Array containing data to write to the device.
     * @param {Pointer<Integer>} readBuffer_length 
     * @param {Pointer<Pointer<Integer>>} readBuffer Array containing data read from the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.ispideviceprovider.transfersequential
     */
    TransferSequential(writeBuffer_length, writeBuffer, readBuffer_length, readBuffer) {
        writeBufferMarshal := writeBuffer is VarRef ? "char*" : "ptr"
        readBuffer_lengthMarshal := readBuffer_length is VarRef ? "uint*" : "ptr"
        readBufferMarshal := readBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, "uint", writeBuffer_length, writeBufferMarshal, writeBuffer, readBuffer_lengthMarshal, readBuffer_length, readBufferMarshal, readBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
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
     * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.provider.ispideviceprovider.transferfullduplex
     */
    TransferFullDuplex(writeBuffer_length, writeBuffer, readBuffer_length, readBuffer) {
        writeBufferMarshal := writeBuffer is VarRef ? "char*" : "ptr"
        readBuffer_lengthMarshal := readBuffer_length is VarRef ? "uint*" : "ptr"
        readBufferMarshal := readBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "uint", writeBuffer_length, writeBufferMarshal, writeBuffer, readBuffer_lengthMarshal, readBuffer_length, readBufferMarshal, readBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
