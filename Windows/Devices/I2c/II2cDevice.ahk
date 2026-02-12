#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\I2cConnectionSettings.ahk
#Include .\I2cTransferResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides ways to open a communications channel to a device on an inter-integrated circuit (I<sup>2</sup> C) bus.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.i2c.ii2cdevicestatics
 * @namespace Windows.Devices.I2c
 * @version WindowsRuntime 1.4
 */
class II2cDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for II2cDevice
     * @type {Guid}
     */
    static IID => Guid("{8636c136-b9c5-4f70-9449-cc46dc6f57eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceId", "get_ConnectionSettings", "Write", "WritePartial", "Read", "ReadPartial", "WriteRead", "WriteReadPartial"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {I2cConnectionSettings} 
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
     * @returns {I2cConnectionSettings} 
     */
    get_ConnectionSettings() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return I2cConnectionSettings(value)
    }

    /**
     * This article helps you to configure the Script Task.
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/integration-services/extending-packages-scripting-task-examples/write-event-log-script-task
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
     * 
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer 
     * @returns {I2cTransferResult} 
     */
    WritePartial(buffer_length, buffer) {
        bufferMarshal := buffer is VarRef ? "char*" : "ptr"

        result_ := I2cTransferResult()
        result := ComCall(9, this, "uint", buffer_length, bufferMarshal, buffer, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Learn how to read a FILESTREAM column to a file using the IBCPSession interface in OLE DB Driver for SQL Server and write a format file with this example.
     * @param {Pointer<Integer>} buffer_length 
     * @param {Pointer<Pointer<Integer>>} buffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/oledb/ole-db-how-to/filestream/read-a-filestream-column-to-file-using-ibcpsession-ole-db
     */
    Read(buffer_length, buffer) {
        buffer_lengthMarshal := buffer_length is VarRef ? "uint*" : "ptr"
        bufferMarshal := buffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, buffer_lengthMarshal, buffer_length, bufferMarshal, buffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} buffer_length 
     * @param {Pointer<Pointer<Integer>>} buffer 
     * @returns {I2cTransferResult} 
     */
    ReadPartial(buffer_length, buffer) {
        buffer_lengthMarshal := buffer_length is VarRef ? "uint*" : "ptr"
        bufferMarshal := buffer is VarRef ? "ptr*" : "ptr"

        result_ := I2cTransferResult()
        result := ComCall(11, this, buffer_lengthMarshal, buffer_length, bufferMarshal, buffer, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} writeBuffer_length 
     * @param {Pointer<Integer>} writeBuffer 
     * @param {Pointer<Integer>} readBuffer_length 
     * @param {Pointer<Pointer<Integer>>} readBuffer 
     * @returns {HRESULT} 
     */
    WriteRead(writeBuffer_length, writeBuffer, readBuffer_length, readBuffer) {
        writeBufferMarshal := writeBuffer is VarRef ? "char*" : "ptr"
        readBuffer_lengthMarshal := readBuffer_length is VarRef ? "uint*" : "ptr"
        readBufferMarshal := readBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(12, this, "uint", writeBuffer_length, writeBufferMarshal, writeBuffer, readBuffer_lengthMarshal, readBuffer_length, readBufferMarshal, readBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} writeBuffer_length 
     * @param {Pointer<Integer>} writeBuffer 
     * @param {Pointer<Integer>} readBuffer_length 
     * @param {Pointer<Pointer<Integer>>} readBuffer 
     * @returns {I2cTransferResult} 
     */
    WriteReadPartial(writeBuffer_length, writeBuffer, readBuffer_length, readBuffer) {
        writeBufferMarshal := writeBuffer is VarRef ? "char*" : "ptr"
        readBuffer_lengthMarshal := readBuffer_length is VarRef ? "uint*" : "ptr"
        readBufferMarshal := readBuffer is VarRef ? "ptr*" : "ptr"

        result_ := I2cTransferResult()
        result := ComCall(13, this, "uint", writeBuffer_length, writeBufferMarshal, writeBuffer, readBuffer_lengthMarshal, readBuffer_length, readBufferMarshal, readBuffer, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
