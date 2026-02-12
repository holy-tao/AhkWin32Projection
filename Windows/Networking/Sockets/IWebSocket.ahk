#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\IOutputStream.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to network communication that allows reading and writing using a WebSocket.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocket
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IWebSocket extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebSocket
     * @type {Guid}
     */
    static IID => Guid("{f877396f-99b1-4e18-bc08-850c9adf156e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OutputStream", "ConnectAsync", "SetRequestHeader", "add_Closed", "remove_Closed", "CloseWithStatus"]

    /**
     * Gets the output stream to write to the remote network destination on a [IWebSocket](iwebsocket.md) object.
     * @remarks
     * This property is used with the [DataWriter](../windows.storage.streams/datawriter.md) object to write outgoing data to be sent to the remote network destination on a socket object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocket.outputstream
     * @type {IOutputStream} 
     */
    OutputStream {
        get => this.get_OutputStream()
    }

    /**
     * 
     * @returns {IOutputStream} 
     */
    get_OutputStream() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IOutputStream(value)
    }

    /**
     * Starts an asynchronous operation to connect to a remote network destination on a [IWebSocket](iwebsocket.md) object.
     * @param {Uri} uri_ An absolute [Uri](../windows.foundation/uri.md) for the server to connect to.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocket.connectasync
     */
    ConnectAsync(uri_) {
        result := ComCall(7, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * Adds an HTTP request header to the HTTP request message used in the WebSocket protocol handshake by the [IWebSocket](iwebsocket.md) object.
     * @param {HSTRING} headerName The name of the request header.
     * @param {HSTRING} headerValue The value of the request header.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocket.setrequestheader
     */
    SetRequestHeader(headerName, headerValue) {
        if(headerName is String) {
            pin := HSTRING.Create(headerName)
            headerName := pin.Value
        }
        headerName := headerName is Win32Handle ? NumGet(headerName, "ptr") : headerName
        if(headerValue is String) {
            pin := HSTRING.Create(headerValue)
            headerValue := pin.Value
        }
        headerValue := headerValue is Win32Handle ? NumGet(headerValue, "ptr") : headerValue

        result := ComCall(8, this, "ptr", headerName, "ptr", headerValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<IWebSocket, WebSocketClosedEventArgs>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(eventHandler) {
        eventCookie := EventRegistrationToken()
        result := ComCall(9, this, "ptr", eventHandler, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return eventCookie
    }

    /**
     * 
     * @param {EventRegistrationToken} eventCookie 
     * @returns {HRESULT} 
     */
    remove_Closed(eventCookie) {
        eventCookie := eventCookie is Win32Handle ? NumGet(eventCookie, "ptr") : eventCookie

        result := ComCall(10, this, "ptr", eventCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Closes the [IWebSocket](iwebsocket.md).
     * @param {Integer} code Status code indicating the reason for closure.
     * @param {HSTRING} reason Optional UTF-8-encoded data with additional information about the closure.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocket.close
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
