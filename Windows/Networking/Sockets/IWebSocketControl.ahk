#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Security\Credentials\PasswordCredential.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides socket control data on an [IWebSocket](iwebsocket.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketcontrol
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IWebSocketControl extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebSocketControl
     * @type {Guid}
     */
    static IID => Guid("{2ec4bdc3-d9a5-455a-9811-de24d45337e9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OutboundBufferSizeInBytes", "put_OutboundBufferSizeInBytes", "get_ServerCredential", "put_ServerCredential", "get_ProxyCredential", "put_ProxyCredential", "get_SupportedProtocols"]

    /**
     * The size, in bytes, of the send buffer to be used for sending data on an [IWebSocket](iwebsocket.md) object.
     * @remarks
     * This property sets the value of the **SO_SNDBUF** socket option on the TCP socket used by the [IWebSocket](iwebsocket.md). The default value is the local computer's default send buffer size. This value varies based on the system memory size. For more detailed information, see [SOL_SOCKET Socket Options](/windows/desktop/WinSock/sol-socket-socket-options) in the Windows Sockets documentation.
     * 
     * For most apps, this property should not be set since this disables TCP send auto-tuning by the system on this [IWebSocket](iwebsocket.md) object. With TCP send auto-tuning disabled, network throughput is often worse especially on a connections with high latency. So this property should only be used in very specific situations.
     * 
     * This property must be set before the [IWebSocket](iwebsocket.md) connection is made. It will not have any effect if set after the connection has been initiated.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketcontrol.outboundbuffersizeinbytes
     * @type {Integer} 
     */
    OutboundBufferSizeInBytes {
        get => this.get_OutboundBufferSizeInBytes()
        set => this.put_OutboundBufferSizeInBytes(value)
    }

    /**
     * The credential to use to authenticate to the WebSocket server through HTTP header authentication using an [IWebSocket](iwebsocket.md) object.
     * @remarks
     * The ServerCredential property must be set before calling the [ConnectAsync](iwebsocket_connectasync_682685111.md) method on the [IWebSocket](iwebsocket.md) object. An attempt to set the ServerCredential property after calling the [ConnectAsync](iwebsocket_connectasync_682685111.md) method will result in an error.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketcontrol.servercredential
     * @type {PasswordCredential} 
     */
    ServerCredential {
        get => this.get_ServerCredential()
        set => this.put_ServerCredential(value)
    }

    /**
     * The credential to use to authenticate to the proxy server through HTTP header authentication using an [IWebSocket](iwebsocket.md) object.
     * @remarks
     * The ProxyCredential property must be set before calling the [ConnectAsync](iwebsocket_connectasync_682685111.md) method on the [IWebSocket](iwebsocket.md) object. An attempt to set the ProxyCredential property after calling the [ConnectAsync](iwebsocket_connectasync_682685111.md) method will result in an error.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketcontrol.proxycredential
     * @type {PasswordCredential} 
     */
    ProxyCredential {
        get => this.get_ProxyCredential()
        set => this.put_ProxyCredential(value)
    }

    /**
     * Gets a collection that can be used to add a list of supported sub-protocols that will be advertised to the server during the connect handshake.
     * @remarks
     * The SupportedProtocols property contains a collection of WebSocket sub-protocols supported by the [IWebSocket](iwebsocket.md) object. Before calling the [ConnectAsync](iwebsocket_connectasync_682685111.md) method, additional supported sub-protocol strings can be added to this collection, which will be sent to the server in the "Sec-WebSocket-Protocol" header during the WebSocket handshake. The protocol chosen by the WebSocket server will then be exposed on the [Protocol](iwebsocketinformation_protocol.md) property.
     * 
     * An attempt to add a sub-protocol to this collection after a successful call to [ConnectAsync](iwebsocket_connectasync_682685111.md) method will result in an error. However, if the [ConnectAsync](iwebsocket_connectasync_682685111.md) method call or the connect operation completes with an error, an appl can update the collection stored in the SupportedProtocols property and retry the [ConnectAsync](iwebsocket_connectasync_682685111.md) method call.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketcontrol.supportedprotocols
     * @type {IVector<HSTRING>} 
     */
    SupportedProtocols {
        get => this.get_SupportedProtocols()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OutboundBufferSizeInBytes() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OutboundBufferSizeInBytes(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ServerCredential() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(value)
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_ServerCredential(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ProxyCredential() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(value)
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_ProxyCredential(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_SupportedProtocols() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }
}
