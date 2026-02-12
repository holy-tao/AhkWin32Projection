#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ServerStreamWebSocketInformation.ahk
#Include ..\..\Storage\Streams\IInputStream.ahk
#Include ..\..\Storage\Streams\IOutputStream.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IServerStreamWebSocket extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServerStreamWebSocket
     * @type {Guid}
     */
    static IID => Guid("{2ced5bbf-74f6-55e4-79df-9132680dfee8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Information", "get_InputStream", "get_OutputStream", "add_Closed", "remove_Closed", "CloseWithStatus"]

    /**
     * @type {ServerStreamWebSocketInformation} 
     */
    Information {
        get => this.get_Information()
    }

    /**
     * @type {IInputStream} 
     */
    InputStream {
        get => this.get_InputStream()
    }

    /**
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

    /**
     * 
     * @returns {ServerStreamWebSocketInformation} 
     */
    get_Information() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ServerStreamWebSocketInformation(value)
    }

    /**
     * 
     * @returns {IInputStream} 
     */
    get_InputStream() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInputStream(value)
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOutputStream(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ServerStreamWebSocket, WebSocketClosedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(value) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", value, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Closed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * MSSQLSERVER_4064
     * @param {Integer} code 
     * @param {HSTRING} reason 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/errors-events/mssqlserver-4064-database-engine-error
     */
    CloseWithStatus(code, reason) {
        if(reason is String) {
            pin := HSTRING.Create(reason)
            reason := pin.Value
        }
        reason := reason is Win32Handle ? NumGet(reason, "ptr") : reason

        result := ComCall(11, this, "ushort", code, "ptr", reason, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
