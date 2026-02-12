#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IServerMessageWebSocketInformation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides socket information on a [ServerMessageWebSocket](servermessagewebsocket.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.servermessagewebsocketinformation
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class ServerMessageWebSocketInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IServerMessageWebSocketInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IServerMessageWebSocketInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets bandwidth information for network data transfer on a [ServerMessageWebSocket](servermessagewebsocket.md) object.
     * 
     * Note that the returned statistics are based on extended TCP statistics, which are enabled by default on Client versions of Windows, but disabled by default for performance reasons on Server versions of Windows. If extended TCP statistics are not available, all returned numerical statistics are set to 0, and boolean statistics are set to false.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.servermessagewebsocketinformation.bandwidthstatistics
     * @type {BandwidthStatistics} 
     */
    BandwidthStatistics {
        get => this.get_BandwidthStatistics()
    }

    /**
     * Gets the WebSocket sub-protocol negotiated with the server during WebSocket handshake on a [ServerMessageWebSocket](servermessagewebsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.servermessagewebsocketinformation.protocol
     * @type {HSTRING} 
     */
    Protocol {
        get => this.get_Protocol()
    }

    /**
     * Gets the IP address associated with a [ServerMessageWebSocket](servermessagewebsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.servermessagewebsocketinformation.localaddress
     * @type {HostName} 
     */
    LocalAddress {
        get => this.get_LocalAddress()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {BandwidthStatistics} 
     */
    get_BandwidthStatistics() {
        if (!this.HasProp("__IServerMessageWebSocketInformation")) {
            if ((queryResult := this.QueryInterface(IServerMessageWebSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerMessageWebSocketInformation := IServerMessageWebSocketInformation(outPtr)
        }

        return this.__IServerMessageWebSocketInformation.get_BandwidthStatistics()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Protocol() {
        if (!this.HasProp("__IServerMessageWebSocketInformation")) {
            if ((queryResult := this.QueryInterface(IServerMessageWebSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerMessageWebSocketInformation := IServerMessageWebSocketInformation(outPtr)
        }

        return this.__IServerMessageWebSocketInformation.get_Protocol()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_LocalAddress() {
        if (!this.HasProp("__IServerMessageWebSocketInformation")) {
            if ((queryResult := this.QueryInterface(IServerMessageWebSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerMessageWebSocketInformation := IServerMessageWebSocketInformation(outPtr)
        }

        return this.__IServerMessageWebSocketInformation.get_LocalAddress()
    }

;@endregion Instance Methods
}
