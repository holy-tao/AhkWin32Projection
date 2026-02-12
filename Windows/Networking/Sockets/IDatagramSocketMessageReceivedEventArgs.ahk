#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\HostName.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Storage\Streams\DataReader.ahk
#Include ..\..\Storage\Streams\IInputStream.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IDatagramSocketMessageReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDatagramSocketMessageReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{9e2ddca2-1712-4ce4-b179-8c652c6d107e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RemoteAddress", "get_RemotePort", "get_LocalAddress", "GetDataReader", "GetDataStream"]

    /**
     * @type {HostName} 
     */
    RemoteAddress {
        get => this.get_RemoteAddress()
    }

    /**
     * @type {HSTRING} 
     */
    RemotePort {
        get => this.get_RemotePort()
    }

    /**
     * @type {HostName} 
     */
    LocalAddress {
        get => this.get_LocalAddress()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_RemoteAddress() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemotePort() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_LocalAddress() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @returns {DataReader} 
     */
    GetDataReader() {
        result := ComCall(9, this, "ptr*", &dataReader_ := 0, "int")
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
        result := ComCall(10, this, "ptr*", &inputStream := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInputStream(inputStream)
    }
}
