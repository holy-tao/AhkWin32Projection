#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DataReader.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IDataReaderFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataReaderFactory
     * @type {Guid}
     */
    static IID => Guid("{d7527847-57da-4e15-914c-06806699a098}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDataReader"]

    /**
     * 
     * @param {IInputStream} inputStream 
     * @returns {DataReader} 
     */
    CreateDataReader(inputStream) {
        result := ComCall(6, this, "ptr", inputStream, "ptr*", &dataReader_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataReader(dataReader_)
    }
}
