#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include .\ServerMessageWebSocketControl.ahk
#Include .\ServerMessageWebSocketInformation.ahk
#Include ..\..\Storage\Streams\IOutputStream.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IServerMessageWebSocket extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServerMessageWebSocket
     * @type {Guid}
     */
    static IID => Guid("{e3ac9240-813b-5efd-7e11-ae2305fc77f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_MessageReceived", "remove_MessageReceived", "get_Control", "get_Information", "get_OutputStream", "add_Closed", "remove_Closed", "CloseWithStatus"]

    /**
     * @type {ServerMessageWebSocketControl} 
     */
    Control {
        get => this.get_Control()
    }

    /**
     * @type {ServerMessageWebSocketInformation} 
     */
    Information {
        get => this.get_Information()
    }

    /**
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

    /**
     * 
     * @param {TypedEventHandler<ServerMessageWebSocket, MessageWebSocketMessageReceivedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_MessageReceived(value) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", value, "ptr", token, "int")
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
    remove_MessageReceived(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ServerMessageWebSocketControl} 
     */
    get_Control() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ServerMessageWebSocketControl(value)
    }

    /**
     * 
     * @returns {ServerMessageWebSocketInformation} 
     */
    get_Information() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ServerMessageWebSocketInformation(value)
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOutputStream(value)
    }

    /**
     * 
     * @param {TypedEventHandler<ServerMessageWebSocket, WebSocketClosedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(value) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", value, "ptr", token, "int")
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

        result := ComCall(12, this, "ptr", token, "int")
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

        result := ComCall(13, this, "ushort", code, "ptr", reason, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
