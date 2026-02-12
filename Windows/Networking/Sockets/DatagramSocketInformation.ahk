#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDatagramSocketInformation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides socket information on a [DatagramSocket](datagramsocket.md) object.
 * @remarks
 * The DatagramSocketInformation class provides information about a [DatagramSocket](datagramsocket.md). This class retrieves information on a [DatagramSocket](datagramsocket.md) and can be called any time after the [DatagramSocket](datagramsocket.md) has been created.
 * 
 * A DatagramSocketInformation object is automatically created with the parent [DatagramSocket](datagramsocket.md) object . The [DatagramSocket.Information](datagramsocket_information.md) property provides access to the associated DatagramSocketInformation object.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketinformation
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class DatagramSocketInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDatagramSocketInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDatagramSocketInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The local IP address associated with a [DatagramSocket](datagramsocket.md) object.
     * @remarks
     * The LocalAddress property represents the local IP address bound to the [DatagramSocket](datagramsocket.md) object.
     * 
     * An app can set the local hostname or IP address to use by calling the [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) , [ConnectAsync(EndpointPair)](datagramsocket_connectasync_13692504.md) , or [GetOutputStreamAsync(EndpointPair)](datagramsocket_getoutputstreamasync_228240991.md) methods on the [DatagramSocket](datagramsocket.md). The bind or connect operation will bind the socket to the specific local IP address and local UDP port number. After the bind or connect operation completes, LocalAddress property contains the IP address and the [LocalPort](datagramsocketinformation_localport.md) property contains the local UDP port number that the local hostname and service name resolved to.
     * 
     * If the local hostname or IP address passed to the [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) , [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md), [ConnectAsync(EndpointPair)](datagramsocket_connectasync_13692504.md) , or [GetOutputStreamAsync(EndpointPair)](datagramsocket_getoutputstreamasync_228240991.md) methods is null or the [ConnectAsync(HostName, String)](datagramsocket_connectasync_1841953676.md) or [GetOutputStreamAsync(HostName, String)](datagramsocket_getoutputstreamasync_1619245957.md) method is called, the system will determine the local IP address to bind to the [DatagramSocket](datagramsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketinformation.localaddress
     * @type {HostName} 
     */
    LocalAddress {
        get => this.get_LocalAddress()
    }

    /**
     * The local service name or UDP port number associated with a [DatagramSocket](datagramsocket.md).
     * @remarks
     * The LocalPort property represents the local service name or UDP port number bound to the [DatagramSocket](datagramsocket.md) object.
     * 
     * An app can set the local service name or UDP port number to use by calling the [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) , [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md), [ConnectAsync(EndpointPair)](datagramsocket_connectasync_13692504.md) , or [GetOutputStreamAsync(EndpointPair)](datagramsocket_getoutputstreamasync_228240991.md) methods on the [DatagramSocket](datagramsocket.md). The bind or connect operation will bind the socket to the specific local IP address and local UDP port number. After the bind or connect operation completes, [LocalAddress](datagramsocketinformation_localaddress.md) property contains the IP address and the LocalPort property contains the local UDP port number that the local hostname and service name resolved to.
     * 
     * If the local service name or UDP port number passed to the [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) , [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md), [ConnectAsync(EndpointPair)](datagramsocket_connectasync_13692504.md) , or [GetOutputStreamAsync(EndpointPair)](datagramsocket_getoutputstreamasync_228240991.md) methods is an empty string or the [ConnectAsync(HostName, String)](datagramsocket_connectasync_1841953676.md) or [GetOutputStreamAsync(HostName, String)](datagramsocket_getoutputstreamasync_1619245957.md) method is called, the system will determine the local UDP port to bind to the [DatagramSocket](datagramsocket.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketinformation.localport
     * @type {HSTRING} 
     */
    LocalPort {
        get => this.get_LocalPort()
    }

    /**
     * The IP address of the remote network destination associated with a [DatagramSocket](datagramsocket.md) object.
     * @remarks
     * The RemoteAddress property represents the remote IP address for the remote network destination associated with a [DatagramSocket](datagramsocket.md) object.
     * 
     * An app can set the remote hostname or IP address and remote service name or UDP port number to use by calling the [ConnectAsync](datagramsocket_connectasync_13692504.md) or [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) method on the [DatagramSocket](datagramsocket.md). The connect operation will bind the socket to a specific remote IP address and remote UDP port number. The RemoteAddress property is the IP address that remote hostname resolved to.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketinformation.remoteaddress
     * @type {HostName} 
     */
    RemoteAddress {
        get => this.get_RemoteAddress()
    }

    /**
     * The UDP port number of the remote network destination associated with a [DatagramSocket](datagramsocket.md) object.
     * @remarks
     * The RemotePort property represents the UDP port number for the remote network destination associated with a [DatagramSocket](datagramsocket.md) object.
     * 
     * An app can set the remote hostname or IP address and remote service name or UDP port number to use by calling the [ConnectAsync](datagramsocket_connectasync_13692504.md) or [GetOutputStreamAsync](datagramsocket_getoutputstreamasync_1619245957.md) method on the [DatagramSocket](datagramsocket.md). The connect operation will bind the socket to a specific remote IP address and remote UDP port number. The RemotePort property is the UDP port number the remote service name resolved to.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketinformation.remoteport
     * @type {HSTRING} 
     */
    RemotePort {
        get => this.get_RemotePort()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_LocalAddress() {
        if (!this.HasProp("__IDatagramSocketInformation")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketInformation := IDatagramSocketInformation(outPtr)
        }

        return this.__IDatagramSocketInformation.get_LocalAddress()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalPort() {
        if (!this.HasProp("__IDatagramSocketInformation")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketInformation := IDatagramSocketInformation(outPtr)
        }

        return this.__IDatagramSocketInformation.get_LocalPort()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_RemoteAddress() {
        if (!this.HasProp("__IDatagramSocketInformation")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketInformation := IDatagramSocketInformation(outPtr)
        }

        return this.__IDatagramSocketInformation.get_RemoteAddress()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemotePort() {
        if (!this.HasProp("__IDatagramSocketInformation")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketInformation := IDatagramSocketInformation(outPtr)
        }

        return this.__IDatagramSocketInformation.get_RemotePort()
    }

;@endregion Instance Methods
}
