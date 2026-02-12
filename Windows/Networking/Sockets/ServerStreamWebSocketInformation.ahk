#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IServerStreamWebSocketInformation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides socket information on a [ServerStreamWebSocket](serverstreamwebsocket.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.serverstreamwebsocketinformation
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class ServerStreamWebSocketInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IServerStreamWebSocketInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IServerStreamWebSocketInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets bandwidth information for network data transfer on a [ServerStreamWebSocket](serverstreamwebsocket.md) object.
     * 
     * Note that the returned statistics are based on extended TCP statistics, which are enabled by default on Client versions of Windows, but disabled by default for performance reasons on Server versions of Windows. If extended TCP statistics are not available, all returned numerical statistics are set to 0, and boolean statistics are set to false.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.serverstreamwebsocketinformation.bandwidthstatistics
     * @type {BandwidthStatistics} 
     */
    BandwidthStatistics {
        get => this.get_BandwidthStatistics()
    }

    /**
     * Gets the WebSocket sub-protocol negotiated with the server during WebSocket handshake on a [ServerStreamWebSocket](serverstreamwebsocket.md)object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.serverstreamwebsocketinformation.protocol
     * @type {HSTRING} 
     */
    Protocol {
        get => this.get_Protocol()
    }

    /**
     * Gets the IP address associated with a [ServerStreamWebSocket](serverstreamwebsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.serverstreamwebsocketinformation.localaddress
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
        if (!this.HasProp("__IServerStreamWebSocketInformation")) {
            if ((queryResult := this.QueryInterface(IServerStreamWebSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerStreamWebSocketInformation := IServerStreamWebSocketInformation(outPtr)
        }

        return this.__IServerStreamWebSocketInformation.get_BandwidthStatistics()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Protocol() {
        if (!this.HasProp("__IServerStreamWebSocketInformation")) {
            if ((queryResult := this.QueryInterface(IServerStreamWebSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerStreamWebSocketInformation := IServerStreamWebSocketInformation(outPtr)
        }

        return this.__IServerStreamWebSocketInformation.get_Protocol()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_LocalAddress() {
        if (!this.HasProp("__IServerStreamWebSocketInformation")) {
            if ((queryResult := this.QueryInterface(IServerStreamWebSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IServerStreamWebSocketInformation := IServerStreamWebSocketInformation(outPtr)
        }

        return this.__IServerStreamWebSocketInformation.get_LocalAddress()
    }

;@endregion Instance Methods
}
