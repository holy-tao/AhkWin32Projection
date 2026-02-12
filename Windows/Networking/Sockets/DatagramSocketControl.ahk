#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDatagramSocketControl.ahk
#Include .\IDatagramSocketControl2.ahk
#Include .\IDatagramSocketControl3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides socket control data on a [DatagramSocket](datagramsocket.md) object.
 * @remarks
 * The DatagramSocketControl class provides access to advanced socket control data on a [DatagramSocket](datagramsocket.md) object.
 * 
 * A DatagramSocketControl object is automatically created with the parent [DatagramSocket](datagramsocket.md) object. The [DatagramSocket.Control](datagramsocket_control.md) property provides access to the associated DatagramSocketControl object.
 * 
 * The [OutboundUnicastHopLimit](datagramsocketcontrol_outboundunicasthoplimit.md) property can be set before or after the [DatagramSocket](datagramsocket.md) is bound or connected. Before changing this value on a bound or connected [DatagramSocket](datagramsocket.md), any outgoing packets should first be flushed to ensure that all previously-written data is sent out with the previous hop limit.
 * 
 * Any changes to the other property values on the DatagramSocketControl must be set before the [DatagramSocket](datagramsocket.md) is bound or connected. As a result if you need to make changes to the [DontFragment](datagramsocketcontrol_dontfragment.md), [InboundBufferSizeInBytes](datagramsocketcontrol_inboundbuffersizeinbytes.md), or [QualityOfService](datagramsocketcontrol_qualityofservice.md) properties, then these changes must occur before a successful call to the [BindEndpointAsync](datagramsocket_bindendpointasync_1396029045.md), [BindServiceNameAsync](datagramsocket_bindservicenameasync_440542334.md), or one of the [ConnectAsync](datagramsocket_connectasync_13692504.md) methods on the [DatagramSocket](datagramsocket.md).
 * 
 * The following example creates a [DatagramSocket](datagramsocket.md), and then demonstrates how to set the [QualityOfService](datagramsocketcontrol_qualityofservice.md) property to **LowLatency**. Other properties may be set in a similar manner. After this is done, the app can connect the [DatagramSocket](datagramsocket.md) or send data on the socket.
 * 
 * ```csharp
 * using Windows.Networking.Sockets;
 * 
 * DatagramSocket clientSocket = new DatagramSocket();
 * 
 * // Get the current setting for this option.
 * // This isn't required, but it shows how to get the current setting.
 * var currentSetting = clientSocket.Control.QualityOfService;
 * 
 * // Set QualityOfService to LowLatency.
 * clientSocket.Control.QualityOfService = SocketQualityOfService.LowLatency;
 * 
 * // Now you can call the ConnectAsync method to connect the DatagramSocket.
 * ```
 * 
 * ```cppwinrt
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketcontrol
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class DatagramSocketControl extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDatagramSocketControl

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDatagramSocketControl.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the quality of service on a [DatagramSocket](datagramsocket.md) object.
     * @remarks
     * This QualityOfService property is the quality of service that [DatagramSocket](datagramsocket.md) object should provide. The default value is **normal**.
     * 
     * When the property is set to a value other than **normal**, the socket will follow a policy to provide the specified quality of service. When the property is set to **lowLatency**, this sets the thread priority of the incoming packets to a higher value. The **lowLatency** value would commonly be used for audio or similar apps that are timing sensitive. This property is not normally set for other apps.
     * 
     * This property may be set before the [DatagramSocket](datagramsocket.md) is bound or connected. After the [DatagramSocket](datagramsocket.md) is bound or connected, setting this property will result in an error.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketcontrol.qualityofservice
     * @type {Integer} 
     */
    QualityOfService {
        get => this.get_QualityOfService()
        set => this.put_QualityOfService(value)
    }

    /**
     * Gets or sets the hop limit on an outbound packet sent to a unicast IP address by the [DatagramSocket](datagramsocket.md) object.
     * @remarks
     * This OutboundUnicastHopLimit property is the hop limit set on an outbound datagram packet sent to a unicast IP address using the [DatagramSocket](datagramsocket.md) object. This property is used to set the Time to Live (TTL) field in an IPv4 packet header. This property is used to set the Hop Limit field in an IPv6 header. The default value for this property is 128.
     * 
     * This property can be set before or after the [DatagramSocket](datagramsocket.md) is bound or connected. Before changing this value on a bound or connected [DatagramSocket](datagramsocket.md), any outgoing packets should first be flushed to ensure that all previously-written data is sent out with the previous hop limit.
     * 
     * Setting the [OutboundUnicastHopLimit](streamsocketcontrol_outboundunicasthoplimit.md) may not have an effect if the system doesn't support setting the TTL.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketcontrol.outboundunicasthoplimit
     * @type {Integer} 
     */
    OutboundUnicastHopLimit {
        get => this.get_OutboundUnicastHopLimit()
        set => this.put_OutboundUnicastHopLimit(value)
    }

    /**
     * Gets or sets the size, in bytes, of the buffer used for receiving data on the [DatagramSocket](datagramsocket.md) object.
     * @remarks
     * The InboundBufferSizeInBytes property sets the value of the **SO_RCVBUF** socket option on the TCP socket used by the [DatagramSocket](datagramsocket.md). The default value is the local computer's default receive buffer size. For more detailed information, see [SOL_SOCKET Socket Options](/windows/desktop/WinSock/sol-socket-socket-options) in the Windows Sockets documentation.
     * 
     * This property may be set before the [DatagramSocket](datagramsocket.md) is bound or connected. After the [DatagramSocket](datagramsocket.md) is bound or connected, setting this property will result in an error.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketcontrol.inboundbuffersizeinbytes
     * @type {Integer} 
     */
    InboundBufferSizeInBytes {
        get => this.get_InboundBufferSizeInBytes()
        set => this.put_InboundBufferSizeInBytes(value)
    }

    /**
     * Gets or sets a Boolean value that specifies whether the [DatagramSocket](datagramsocket.md) allows IP datagrams for UDP to be fragmented.
     * @remarks
     * The DontFragment property lets your app decide whether the [DatagramSocket](datagramsocket.md) allows datagrams to be fragmented. The default value is **false** which allows datagrams to be fragmented.
     * 
     * IP datagrams used by UDP require fragmentation when their size exceeds the Maximum Transfer Unit (MTU) of the network transmission hardware. Datagrams may be fragmented by the sending app or by an intermediate router (IPv4 only). If a datagram must be fragmented, and the DontFragment property is set to **true**, the datagram is discarded, and an Internet Control Message Protocol (ICMP) error message is sent back to the sender of the datagram.
     * 
     * This property may be set before the [DatagramSocket](datagramsocket.md) is bound or connected. After the [DatagramSocket](datagramsocket.md) is bound or connected, setting this property will result in an error.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketcontrol.dontfragment
     * @type {Boolean} 
     */
    DontFragment {
        get => this.get_DontFragment()
        set => this.put_DontFragment(value)
    }

    /**
     * Gets or sets a Boolean value that specifies whether the [DatagramSocket](datagramsocket.md) is able to coexist with other Win32 or WinRT multicast sockets bound to the same address/port.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.datagramsocketcontrol.multicastonly
     * @type {Boolean} 
     */
    MulticastOnly {
        get => this.get_MulticastOnly()
        set => this.put_MulticastOnly(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_QualityOfService() {
        if (!this.HasProp("__IDatagramSocketControl")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketControl := IDatagramSocketControl(outPtr)
        }

        return this.__IDatagramSocketControl.get_QualityOfService()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_QualityOfService(value) {
        if (!this.HasProp("__IDatagramSocketControl")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketControl := IDatagramSocketControl(outPtr)
        }

        return this.__IDatagramSocketControl.put_QualityOfService(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OutboundUnicastHopLimit() {
        if (!this.HasProp("__IDatagramSocketControl")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketControl := IDatagramSocketControl(outPtr)
        }

        return this.__IDatagramSocketControl.get_OutboundUnicastHopLimit()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_OutboundUnicastHopLimit(value) {
        if (!this.HasProp("__IDatagramSocketControl")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketControl.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketControl := IDatagramSocketControl(outPtr)
        }

        return this.__IDatagramSocketControl.put_OutboundUnicastHopLimit(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InboundBufferSizeInBytes() {
        if (!this.HasProp("__IDatagramSocketControl2")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketControl2 := IDatagramSocketControl2(outPtr)
        }

        return this.__IDatagramSocketControl2.get_InboundBufferSizeInBytes()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InboundBufferSizeInBytes(value) {
        if (!this.HasProp("__IDatagramSocketControl2")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketControl2 := IDatagramSocketControl2(outPtr)
        }

        return this.__IDatagramSocketControl2.put_InboundBufferSizeInBytes(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DontFragment() {
        if (!this.HasProp("__IDatagramSocketControl2")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketControl2 := IDatagramSocketControl2(outPtr)
        }

        return this.__IDatagramSocketControl2.get_DontFragment()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DontFragment(value) {
        if (!this.HasProp("__IDatagramSocketControl2")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketControl2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketControl2 := IDatagramSocketControl2(outPtr)
        }

        return this.__IDatagramSocketControl2.put_DontFragment(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MulticastOnly() {
        if (!this.HasProp("__IDatagramSocketControl3")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketControl3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketControl3 := IDatagramSocketControl3(outPtr)
        }

        return this.__IDatagramSocketControl3.get_MulticastOnly()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_MulticastOnly(value) {
        if (!this.HasProp("__IDatagramSocketControl3")) {
            if ((queryResult := this.QueryInterface(IDatagramSocketControl3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDatagramSocketControl3 := IDatagramSocketControl3(outPtr)
        }

        return this.__IDatagramSocketControl3.put_MulticastOnly(value)
    }

;@endregion Instance Methods
}
