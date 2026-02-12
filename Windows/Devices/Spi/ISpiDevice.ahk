#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SpiConnectionSettings.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents SPI device statistics common to SPI devices.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.spi.ispidevicestatics
 * @namespace Windows.Devices.Spi
 * @version WindowsRuntime 1.4
 */
class ISpiDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpiDevice
     * @type {Guid}
     */
    static IID => Guid("{05d5356d-11b6-4d39-84d5-95dfb4c9f2ce}")

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
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {SpiConnectionSettings} 
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
     * @returns {SpiConnectionSettings} 
     */
    get_ConnectionSettings() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpiConnectionSettings(value)
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
     * Learn how to read a FILESTREAM column to a file using the IBCPSession interface in OLE DB Driver for SQL Server and write a format file with this example.
     * @param {Pointer<Integer>} buffer_length 
     * @param {Pointer<Pointer<Integer>>} buffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/connect/oledb/ole-db-how-to/filestream/read-a-filestream-column-to-file-using-ibcpsession-ole-db
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
     * 
     * @param {Integer} writeBuffer_length 
     * @param {Pointer<Integer>} writeBuffer 
     * @param {Pointer<Integer>} readBuffer_length 
     * @param {Pointer<Pointer<Integer>>} readBuffer 
     * @returns {HRESULT} 
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
     * 
     * @param {Integer} writeBuffer_length 
     * @param {Pointer<Integer>} writeBuffer 
     * @param {Pointer<Integer>} readBuffer_length 
     * @param {Pointer<Pointer<Integer>>} readBuffer 
     * @returns {HRESULT} 
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
