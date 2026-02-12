#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ProviderI2cTransferResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents methods common to all I<sup>2</sup> C device providers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.ii2cdeviceprovider
 * @namespace Windows.Devices.I2c.Provider
 * @version WindowsRuntime 1.4
 */
class II2cDeviceProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for II2cDeviceProvider
     * @type {Guid}
     */
    static IID => Guid("{ad342654-57e8-453e-8329-d1e447d103a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "Write", "WritePartial", "Read", "ReadPartial", "WriteRead", "WriteReadPartial"]

    /**
     * Gets the plug and play device identifier of the inter-integrated circuit (I<sup>2</sup> C) bus controller for the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.ii2cdeviceprovider.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
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
     * Writes data to the inter-integrated circuit (I<sup>2</sup> C) bus on which the device is connected.
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer A buffer that contains the data that you want to write to the I<sup>2</sup> C device. This data should not include the bus address.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.ii2cdeviceprovider.write
     */
    Write(buffer_length, buffer) {
        bufferMarshal := buffer is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", buffer_length, bufferMarshal, buffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Writes data to the inter-integrated circuit (I<sup>2</sup> C) bus on which the device is connected, and returns information about the success of the operation that you can use for error handling.
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer A buffer that contains the data that you want to write to the I<sup>2</sup> C device. This data should not include the bus address.
     * @returns {ProviderI2cTransferResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.ii2cdeviceprovider.writepartial
     */
    WritePartial(buffer_length, buffer) {
        bufferMarshal := buffer is VarRef ? "char*" : "ptr"

        result_ := ProviderI2cTransferResult()
        result := ComCall(8, this, "uint", buffer_length, bufferMarshal, buffer, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Reads data from the inter-integrated circuit (I<sup>2</sup> C) bus on which the device is connected into the specified buffer.
     * @param {Pointer<Integer>} buffer_length 
     * @param {Pointer<Pointer<Integer>>} buffer The buffer to which you want to read the data from the I<sup>2</sup> C bus. The length of the buffer determines how much data to request from the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.ii2cdeviceprovider.read
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
     * Reads data from the inter-integrated circuit (I<sup>2</sup> C) bus on which the device is connected into the specified buffer, and returns information about the success of the operation that you can use for error handling.
     * @param {Pointer<Integer>} buffer_length 
     * @param {Pointer<Pointer<Integer>>} buffer The buffer to which you want to read the data from the I<sup>2</sup> C bus. The length of the buffer determines how much data to request from the device.
     * @returns {ProviderI2cTransferResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.ii2cdeviceprovider.readpartial
     */
    ReadPartial(buffer_length, buffer) {
        buffer_lengthMarshal := buffer_length is VarRef ? "uint*" : "ptr"
        bufferMarshal := buffer is VarRef ? "ptr*" : "ptr"

        result_ := ProviderI2cTransferResult()
        result := ComCall(10, this, buffer_lengthMarshal, buffer_length, bufferMarshal, buffer, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Performs an atomic operation to write data to and then read data from the inter-integrated circuit (I<sup>2</sup> C) bus on which the device is connected, and sends a restart condition between the write and read operations.
     * @param {Integer} writeBuffer_length 
     * @param {Pointer<Integer>} writeBuffer A buffer that contains the data that you want to write to the I<sup>2</sup> C device. This data should not include the bus address.
     * @param {Pointer<Integer>} readBuffer_length 
     * @param {Pointer<Pointer<Integer>>} readBuffer The buffer to which you want to read the data from the I<sup>2</sup> C bus. The length of the buffer determines how much data to request from the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.ii2cdeviceprovider.writeread
     */
    WriteRead(writeBuffer_length, writeBuffer, readBuffer_length, readBuffer) {
        writeBufferMarshal := writeBuffer is VarRef ? "char*" : "ptr"
        readBuffer_lengthMarshal := readBuffer_length is VarRef ? "uint*" : "ptr"
        readBufferMarshal := readBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(11, this, "uint", writeBuffer_length, writeBufferMarshal, writeBuffer, readBuffer_lengthMarshal, readBuffer_length, readBufferMarshal, readBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Performs an atomic operation to write data to and then read data from the inter-integrated circuit (I<sup>2</sup> C) bus on which the device is connected, and returns information about the success of the operation that you can use for error handling.
     * @param {Integer} writeBuffer_length 
     * @param {Pointer<Integer>} writeBuffer A buffer that contains the data that you want to write to the I<sup>2</sup> C device. This data should not include the bus address.
     * @param {Pointer<Integer>} readBuffer_length 
     * @param {Pointer<Pointer<Integer>>} readBuffer The buffer to which you want to read the data from the I<sup>2</sup> C bus. The length of the buffer determines how much data to request from the device.
     * @returns {ProviderI2cTransferResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.provider.ii2cdeviceprovider.writereadpartial
     */
    WriteReadPartial(writeBuffer_length, writeBuffer, readBuffer_length, readBuffer) {
        writeBufferMarshal := writeBuffer is VarRef ? "char*" : "ptr"
        readBuffer_lengthMarshal := readBuffer_length is VarRef ? "uint*" : "ptr"
        readBufferMarshal := readBuffer is VarRef ? "ptr*" : "ptr"

        result_ := ProviderI2cTransferResult()
        result := ComCall(12, this, "uint", writeBuffer_length, writeBufferMarshal, writeBuffer, readBuffer_lengthMarshal, readBuffer_length, readBufferMarshal, readBuffer, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
