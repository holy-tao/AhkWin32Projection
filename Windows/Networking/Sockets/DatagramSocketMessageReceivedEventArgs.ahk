#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDatagramSocketMessageReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for a [MessageReceived](datagramsocket_messagereceived.md) event on a [DatagramSocket](datagramsocket.md).
 * @remarks
 * The DatagramSocketMessageReceivedEventArgs is used to receive data on a [DatagramSocket](datagramsocket.md) object.
 * 
 * The [DatagramSocket.BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md) or [DatagramSocket.BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md) method is used to bind a [DatagramSocket](datagramsocket.md) to a local service name or UDP port if a [DatagramSocket](datagramsocket.md) instance wants to listen and receive data. These methods are not needed if the [DatagramSocket](datagramsocket.md) is to be used only for sending data.
 * 
 * A [DatagramSocket.MessageReceived](datagramsocket_messagereceived.md) event occurs on a [DatagramSocket](datagramsocket.md) that has been bound to a local service name or UDP port when a message is received. A DatagramSocketMessageReceivedEventArgs instance is created when the [DatagramSocket.MessageReceived](datagramsocket_messagereceived.md) event occurs.
 * 
 * There are two primary methods to read data when a message has been received:
 * 
 * + The [GetDataStream](datagramsocketmessagereceivedeventargs_getdatastream_1357691687.md) method returns a [Streams.IInputStream](../windows.storage.streams/iinputstream.md) object that represents a sequential stream of bytes in the received message. The app must then parse the received stream of bytes.
 * + The [GetDataReader](datagramsocketmessagereceivedeventargs_getdatareader_509392724.md) method returns a [Streams.DataReader](../windows.storage.streams/datareader.md) object to read incoming data. The [Streams.DataReader](../windows.storage.streams/datareader.md) object has separate methods to read the data in a variety of formats including bytes, signed and unsigned integers, boolean values, single and double floating point numbers, strings, date time and time span values, GUIDs, and buffers. These methods can be used directly to parse the received message.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketmessagereceivedeventargs
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class DatagramSocketMessageReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDatagramSocketMessageReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDatagramSocketMessageReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the IP address of the remote sender of the datagram on the [DatagramSocket](datagramsocket.md) when a message is received.
     * @remarks
     * The DatagramSocketMessageReceivedEventArgs.RemoteAddress property gets the IP address of the remote sender when a datagram was received on a [DatagramSocket](datagramsocket.md). A message received event can only occur after a successful connect or bind operation on the [DatagramSocket](datagramsocket.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketmessagereceivedeventargs.remoteaddress
     * @type {HostName} 
     */
    RemoteAddress {
        get => this.get_RemoteAddress()
    }

    /**
     * Gets the UDP port number of the remote sender of the datagram received on the [DatagramSocket](datagramsocket.md).
     * @remarks
     * The DatagramSocketMessageReceivedEventArgs.RemotePort property gets the UDP port number of the remote sender when a datagram was received on a [DatagramSocket](datagramsocket.md). A message received event can only occur after a successful connect or bind operation on the [DatagramSocket](datagramsocket.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketmessagereceivedeventargs.remoteport
     * @type {HSTRING} 
     */
    RemotePort {
        get => this.get_RemotePort()
    }

    /**
     * Gets the local IP address associated with a [DatagramSocket](datagramsocket.md) when a message was received.
     * @remarks
     * The DatagramSocketMessageReceivedEventArgs.LocalAddress property gets the local IP address where a message was received on a [DatagramSocket](datagramsocket.md). A message received event can only occur after a successful connect or bind operation on the [DatagramSocket](datagramsocket.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketmessagereceivedeventargs.localaddress
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
     * @returns {HostName} 
     */
    get_RemoteAddress() {
        if (!this.HasProp("__IDatagramSocketMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketMessageReceivedEventArgs := IDatagramSocketMessageReceivedEventArgs(outPtr)
        }

        return this.__IDatagramSocketMessageReceivedEventArgs.get_RemoteAddress()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemotePort() {
        if (!this.HasProp("__IDatagramSocketMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketMessageReceivedEventArgs := IDatagramSocketMessageReceivedEventArgs(outPtr)
        }

        return this.__IDatagramSocketMessageReceivedEventArgs.get_RemotePort()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_LocalAddress() {
        if (!this.HasProp("__IDatagramSocketMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketMessageReceivedEventArgs := IDatagramSocketMessageReceivedEventArgs(outPtr)
        }

        return this.__IDatagramSocketMessageReceivedEventArgs.get_LocalAddress()
    }

    /**
     * Gets a [DataReader](../windows.storage.streams/datareader.md) object to read incoming data received from the remote network destination on a [DatagramSocket](datagramsocket.md) object.
     * @returns {DataReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketmessagereceivedeventargs.getdatareader
     */
    GetDataReader() {
        if (!this.HasProp("__IDatagramSocketMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketMessageReceivedEventArgs := IDatagramSocketMessageReceivedEventArgs(outPtr)
        }

        return this.__IDatagramSocketMessageReceivedEventArgs.GetDataReader()
    }

    /**
     * Gets an [IInputStream](../windows.storage.streams/iinputstream.md) object that represents a sequential stream of bytes to be read as a message from the remote network destination on a [DatagramSocket](datagramsocket.md) object.
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketmessagereceivedeventargs.getdatastream
     */
    GetDataStream() {
        if (!this.HasProp("__IDatagramSocketMessageReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketMessageReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketMessageReceivedEventArgs := IDatagramSocketMessageReceivedEventArgs(outPtr)
        }

        return this.__IDatagramSocketMessageReceivedEventArgs.GetDataStream()
    }

;@endregion Instance Methods
}
