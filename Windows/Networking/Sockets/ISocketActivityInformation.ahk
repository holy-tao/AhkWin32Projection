#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SocketActivityContext.ahk
#Include .\DatagramSocket.ahk
#Include .\StreamSocket.ahk
#Include .\StreamSocketListener.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class ISocketActivityInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISocketActivityInformation
     * @type {Guid}
     */
    static IID => Guid("{8d8a42e4-a87e-4b74-9968-185b2511defe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TaskId", "get_Id", "get_SocketKind", "get_Context", "get_DatagramSocket", "get_StreamSocket", "get_StreamSocketListener"]

    /**
     * @type {Guid} 
     */
    TaskId {
        get => this.get_TaskId()
    }

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Integer} 
     */
    SocketKind {
        get => this.get_SocketKind()
    }

    /**
     * @type {SocketActivityContext} 
     */
    Context {
        get => this.get_Context()
    }

    /**
     * @type {DatagramSocket} 
     */
    DatagramSocket {
        get => this.get_DatagramSocket()
    }

    /**
     * @type {StreamSocket} 
     */
    StreamSocket {
        get => this.get_StreamSocket()
    }

    /**
     * @type {StreamSocketListener} 
     */
    StreamSocketListener {
        get => this.get_StreamSocketListener()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TaskId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SocketKind() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SocketActivityContext} 
     */
    get_Context() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SocketActivityContext(value)
    }

    /**
     * 
     * @returns {DatagramSocket} 
     */
    get_DatagramSocket() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DatagramSocket(value)
    }

    /**
     * 
     * @returns {StreamSocket} 
     */
    get_StreamSocket() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StreamSocket(value)
    }

    /**
     * 
     * @returns {StreamSocketListener} 
     */
    get_StreamSocketListener() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StreamSocketListener(value)
    }
}
