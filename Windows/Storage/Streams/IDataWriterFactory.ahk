#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DataWriter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IDataWriterFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataWriterFactory
     * @type {Guid}
     */
    static IID => Guid("{338c67c2-8b84-4c2b-9c50-7b8767847a1f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDataWriter"]

    /**
     * 
     * @param {IOutputStream} outputStream 
     * @returns {DataWriter} 
     */
    CreateDataWriter(outputStream) {
        result := ComCall(6, this, "ptr", outputStream, "ptr*", &dataWriter_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataWriter(dataWriter_)
    }
}
