#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\DataReader.ahk
#Include ..\..\Storage\Streams\IInputStream.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IMessageWebSocketMessageReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMessageWebSocketMessageReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{478c22ac-4c4b-42ed-9ed7-1ef9f94fa3d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MessageType", "GetDataReader", "GetDataStream"]

    /**
     * @type {Integer} 
     */
    MessageType {
        get => this.get_MessageType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DataReader} 
     */
    GetDataReader() {
        result := ComCall(7, this, "ptr*", &dataReader_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataReader(dataReader_)
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    GetDataStream() {
        result := ComCall(8, this, "ptr*", &inputStream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInputStream(inputStream)
    }
}
