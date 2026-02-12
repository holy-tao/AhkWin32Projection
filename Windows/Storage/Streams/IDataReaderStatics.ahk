#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\DataReader.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IDataReaderStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataReaderStatics
     * @type {Guid}
     */
    static IID => Guid("{11fcbfc8-f93a-471b-b121-f379e349313c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FromBuffer"]

    /**
     * 
     * @param {IBuffer} buffer_ 
     * @returns {DataReader} 
     */
    FromBuffer(buffer_) {
        result := ComCall(6, this, "ptr", buffer_, "ptr*", &dataReader_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataReader(dataReader_)
    }
}
