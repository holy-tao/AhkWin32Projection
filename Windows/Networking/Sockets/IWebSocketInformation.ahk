#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\HostName.ahk
#Include .\BandwidthStatistics.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides socket information on an [IWebSocket](iwebsocket.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketinformation
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IWebSocketInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebSocketInformation
     * @type {Guid}
     */
    static IID => Guid("{5e01e316-c92a-47a5-b25f-07847639d181}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LocalAddress", "get_BandwidthStatistics", "get_Protocol"]

    /**
     * Gets the IP address associated with an [IWebSocket](iwebsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketinformation.localaddress
     * @type {HostName} 
     */
    LocalAddress {
        get => this.get_LocalAddress()
    }

    /**
     * Gets bandwidth information for network data transfer on an [IWebSocket](iwebsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketinformation.bandwidthstatistics
     * @type {BandwidthStatistics} 
     */
    BandwidthStatistics {
        get => this.get_BandwidthStatistics()
    }

    /**
     * Gets the WebSocket sub-protocol negotiated with the server during WebSocket handshake on a [IWebSocket](iwebsocket.md) object.
     * @remarks
     * Both a WebSocket client and a WebSocket server may support multiple sub-protocols. During the WebSocket handshake, the server will select one of the sub-protocols from the mutually supported sub-protocols and reply in the "Sec-WebSocket-Protocol" header. The Protocol property will contain the selected sub-protocol string.
     * 
     * Before the [IWebSocket](iwebsocket.md) is connected, this property is null.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.iwebsocketinformation.protocol
     * @type {HSTRING} 
     */
    Protocol {
        get => this.get_Protocol()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_LocalAddress() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @returns {BandwidthStatistics} 
     */
    get_BandwidthStatistics() {
        value := BandwidthStatistics()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Protocol() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
